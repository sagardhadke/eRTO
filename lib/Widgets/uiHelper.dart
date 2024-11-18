import 'package:rto/Exports/myExports.dart';
import 'package:rto/Utils/Themes/theme_manager.dart';
import 'package:flutter/cupertino.dart';

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
            onTap: () {
              print("object");

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  "Language Feature coming soon",
                ),
                backgroundColor: Colors.green,
                showCloseIcon: true,
              ));
            },
          ),
          ListTile(
              leading: Icon(
                Icons.language,
                color: MyAppColors.buttonPrimary,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Theme"),
                  CupertinoSwitch(
                      activeColor: Colors.blue,
                      trackColor: Colors.blue,
                      value: themeManager.themeMode == ThemeMode.dark,
                      onChanged: (newValue) {
                        themeManager.toggleTheme(newValue);
                        ThemeManager.writePref(newValue);
                        print(
                            "Switching to ${newValue ? 'Dark' : 'Light'} mode");
                        print("Changed Theme");
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
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  "Policy Page coming soon",
                ),
                backgroundColor: Colors.green,
                showCloseIcon: true,
              ));
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
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  "Share Feature coming soon",
                ),
                backgroundColor: Colors.green,
                showCloseIcon: true,
              ));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.text_snippet_outlined,
              color: MyAppColors.buttonPrimary,
            ),
            title: const Text("Terms & Conditions"),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  "Terms & Conditions Feature coming soon",
                ),
                backgroundColor: Colors.green,
                showCloseIcon: true,
              ));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.star,
              color: MyAppColors.buttonPrimary,
            ),
            title: const Text("Rate Us"),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  "Rate Us Feature coming soon",
                ),
                backgroundColor: Colors.green,
                showCloseIcon: true,
              ));
            },
          ),
        ],
      ),
    );
  }

  static Widget shimmerContainer(
      {required double height, required double width, required context}) {
    bool _isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Shimmer.fromColors(
      baseColor: _isDarkMode ? Colors.black12 : Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: height,
        width: width,
        color: Colors.white,
      ),
    );
  }
}
