import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:x_app/data/remote/data_sources/remote_data_source.dart';
import 'package:x_app/data/remote/network/app_api.dart';
import 'package:x_app/data/remote/network/dio_factory.dart';
import 'package:x_app/data/remote/network/network_info.dart';
import 'package:x_app/data/repositories/auth_repository/auth_repo.dart';
import 'package:x_app/data/repositories/auth_repository/auth_repo_impl.dart';
import 'package:x_app/data/repositories/home_repository/home_repo.dart';
import 'package:x_app/data/repositories/home_repository/home_repo_impl.dart';
import 'package:x_app/data/repositories/jobs_repository/jobs_repo.dart';
import 'package:x_app/data/repositories/jobs_repository/jobs_repo_impl.dart';
import 'package:x_app/data/repositories/profile_repository/profile_repo.dart';
import 'package:x_app/data/repositories/profile_repository/profile_repo_impl.dart';
import 'package:x_app/presentation/home/bloc/home_cubit.dart';
import 'package:x_app/presentation/job_details/bloc/job_details_cubit.dart';
import 'package:x_app/presentation/jobs/bloc/jobs_cubit.dart';
import 'package:x_app/presentation/login/bloc/login_cubit.dart';
import 'package:x_app/presentation/profile/bloc/profile_cubit.dart';
import 'package:x_app/presentation/registeration/bloc/registration_cubit.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // app module, its a module where we put all generic dependencies

  // instance.registerLazySingleton<FlutterSecureStorage>(
  //     () => const FlutterSecureStorage());

  // app prefs instance
  // instance
  //     .registerLazySingleton<KeyValueStorage>(() => KeyValueStorage());

  // network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory());

  Dio dio = await instance<DioFactory>().getDio();
  //app service client
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  // instance.registerLazySingleton<RemoteDataSource>(
  //     () => RemoteDataSourceImpl(instance<AppServiceClient>()));

  // local data source
  // instance.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

  // repository

  instance.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(
        networkInfo: instance(),
        remoteDataSource: instance(),
      ));
  instance.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl(
        instance(),
        instance(),
      ));
  instance.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(
        instance(),
        instance(),
      ));
  instance.registerLazySingleton<JobsRepo>(() => JobsRepoImpl(
        instance(),
        instance(),
      ));
  // instance.registerLazySingleton<UserSecureStorage>(() => UserSecureStorage());

  instance.registerLazySingleton<RemoteDataSourceImpl>(
      () => RemoteDataSourceImpl(instance()));

  // instance.registerFactory(() => SignInCubit( instance()));
  instance.registerFactory(
    () => LoginCubit(
      authRepo: instance(),
    ),
  );
  instance.registerFactory(
    () => HomeCubit(
      instance(),
      instance(),
    ),
  );
  instance.registerFactory(
    () => RegistrationCubit(
      instance(),
    ),
  );
  instance.registerFactory(
    () => ProfileCubit(
      instance(),
    ),
  );
  instance.registerFactory(
    () => JobsCubit(
      instance(),
    ),
  );
  instance.registerFactory(
    () => JobDetailsCubit(
      instance(),
    ),
  );
}

// initLoginModule() {
//   if (!GetIt.I.isRegistered<LoginUseCase>()) {
//     instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
//     instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
//   }
// }
//
// initForgotPasswordModule() {
//   if (!GetIt.I.isRegistered<ForgotPasswordUseCase>()) {
//     instance.registerFactory<ForgotPasswordUseCase>(
//         () => ForgotPasswordUseCase(instance()));
//     instance.registerFactory<ForgotPasswordViewModel>(
//         () => ForgotPasswordViewModel(instance()));
//   }
// }
//
// initRegisterModule() {
//   if (!GetIt.I.isRegistered<RegisterUseCase>()) {
//     instance
//         .registerFactory<RegisterUseCase>(() => RegisterUseCase(instance()));
//     instance.registerFactory<RegisterViewModel>(
//         () => RegisterViewModel(instance()));
//     instance.registerFactory<ImagePicker>(() => ImagePicker());
//   }
// }
//
// initHomeModule() {
//   if (!GetIt.I.isRegistered<HomeUseCase>()) {
//     instance.registerFactory<HomeUseCase>(() => HomeUseCase(instance()));
//     instance.registerFactory<HomeViewModel>(() => HomeViewModel(instance()));
//   }
// }
//
// initStoreDetailsModule() {
//   if (!GetIt.I.isRegistered<StoreDetailsUseCase>()) {
//     instance.registerFactory<StoreDetailsUseCase>(
//         () => StoreDetailsUseCase(instance()));
//     instance.registerFactory<StoreDetailsViewModel>(
//         () => StoreDetailsViewModel(instance()));
//   }
// }
