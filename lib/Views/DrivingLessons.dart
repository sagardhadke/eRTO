import 'package:dio/dio.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
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
  bool isLoading = true;
  bool _isFirstApiCall = true;

  void fetchDrivingLessons() async {
    try {
      setState(() {
        //for shimmer
        isLoading = true;
      });
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
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _handleRefresh() async {
    fetchDrivingLessons();
  }

  @override
  void initState() {
    super.initState();
    if (Get.find<ConnectivityController>().isConnected) {
      fetchDrivingLessons();
    } else {
      _isFirstApiCall = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Uihelper.myText(
              'Driving Lessons', TextStyle(fontWeight: FontWeight.bold)),
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
                    ? _DrivingLessonsShimmer()
                    : ListView.builder(
                        itemCount: ofDrivingLessons!.length,
                        itemBuilder: (context, i) {
                          return Column(
                            children: [
                              Image.asset("${widget.img!}"),
                              Uihelper.myText(
                                  "${ofDrivingLessons![i].name!}",
                                  TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              Uihelper.myText(
                                  "Level : ${ofDrivingLessons![i].level!}",
                                  TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Uihelper.myText(
                                    "Description : ${ofDrivingLessons![i].description!}",
                                    TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 17)),
                              ),
                            ],
                          );
                        })));
  }

  _DrivingLessonsShimmer() {
    return ListView.builder(itemBuilder: (context, i) {
      return Column(
        children: [
          Uihelper.shimmerContainer(
              height: 250, width: double.infinity, context: context),
          SizedBox(height: 5),
          Uihelper.shimmerContainer(height: 20, width: 120, context: context),
          SizedBox(height: 5),
          Uihelper.shimmerContainer(height: 20, width: 120, context: context),
          SizedBox(height: 5),
          Column(
              children: List.generate(10, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Uihelper.shimmerContainer(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.9,
                  context: context),
            );
          }))
        ],
      );
    });
  }
}
