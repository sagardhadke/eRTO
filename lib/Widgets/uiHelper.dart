import 'package:rto/Exports/myExports.dart';
import 'package:rto/Utils/Themes/theme_manager.dart';

class Uihelper {
  static final Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
  );

  // static Widget myText(String text, TextStyle style) {
  //   return Text(text,
  //       style: GoogleFonts.roboto(
  //           textStyle: style, fontWeight: FontWeight.w500, fontSize: 16));
  // }
  static Widget myText(String text, TextStyle? style) {
    //default TextStyle
    TextStyle defaultStyle = GoogleFonts.roboto(
      fontWeight: FontWeight.w500,
      fontSize: 16,
    );

    return Text(
      text,
      style: style ?? defaultStyle,
    );
  }

  static Widget myDrawer(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    return Drawer(
      child: ListView(
        children: [
          Image.asset("Assets/eRTO2.png"),
          ListTile(
            leading: Icon(
              Icons.language,
              color: MyAppColors.buttonPrimary,
            ),
            title: const Text("Language"),
            subtitle: Text("English"),
            onTap: () {},
          ),
          ListTile(
              leading: Icon(
                Icons.language,
                color: MyAppColors.buttonPrimary,
              ),
              title: Row(
                children: [
                  Text("Theme"),
                  Switch(
                      value: themeManager.themeMode == ThemeMode.dark,
                      onChanged: (newValue) {
                        print("Changed Them");
                        themeManager.toggleTheme(newValue);
                      }),
                ],
              )),
          ListTile(
            leading: Icon(
              Icons.local_police,
              color: MyAppColors.buttonPrimary,
            ),
            title: const Text("Privacy Policy"),
            onTap: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => MyAbout()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.share_rounded,
              color: MyAppColors.buttonPrimary,
            ),
            title: const Text("Share With Friends"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.text_snippet_outlined,
              color: MyAppColors.buttonPrimary,
            ),
            title: const Text("Terms & Conditions"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.star,
              color: MyAppColors.buttonPrimary,
            ),
            title: const Text("Rate Us"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
