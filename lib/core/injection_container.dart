import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../features/users/data/providers/github_provider.dart';

import '../features/users/data/providers/github_provider_impl.dart';
import '../features/users/data/repositories/github_repository_impl.dart';
import '../features/users/domain/repositories/github_repository.dart';
import '../features/users/domain/usecases/get_users_usecase.dart';
import 'network/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingleton<Dio>(
    () => apiDioFactory(),
  );

  getIt.registerLazySingleton<GithubProvider>(
    () => GithubProviderImpl(getIt.call()),
  );

  getIt.registerLazySingleton<GithubRepository>(
    () => GithubRepositoryImpl(getIt.call()),
  );

  getIt.registerLazySingleton<GetUsersUseCase>(
    () => GetUsersUseCase(repository: getIt.call()),
  );

  // getIt.registerFactory<TelemetryCubit>(
  //   () => TelemetryCubit(getTelemetryUseCase: getIt.call()),
  // );
}
