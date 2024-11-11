import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:rto/Exports/myExports.dart';
import 'package:rto/Utils/Themes/theme_manager.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

ThemeManager _themeManager = ThemeManager();

class _MyHomeState extends State<MyHome> {
  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
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
    await Future.delayed(const Duration(seconds: 3));
    print('Refresh completed!');
  }

  @override
  Widget build(BuildContext context) {
    // TextTheme _textTheme = Theme.of(context).textTheme;
    // bool isDark = Theme.of(context).brightness == Brightness.dark;

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
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Uihelper.myText("Driving Lessons",
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              // _imageSlider(),
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
                  MaterialPageRoute(
                      builder: (context) => MyDrivingLessons(
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
                  MaterialPageRoute(
                      builder: (context) => MyDrivingLessons(
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
                  MaterialPageRoute(
                      builder: (context) => MyDrivingLessons(
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

  Widget _imageSlider() {
    return ImageSlideshow(
      indicatorColor: Colors.blue,
      autoPlayInterval: 3000,
      isLoop: true,
      children: [
        GestureDetector(
          onTap: () {
            debugPrint('Click');
          },
          child: Image.asset(
            'Assets/drive1.png',
            fit: BoxFit.cover,
          ),
        ),
        GestureDetector(
          onTap: () {
            debugPrint('Click');
          },
          child: Image.asset(
            'Assets/drive2.jpg',
            fit: BoxFit.cover,
          ),
        ),
        GestureDetector(
          onTap: () {
            debugPrint('Click');
          },
          child: Image.asset(
            'Assets/drive3.png',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Widget _homeIntro() {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MyFour_Wheeler_Tips()));
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
                    MaterialPageRoute(
                        builder: (context) =>
                            Texthelper.myTopFeatures[i]['onTap']));
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
}
