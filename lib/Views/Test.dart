import 'package:cached_network_image/cached_network_image.dart';
import 'package:readmore/readmore.dart';
import 'package:rto/Exports/myExports.dart';
import 'package:http/http.dart' as http;
import 'package:rto/Views/Exam.dart';

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

  @override
  void initState() {
    super.initState();
    getTestdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Uihelper.myText('Exam', TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            isLoading
                ? Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : Expanded(
                    child: ListView.builder(
                        itemCount: ofTestCategory!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyExam(
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
                        }),
                  )
          ],
        ));
  }
}
