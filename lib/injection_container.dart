import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kamyogya_intern_task/feature/home/data/source/default_home_repo.dart';
import 'feature/home/domain/repository/home_repo.dart';
import 'feature/home/presentation/bloc/home_bloc.dart';

final sl = GetIt.instance;

Future<void> initializationDependencies() async {
  sl.registerSingleton<Dio>(Dio());

// repository
  sl.registerSingleton<HomeRepository>(DefaultHomeRepo(dio: sl()));

// Blocs
  sl.registerFactory<HomeBloc>(() => HomeBloc(sl()));
}
