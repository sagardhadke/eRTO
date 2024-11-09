import 'package:dio/dio.dart';
import 'package:rto/Exports/myExports.dart';

class MyDrivingLessons extends StatefulWidget {
  final int? id;
  final String? img;
  const MyDrivingLessons({required this.id, required this.img, super.key});

  @override
  State<MyDrivingLessons> createState() => MyDrivingLessonsState();
}

class MyDrivingLessonsState extends State<MyDrivingLessons> {
  String baseUri = dotenv.env['BASE_URL'] ?? '';
  List<DrivingLessons>? ofDrivingLessons;
  final dio = Dio();

  void fetchDrivingLessons() async {
    try {
      var drivinglessRes =
          await dio.get("$baseUri/single_post?id=${widget.id}");

      if (drivinglessRes.statusCode == 200) {
        Uihelper.logger.d("Lessons Fetched ${ofDrivingLessons?.length}");
        var decodedData = jsonDecode(drivinglessRes.data);
        ofDrivingLessons = DrivingLessons.ofDrivingLessons(decodedData);
        setState(() {});
      } else {
        Uihelper.logger.e("Error Failed to Load API");
      }
    } catch (e) {
      Uihelper.logger.e("Error ${e.toString()}");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDrivingLessons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Uihelper.myText(
              'Driving Lessons', TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: ofDrivingLessons == null
            ? Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : ListView.builder(
                itemCount: ofDrivingLessons!.length,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      Image.asset("${widget.img!}"),
                      Uihelper.myText("${ofDrivingLessons![i].name!}",
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                      Uihelper.myText("Level : ${ofDrivingLessons![i].level!}",
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Uihelper.myText(
                            "Description : ${ofDrivingLessons![i].description!}",
                            TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 17)),
                      ),
                    ],
                  );
                }));
  }
}
