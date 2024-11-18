import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:rto/Exports/myExports.dart';

class MyOnBoarding extends StatelessWidget {
  const MyOnBoarding({super.key});

  List<PageViewModel> getPage() {
    return [
      PageViewModel(
        image: Lottie.asset(
          "Assets/Anim/onBoard1.json",
          repeat: true,
          fit: BoxFit.fill,
          width: 300,
        ),
        title: 'Welcome to eRTO!',
        body:
            'Your ultimate companion for RTO exams, traffic rules, and driving lessons.',
      ),
      PageViewModel(
        image: Lottie.asset(
          "Assets/Anim/onBoard2.json",
          repeat: true,
          fit: BoxFit.fill,
          width: 350,
          height: 350,
        ),
        title: 'Personalize Your Experience',
        body:
            'Switch between Dark and Light mode for a comfortable app experience.',
      ),
      PageViewModel(
        image: Lottie.asset(
          "Assets/Anim/onBoard3.json",
          repeat: true,
          fit: BoxFit.fill,
          width: 350,
          height: 350,
        ),
        title: 'Learn at Your Own Pace',
        body:
            'From beginner to advanced, choose driving lessons tailored to you.',
      ),
      PageViewModel(
        image: Lottie.asset(
          "Assets/Anim/onBoard4.json",
          repeat: true,
          fit: BoxFit.fill,
          width: 350,
          height: 350,
        ),
        title: 'Prepare for Your RTO Exam',
        body:
            'Master traffic rules and ace your RTO exam with practice tests and quizzes.',
      ),
      PageViewModel(
        image: Lottie.asset(
          "Assets/Anim/onBoard5.json",
          repeat: true,
          fit: BoxFit.fill,
          width: 350,
          height: 350,
        ),
        title: 'Master Driving Techniques',
        body:
            'Get step-by-step instructions on parking, driving maneuvers, and more.',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionScreen(
      bodyPadding: EdgeInsets.only(top: 150),
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
