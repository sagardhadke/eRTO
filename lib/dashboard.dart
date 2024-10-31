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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Dashboard"),
        backgroundColor: MyColors.appBar,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "${baseUri}/category_list",
            style: TextStyle(color: MyColors.textPrimary),
          )
        ],
      ),
    );
  }
}
