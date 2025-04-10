import 'package:d2y_flutter_bloc/presentation/blocs/theme/theme_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  final themeBloc = ThemeBloc();
  locator.registerLazySingleton(() => themeBloc);
}
