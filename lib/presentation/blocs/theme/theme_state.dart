part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  final ThemeData themeData;

  const ThemeState(this.themeData);

  @override
  List<Object> get props => [themeData];
}

class ThemeLight extends ThemeState {
  ThemeLight() : super(ThemeData.light());
}

class ThemeDark extends ThemeState {
  ThemeDark() : super(ThemeData.dark());
}
