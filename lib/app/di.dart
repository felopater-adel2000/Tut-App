import 'package:app/app/app_preferences.dart';
import 'package:app/data/data_sourse/remote_data_sourse.dart';
import 'package:app/data/network/app_api.dart';
import 'package:app/data/network/dio_factory.dart';
import 'package:app/data/network/network_info.dart';
import 'package:app/data/repository/repository_implementer.dart';
import 'package:app/domain/repository/repository.dart';
import 'package:app/domain/usecase/login_usecase.dart';
import 'package:app/presentation/login/viewmodel/login_viewmodel.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async
{
  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  instance.registerLazySingleton<AppPreferences>(() => AppPreferences(instance<SharedPreferences>()));

  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImplementer(InternetConnectionChecker()));

  instance.registerLazySingleton<DioFactory>(() => (DioFactory(instance<AppPreferences>())));

  Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  instance.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImplementation(instance<AppServiceClient>()));

  instance.registerLazySingleton<Repository>(() => RepositoryImplementer(instance<RemoteDataSource>(), instance<NetworkInfo>()));


}

Future<void> initLoginModule() async
{
  if(!GetIt.I.isRegistered<LoginUseCase>())
    {
      instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance<Repository>()));

      instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance<LoginUseCase>()));
    }
}