import 'package:introduction_screen/introduction_screen.dart';
import 'package:rto/Exports/myExports.dart';

class MyOnBoarding extends StatelessWidget {
  const MyOnBoarding({super.key});

  List<PageViewModel> getPage() {
    return [
      PageViewModel(
        title: "Title of blue page",
        body:
            "Welcome to the app! This is a description on a page with a blue background.",
        image: Center(
          child: Image.network("https://example.com/image.png", height: 175.0),
        ),
        decoration: const PageDecoration(
          pageColor: Colors.blue,
        ),
      ),
      PageViewModel(
          image: Image.asset("Assets/drive1.png"),
          title: 'This is car',
          body:
              'This is body and i am developing the flutter app ok i use the flutter sdk github',
          footer: Text("This is footer text ok")),
      PageViewModel(
          image: Image.asset("Assets/drive2.jpg"),
          title: 'This is Bike',
          body: 'This is not a body provider i use the flutter sdk github',
          footer: Text("This is not a text ok")),
      PageViewModel(
          image: Image.asset("Assets/drive3.png"),
          title: 'This is car',
          body:
              'This is body and i am developing the flutter app ok i use the flutter sdk github',
          footer: Text("This is footer text ok")),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionScreen(
      pages: getPage(),
      showSkipButton: true,
      skip: const Text("Skip"),
      next: const Text("Next"),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w700)),
      onDone: () async {
        // On Done button pressed
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('onBoard', true);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyDashboard()));
      },
      onSkip: () async {
        // On Skip button pressed
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('onBoard', true);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyDashboard()));
      },
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        activeColor: Theme.of(context).colorScheme.secondary,
        color: Colors.black26,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
    ));
  }
}
