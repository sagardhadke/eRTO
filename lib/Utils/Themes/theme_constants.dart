import 'package:rto/Exports/myExports.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: MyAppColors.primary,
  cardColor: Colors.white,
  scaffoldBackgroundColor: MyAppColors.primaryBackground,
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  cardColor: Colors.black,
  scaffoldBackgroundColor: Colors.black,
  switchTheme: SwitchThemeData(
    trackColor: MaterialStateProperty.all<Color>(Colors.black),
    thumbColor: MaterialStateProperty.all<Color>(Colors.black),
  ),
);
