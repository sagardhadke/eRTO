import 'package:rto/Exports/myExports.dart';

class MyFour_Wheeler_Tips extends StatelessWidget {
  const MyFour_Wheeler_Tips({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Uihelper.myText(
            'Four Wheeler Tip', TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
          itemCount: Drivingtip.drivingTips.length,
          itemBuilder: (context, i) {
            return ListTile(
                title: Uihelper.myText(Drivingtip.drivingTips![i]['title']!,
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                subtitle: Uihelper.myText(
                    Drivingtip.drivingTips![i]['description']!,
                    TextStyle(fontWeight: FontWeight.w700)));
          }),
    );
  }
}
