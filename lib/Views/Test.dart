import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:rto/Exports/myExports.dart';
import 'package:http/http.dart' as http;

class MyTest extends StatefulWidget {
  const MyTest({super.key});

  @override
  State<MyTest> createState() => _MyTestState();
}

class _MyTestState extends State<MyTest> {
  String baseUri = dotenv.env['BASE_URL'] ?? '';
  List<TestCategory>? ofTestCategory;
  bool isLoading = true;

  void getTestdata() async {
    setState(() {
      //for the shimmer effect
      isLoading = true;
    });

    try {
      var testApiRes = await http.get(Uri.parse("$baseUri/test_category_list"));
      if (testApiRes.statusCode == 200) {
        ofTestCategory =
            TestCategory.ofTestCategory(jsonDecode(testApiRes.body));
        Uihelper.logger.d("Test Exam Data Response $ofTestCategory");
        setState(() {});
      }
    } catch (e) {
      Uihelper.logger.e(e.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _handleRefresh() async {
    getTestdata();
  }

  @override
  void initState() {
    super.initState();
    getTestdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Uihelper.myDrawer(context),
      appBar: AppBar(
        title: Uihelper.myText('Exam', TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: LiquidPullToRefresh(
          color: MyAppColors.buttonPrimary,
          height: 150,
          animSpeedFactor: 3,
          showChildOpacityTransition: false,
          onRefresh: _handleRefresh,
          child: Get.find<ConnectivityController>().isConnected == false
              ? NoInternet()
              : isLoading
                  ? _testShimer()
                  : ListView.builder(
                      itemCount: ofTestCategory!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyTermsOfUse(
                                          id: ofTestCategory![index].id)));
                              Uihelper.logger
                                  .d("Id send ${ofTestCategory![index].id}");
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  CachedNetworkImage(
                                      imageUrl:
                                          ofTestCategory![index].catImage!),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Uihelper.myText(
                                            ofTestCategory![index].catName!,
                                            TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18)),
                                        ReadMoreText(ofTestCategory![index]
                                            .description!),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      })),
    );
  }

  _testShimer() {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Uihelper.shimmerContainer(
                      height: 100, width: 100, context: context),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Uihelper.shimmerContainer(
                            height: 20, width: 120, context: context),
                        Uihelper.shimmerContainer(
                            height: 15,
                            width: MediaQuery.of(context).size.width * 0.8,
                            context: context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
