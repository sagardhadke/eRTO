import 'Exports/myExports.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({super.key});

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  int myIndex = 0;
  List<Widget> widgetList = const [MyHome(), MyCategory(), MyTest()];

  static Future<bool> readPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('ofTheme') ?? false;
  }

  @override
  void initState() {
    super.initState();
    //theme status
    readPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: widgetList,
        index: myIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: MyAppColors.primary,
          onTap: (index) {
            setState(() {
              myIndex = index;
            });
          },
          currentIndex: myIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.category_rounded), label: 'Category'),
            BottomNavigationBarItem(
                icon: Icon(Icons.text_snippet_outlined), label: 'Exam'),
          ]),
    );
  }
}
