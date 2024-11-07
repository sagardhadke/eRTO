import 'Exports/myExports.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({super.key});

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  bool isConnectedToInternet = false;
  bool isLoading = true;

  StreamSubscription? _internetConnectionStreamSubscription;

  int myIndex = 0;
  List<Widget> widgetList = const [MyHome(), MyCategory(), MyTest()];

  @override
  void initState() {
    super.initState();

    //Internet Checker
    _internetConnectionStreamSubscription =
        InternetConnection().onStatusChange.listen((event) {
      switch (event) {
        case InternetStatus.connected:
          setState(() {
            isConnectedToInternet = true;
            isLoading = false;
          });
          break;
        case InternetStatus.disconnected:
          setState(() {
            isConnectedToInternet = false;
            isLoading = false;
          });
          break;
        default:
          setState(() {
            isConnectedToInternet = false;
            isLoading = false;
          });
          break;
      }
    });
  }

  @override
  void dispose() {
    _internetConnectionStreamSubscription?.cancel();
    super.dispose();
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
