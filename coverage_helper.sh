flutter test --coverage

lcov --remove coverage/lcov.info \
  '**/*.g.dart' \
  '**/*.freezed.dart' \
  '**/generated/**' \
  '**/l10n/**' \
  '**/firebase_options.dart' \
  -o coverage/lcov_cleaned.info

genhtml coverage/lcov_cleaned.info -o coverage/html