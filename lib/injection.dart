import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:finance_news/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

@injectableInit
Future configureInjection(String environment) async {
  await $initGetIt(
    getIt,
    environment: environment,
  );
}

@module
abstract class RegisterModule {
  @lazySingleton
  DataConnectionChecker get connectionChecker => DataConnectionChecker();

  @lazySingleton
  http.Client get client => http.Client();

  @preResolve
  @lazySingleton
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
