import 'dart:ui';

import 'package:http/http.dart' as http;
import 'Exports/myExports.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({super.key});

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  String baseUri = dotenv.env['BASE_URL'] ?? '';
  List<CategoryList>? ofCategoryList;
  bool isConnectedToInternet = false;
  bool isLoading = true;

  StreamSubscription? _internetConnectionStreamSubscription;

  int myIndex = 0;
  List<Widget> widgetList = const [MyHome(), MyCategory(), MyTest()];

  void getCategoryList() async {
    try {
      var categoriesResponse =
          await http.get(Uri.parse("${baseUri}/category_list"));
      if (categoriesResponse.statusCode == 200) {
        ofCategoryList =
            CategoryList.ofCategoryList(jsonDecode(categoriesResponse.body));
        setState(() {});
        Uihelper.logger.d("Category List API Response $ofCategoryList");
      } else {
        Uihelper.logger.e("Failed to Load API, Please Try Again Later");
      }
    } catch (e) {
      Uihelper.logger.e("${e.toString()}");
    }
  }

  @override
  void initState() {
    super.initState();
    getCategoryList();

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
      body: isLoading
          ? Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : isConnectedToInternet
              ? IndexedStack(
                  children: widgetList,
                  index: myIndex,
                )
              : NoInternet(),
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
                icon: Icon(Icons.text_snippet_outlined), label: 'Test'),
          ]),
    );
  }
}
