import 'package:rto/Exports/myExports.dart';

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

  static Widget myDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiUN2ts0AQPmXrBUzO0RNmA6DZWh1fbD5DcA&s"),
          ListTile(
            title: Text("About"),
          ),
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
