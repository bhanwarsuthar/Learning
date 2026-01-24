#!/bin/bash

# Script to generate and open code coverage report

echo "🧪 Running tests with coverage..."
flutter test --coverage

if [ $? -ne 0 ]; then
    echo "❌ Tests failed. Please fix test errors before generating coverage report."
    exit 1
fi

echo "🧹 Cleaning coverage data..."
lcov --remove coverage/lcov.info \
  '**/*.g.dart' \
  '**/*.freezed.dart' \
  '**/generated/**' \
  '**/l10n/**' \
  '**/firebase_options.dart' \
  -o coverage/lcov_cleaned.info 2>/dev/null || true

echo "📊 Generating HTML coverage report..."
genhtml coverage/lcov_cleaned.info -o coverage/html 2>/dev/null || genhtml coverage/lcov.info -o coverage/html

if [ $? -eq 0 ]; then
    echo "✅ Coverage report generated successfully!"
    echo "📁 Report location: coverage/html/index.html"
    
    # Get absolute path
    ABS_PATH="$(cd "$(dirname "$0")" && pwd)/coverage/html/index.html"
    
    echo ""
    echo "🌐 Opening coverage report in browser..."
    
    # Try to open in default browser
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        open "$ABS_PATH" 2>/dev/null || open "file://$ABS_PATH" 2>/dev/null || echo "Please open: file://$ABS_PATH"
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux
        xdg-open "file://$ABS_PATH" 2>/dev/null || echo "Please open: file://$ABS_PATH"
    elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
        # Windows
        start "file://$ABS_PATH" 2>/dev/null || echo "Please open: file://$ABS_PATH"
    else
        echo "Please open: file://$ABS_PATH"
    fi
    
    echo ""
    echo "📊 Coverage Summary:"
    echo "==================="
    if command -v lcov &> /dev/null; then
        lcov --summary coverage/lcov_cleaned.info 2>/dev/null || lcov --summary coverage/lcov.info 2>/dev/null | grep -A 3 "lines\|functions\|branches" || echo "Run 'lcov --summary coverage/lcov.info' for details"
    fi
    
    echo ""
    echo "✅ Done! Coverage report is available at:"
    echo "   file://$ABS_PATH"
else
    echo "❌ Failed to generate coverage report. Make sure 'genhtml' (lcov) is installed."
    echo "   Install with: brew install lcov (macOS) or apt-get install lcov (Linux)"
    exit 1
fi
