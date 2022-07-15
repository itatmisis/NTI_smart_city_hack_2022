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


  TextStyle custom_banner_big_text = TextStyle(fontSize: 20, color: Color(0xFFFFFFFF), fontWeight: FontWeight.w600);
  Color custom_banner_white_button = Color(0xFFFFFFFF);




  Color accent = Color(0xFF7E59E7);
}