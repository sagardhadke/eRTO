import 'package:http/http.dart' as http;
import 'package:rto/Exports/myExports.dart';

class MyCategory extends StatefulWidget {
  const MyCategory({super.key});

  @override
  State<MyCategory> createState() => _MyCategoryState();
}

class _MyCategoryState extends State<MyCategory> {
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
      drawer: Uihelper.myDrawer(context),
      appBar: AppBar(
        title:
            Uihelper.myText('Category', TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ofCategoryList == null
          ? Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : Padding(
              padding: const EdgeInsets.all(5.0),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 60,
                      crossAxisSpacing: 15),
                  itemCount: ofCategoryList!.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 2,
                          color: Colors.white,
                        ),
                        Positioned(
                          top: -50,
                          child: CachedNetworkImage(
                              height: 100,
                              width: 100,
                              fit: BoxFit.contain,
                              imageUrl: '${ofCategoryList![index].catImage!}'),
                        ),
                        Positioned(
                            bottom: 100,
                            child: Text(
                              textAlign: TextAlign.center,
                              "${ofCategoryList![index].catName!}",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: MyAppColors.primary),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: ReadMoreText(
                              textAlign: TextAlign.center,
                              isExpandable: true,
                              trimLines: 3,
                              trimMode: TrimMode.Line,
                              style: TextStyle(fontSize: 15),
                              '${ofCategoryList![index].description!}'),
                        ),
                      ],
                    );
                  }),
            ),
    );
  }
}
