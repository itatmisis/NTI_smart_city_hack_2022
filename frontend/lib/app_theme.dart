import 'dart:ui';

class AppTheme {
  static AppTheme _appTheme = AppTheme._newInstance();

  AppTheme._newInstance();

  factory AppTheme() {
    return _appTheme;
  }

  double buttonBorderRadius = 8;

  Color light_field_background = Color(0xFFF2F3F5);
  Color light_field_border = Color(0xFFF2F3F5);

  Color light_background_light = Color(0xFFF9F9F9);

  Color light_search_bar_field_background = Color(0xFFEBEDF0);
  Color light_search_bar_text_hint = Color(0xFF818C99);

  Color accent = Color(0xFF7E59E7);
}