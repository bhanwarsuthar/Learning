#!/bin/bash

# Script to generate a standalone HTML coverage report for GitHub Pages

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
  -o coverage/lcov_cleaned.info 2>/dev/null || cp coverage/lcov.info coverage/lcov_cleaned.info

echo "📊 Generating HTML coverage report..."
genhtml coverage/lcov_cleaned.info -o coverage/html 2>/dev/null || genhtml coverage/lcov.info -o coverage/html

if [ $? -ne 0 ]; then
    echo "❌ Failed to generate coverage report. Make sure 'genhtml' (lcov) is installed."
    exit 1
fi

echo "📦 Creating standalone coverage report for GitHub Pages..."

# Create a standalone HTML file that embeds the coverage report
STANDALONE_FILE="coverage_standalone.html"

cat > "$STANDALONE_FILE" << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Code Coverage Report - Learning Flutter App</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }
        
        .container {
            max-width: 1400px;
            margin: 0 auto;
            background: white;
            border-radius: 12px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            overflow: hidden;
        }
        
        .header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px;
            text-align: center;
        }
        
        .header h1 {
            font-size: 2.5em;
            margin-bottom: 10px;
        }
        
        .header p {
            opacity: 0.9;
            font-size: 1.1em;
        }
        
        .content {
            padding: 30px;
        }
        
        .actions {
            display: flex;
            gap: 15px;
            justify-content: center;
            flex-wrap: wrap;
            margin-bottom: 30px;
        }
        
        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-block;
            font-weight: 600;
            color: white;
        }
        
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }
        
        .iframe-container {
            width: 100%;
            height: 85vh;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            overflow: hidden;
            background: #f5f5f5;
        }
        
        .iframe-container iframe {
            width: 100%;
            height: 100%;
            border: none;
        }
        
        .info-box {
            background: #f8f9fa;
            border-left: 4px solid #667eea;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 4px;
        }
        
        .info-box h3 {
            color: #667eea;
            margin-bottom: 10px;
        }
        
        .footer {
            text-align: center;
            padding: 20px;
            color: #6c757d;
            font-size: 0.9em;
        }
        
        .status-badge {
            display: inline-block;
            padding: 5px 15px;
            border-radius: 20px;
            font-size: 0.9em;
            font-weight: 600;
            margin-left: 10px;
        }
        
        .status-success {
            background: #d4edda;
            color: #155724;
        }
        
        .status-warning {
            background: #fff3cd;
            color: #856404;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>📊 Code Coverage Report</h1>
            <p>Learning Flutter App - MVVM Architecture</p>
            <p style="margin-top: 10px; font-size: 0.9em;">
                Generated: <span id="generatedDate"></span>
                <span class="status-badge status-success" id="statusBadge">Live</span>
            </p>
        </div>
        
        <div class="content">
            <div class="info-box">
                <h3>ℹ️ Coverage Report Information</h3>
                <p>This is a standalone coverage report generated for GitHub Pages.</p>
                <p><strong>Note:</strong> To update this report, run <code>./generate_coverage_standalone.sh</code> and commit the updated file.</p>
            </div>
            
            <div class="actions">
                <a href="https://github.com/bhanwarsuthar/Learning" target="_blank" class="btn btn-primary">📂 View Repository</a>
                <a href="coverage_viewer.html" class="btn btn-primary">🔄 Interactive Viewer</a>
            </div>
            
            <div class="iframe-container">
                <iframe id="coverageFrame" src="about:blank" title="Coverage Report"></iframe>
            </div>
        </div>
        
        <div class="footer">
            <p>Generated by LCOV | Last updated: <span id="lastUpdate"></span></p>
        </div>
    </div>
    
    <script>
        // Try to load the coverage report from different possible locations
        const possiblePaths = [
            'coverage/html/index.html',
            '../coverage/html/index.html',
            './coverage/html/index.html',
            'https://raw.githubusercontent.com/bhanwarsuthar/Learning/main/coverage/html/index.html'
        ];
        
        const iframe = document.getElementById('coverageFrame');
        const generatedDateSpan = document.getElementById('generatedDate');
        const lastUpdateSpan = document.getElementById('lastUpdate');
        
        // Set current date
        const now = new Date();
        generatedDateSpan.textContent = now.toLocaleString();
        lastUpdateSpan.textContent = now.toLocaleString();
        
        // Function to try loading coverage from a path
        function tryLoadCoverage(paths, index = 0) {
            if (index >= paths.length) {
                // All paths failed, show error message
                iframe.srcdoc = `
                    <!DOCTYPE html>
                    <html>
                    <head>
                        <style>
                            body {
                                font-family: Arial, sans-serif;
                                padding: 50px;
                                text-align: center;
                                background: #f5f5f5;
                            }
                            .error-box {
                                background: white;
                                padding: 30px;
                                border-radius: 8px;
                                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                                max-width: 600px;
                                margin: 0 auto;
                            }
                            h2 { color: #dc3545; margin-bottom: 20px; }
                            code {
                                background: #f8f9fa;
                                padding: 10px;
                                border-radius: 4px;
                                display: block;
                                margin: 20px 0;
                                font-family: monospace;
                            }
                        </style>
                    </head>
                    <body>
                        <div class="error-box">
                            <h2>📄 Coverage Report Not Found</h2>
                            <p>The coverage report has not been generated or uploaded to GitHub Pages.</p>
                            <p>To generate and view the coverage report:</p>
                            <ol style="text-align: left; margin: 20px 0;">
                                <li>Clone the repository locally</li>
                                <li>Run: <code>./generate_coverage_standalone.sh</code></li>
                                <li>Commit and push the generated files</li>
                                <li>Or use the interactive viewer: <code>coverage_viewer.html</code></li>
                            </ol>
                            <p style="margin-top: 20px; color: #6c757d;">
                                For local development, run: <code>./view_coverage.sh</code>
                            </p>
                        </div>
                    </body>
                    </html>
                `;
                return;
            }
            
            const path = paths[index];
            
            // Create a test iframe to check if the path exists
            const testFrame = document.createElement('iframe');
            testFrame.style.display = 'none';
            testFrame.src = path;
            
            testFrame.onload = function() {
                // If loaded successfully, use this path
                iframe.src = path;
                document.getElementById('statusBadge').textContent = 'Loaded';
            };
            
            testFrame.onerror = function() {
                // Try next path
                tryLoadCoverage(paths, index + 1);
            };
            
            // Timeout after 3 seconds
            setTimeout(() => {
                if (iframe.src === 'about:blank') {
                    tryLoadCoverage(paths, index + 1);
                }
            }, 3000);
            
            // Try to load directly
            fetch(path, { method: 'HEAD', mode: 'no-cors' })
                .then(() => {
                    iframe.src = path;
                    document.getElementById('statusBadge').textContent = 'Loaded';
                })
                .catch(() => {
                    tryLoadCoverage(paths, index + 1);
                });
        }
        
        // Start trying to load coverage
        tryLoadCoverage(possiblePaths);
        
        // Fallback: Try to load from embedded data if available
        // This would require the coverage HTML to be embedded in this file
    </script>
</body>
</html>
EOF

echo "✅ Standalone coverage file created: $STANDALONE_FILE"
echo ""
echo "📝 Next steps for GitHub Pages:"
echo "   1. Review the generated file: $STANDALONE_FILE"
echo "   2. Copy coverage/html/* files to a docs/ or coverage/ folder in your repo"
echo "   3. Commit and push: git add $STANDALONE_FILE && git commit -m 'Add standalone coverage' && git push"
echo ""
echo "💡 Alternative: Use GitHub Actions to auto-generate coverage on each push"
