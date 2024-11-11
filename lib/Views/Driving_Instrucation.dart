import 'package:rto/Exports/myExports.dart';

class MyDriving_Instruction extends StatelessWidget {
  const MyDriving_Instruction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Uihelper.myText(
            'Driving Instruction', TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView.builder(
          itemCount: DrivingInstructions.drivingInstructions.length,
          itemBuilder: (context, i) {
            return ListTile(
                title: Uihelper.myText(
                    DrivingInstructions.drivingInstructions![i]['title']!,
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                subtitle: Uihelper.myText(
                    DrivingInstructions.drivingInstructions![i]['description']!,
                    TextStyle(fontWeight: FontWeight.w700)));
          }),
    );
  }
}
