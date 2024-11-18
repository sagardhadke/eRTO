import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rto/Exports/myExports.dart';
// import 'package:rto/Utils/Themes/theme_manager.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  bool isLoading = true;

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 2000), () {
      _homeShimmer();
      setState(() {
        isLoading = false;
      });
    });

    Timer.periodic(Duration(seconds: 3), (time) {
      if (currentPage < 2) {
        currentPage++;
      } else {
        currentPage = 0;
      }

      controller.animateToPage(currentPage,
          duration: Duration(milliseconds: 3), curve: Curves.easeIn);
    });
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  int currentPage = 0;
  PageController controller = PageController(viewportFraction: 1.0);

  Future<void> _handleRefresh() async {
    print('Refreshing...');
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    print('Refresh completed!');
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      drawer: Uihelper.myDrawer(context),
      appBar: AppBar(
        title: Uihelper.myText('Home', TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: LiquidPullToRefresh(
          color: MyAppColors.buttonPrimary,
          height: 150,
          animSpeedFactor: 3,
          showChildOpacityTransition: false,
          onRefresh: _handleRefresh,
          child:
           isLoading
              ? _homeShimmer()
              : ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Uihelper.myText("Driving Lessons",
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    ),
                    _custPageView(),
                    _homeIntro(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Uihelper.myText("Top Features",
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    ),
                    _topFeatures(),
                  ],
                )),
    );
  }

  Widget _custPageView() {
    return SizedBox(
      height: 200,
      child: PageView(
        controller: controller,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: MyDrivingLessons(
                        id: 1,
                        img: "Assets/drive1.png",
                      )));
            },
            child: Stack(
              children: [
                Image.asset(
                  width: double.infinity,
                  'Assets/drive1.png',
                  fit: BoxFit.cover,
                ),
                Positioned(
                    bottom: 20,
                    left: 20,
                    child: Text(
                      "Beginner",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ))
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRight,
                      child: MyDrivingLessons(
                        id: 2,
                        img: "Assets/drive2.jpg",
                      )));
            },
            child: Stack(
              children: [
                Image.asset(
                  width: double.infinity,
                  'Assets/drive2.jpg',
                  fit: BoxFit.cover,
                ),
                Positioned(
                    bottom: 20,
                    left: 20,
                    child: Text(
                      "Intermediate",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ))
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: MyDrivingLessons(
                        id: 3,
                        img: "Assets/drive3.png",
                      )));
            },
            child: Stack(
              children: [
                Image.asset(
                  width: double.infinity,
                  'Assets/drive3.png',
                  fit: BoxFit.cover,
                ),
                Positioned(
                    bottom: 20,
                    left: 20,
                    child: Text(
                      "Advanced",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _homeIntro() {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: GestureDetector(
        onTap: () {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => MyFour_Wheeler_Tips()));
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.bottomToTop,
                  child: MyFour_Wheeler_Tips()));
        },
        child: Card(
          elevation: 10,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Uihelper.myText("Four Wheeler",
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    Uihelper.myText(
                        "Get four-wheeler \ninformation and advice \nfor a smooth ride",
                        TextStyle(fontSize: 17))
                  ],
                ),
              ),
              Image.asset(
                  width: MediaQuery.sizeOf(context).width / 03,
                  height: 100,
                  "Assets/mycar.png")
            ],
          ),
        ),
      ),
    );
  }

  Widget _topFeatures() {
    bool _isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: Texthelper.myTopFeatures.length,
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () {
                print("Click");
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: Texthelper.myTopFeatures[i]['onTap']));
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) =>
                //             Texthelper.myTopFeatures[i]['onTap']));
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width / 03,
                decoration: BoxDecoration(
                    color: _isDarkMode ? Colors.black : Colors.white,
                    border: _isDarkMode
                        ? null
                        : Border.all(width: 0.5, color: Colors.grey)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Image.asset(
                          height: 75,
                          width: 100,
                          "${Texthelper.myTopFeatures[i]['image']}"),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          textAlign: TextAlign.center,
                          "${Texthelper.myTopFeatures[i]['name']}",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  _homeShimmer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Uihelper.shimmerContainer(height: 20, width: 120, context: context),
        SizedBox(height: 5),
        Uihelper.shimmerContainer(
            height: 250,
            width: MediaQuery.sizeOf(context).width / 0.9,
            context: context),
        SizedBox(height: 10),
        Uihelper.shimmerContainer(
            height: 150,
            width: MediaQuery.sizeOf(context).width / 0.8,
            context: context),
        SizedBox(height: 10),
        Uihelper.shimmerContainer(height: 20, width: 120, context: context),
        SizedBox(height: 10),
        Row(
            children: List.generate(3, (index) {
          return Uihelper.shimmerContainer(
              height: 100, width: 100, context: context);
        }))
      ],
    );
  }
}
