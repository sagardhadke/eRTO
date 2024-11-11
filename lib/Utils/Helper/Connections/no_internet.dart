import 'package:lottie/lottie.dart';
import 'package:rto/Exports/myExports.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Center(
              child: Lottie.asset(
                "Assets/Anim/no_internet.json",
                repeat: true,
                fit: BoxFit.fill,
                width: 350,
                height: 350,
              ),
            ),
            Text(
              "Oops, No Internet Connection",
              style: GoogleFonts.roboto(
                  textStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 15)),
                  "Make sure Wifi and Cellular data is turted \n on and then try again."),
            ),
            ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: MyAppColors.appBar),
                onPressed: () {
                  
                },
                child: Text(
                  "Try again",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
