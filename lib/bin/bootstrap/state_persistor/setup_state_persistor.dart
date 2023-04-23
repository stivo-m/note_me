import 'package:async_redux/async_redux.dart';
import 'package:note_it/app/application/states/states/app_state.dart';
import 'package:note_it/app/domain/constants/enums.dart';
import 'package:note_it/app/domain/constants/strings.dart';
import 'package:note_it/app/infrastructure/repositories/local/database/app_state_persistor.dart';

Future<Store<AppState>> setupStatePersistence({
  AppContext appContext = AppContext.development,
}) async {
  // Initialize the database and retrieve necessary state values
  final NoteMeStateDatabase stateDB = NoteMeStateDatabase(
    dataBaseName: AppStrings.getDatabaseName(appContext),
  );

  /// initialize the database
  await stateDB.init();

  /// retrieve state from the database
  final AppState initialState = await stateDB.readState();

  /// initialize a fresh database if [initialState] is `null`,
  /// and populate the database with the default values for each state
  if (initialState == AppState.initial()) {
    await stateDB.saveInitialState(initialState);
  }

  final Store<AppState> store = Store<AppState>(
    initialState: initialState,
    defaultDistinct: true,
  );

  return store;
}
