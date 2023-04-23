# run tests
.PHONY: test
test:
	rm -rf coverage* && \
	flutter analyze && flutter test --coverage test/ && \
	lcov --remove coverage/lcov.info 'lib/**/*.g.dart' -o coverage/lcov.info && \
	lcov --remove coverage/lcov.info 'lib/app/infrastructure/repositories/local/database/sqlite_init.dart' -o coverage/lcov.info \
	lcov --remove coverage/lcov.info 'lib/app/presentation/pages/dashboard/note_editor/note_editor_page.dart' -o coverage/lcov.info \
	lib/app/infrastructure/repositories/local/database/note_me_mobile_database.dart \
    lcov --remove coverage/lcov.info 'lib/**/*.freezed.dart' -o coverage/lcov.info && \
    genhtml -q -o coverage coverage/lcov.info && \
	google-chrome coverage/index.html

.PHONY: fvm_test
fvm_test:
	rm -rf coverage* && \
	fvm flutter analyze && fvm flutter test --coverage test/ && \
	lcov --remove coverage/lcov.info 'lib/**/*.g.dart' -o coverage/lcov.info && \
	lcov --remove coverage/lcov.info 'lib/app/infrastructure/repositories/local/database/sqlite_init.dart' -o coverage/lcov.info \
	lcov --remove coverage/lcov.info 'lib/app/presentation/pages/dashboard/note_editor/note_editor_page.dart' -o coverage/lcov.info \
	lib/app/infrastructure/repositories/local/database/note_me_mobile_database.dart \
    lcov --remove coverage/lcov.info 'lib/**/*.freezed.dart' -o coverage/lcov.info && \
    genhtml -q -o coverage coverage/lcov.info && \
	google-chrome coverage/index.html

.PHONY: fvm_generate
fvm_generate:
	fvm flutter pub run build_runner build --delete-conflicting-outputs


# Generate app icons for each platform
.PHONY: generate-icons
generate-icons:
	fvm flutter pub run flutter_launcher_icons:main -f lib/bin/configs/icons/flutter_launcher_icons*