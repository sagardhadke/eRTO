import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:rto/Utils/Helper/Connections/no_internet.dart';
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

  StreamSubscription? _internetConnectionStreamSubscription;

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
          });
          break;
        case InternetStatus.disconnected:
          setState(() {
            isConnectedToInternet = false;
          });
          break;
        default:
          setState(() {
            isConnectedToInternet = false;
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
      appBar: AppBar(
        title: Text("My Dashboard"),
        backgroundColor: MyColors.appBar,
      ),
      body: isConnectedToInternet ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
         
        ],
      ) : NoInternet()
    );
  }
}
