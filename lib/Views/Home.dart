import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:rto/Exports/myExports.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 3), (time) {
      if (currentPage < 2) {
        currentPage++;
      } else {
        currentPage = 0;
      }

      controller.animateToPage(currentPage,
          duration: Duration(seconds: 3), curve: Curves.easeIn);
    });
    super.initState();
  }

  int currentPage = 0;
  PageController controller = PageController(viewportFraction: 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Uihelper.myDrawer(context),
      appBar: AppBar(
          title:
              Uihelper.myText('Home', TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: Colors.white),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
      ]),
    );
  }

  Widget _custPageView() {
    return Expanded(
      child: PageView(
        controller: controller,
        children: [
          GestureDetector(
            onTap: () {
              debugPrint('Click');
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
              debugPrint('Click');
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
              debugPrint('Click');
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
            Image.asset(height: 100, "Assets/mycar.png")
          ],
        ),
      ),
    );
  }

  Widget _topFeatures() {
    return Expanded(
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
                    color: Colors.white,
                    border: Border.all(width: 0.5, color: Colors.grey)),
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
