import 'package:rto/Exports/myExports.dart';

class MyTrafficRules extends StatelessWidget {
  const MyTrafficRules({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Uihelper.myText(
              'Traffic Rules', TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: Colors.white,
        ),
        body: ListView.builder(
            itemCount: Trafficrules.trafficRules.length,
            itemBuilder: (context, i) {
              return ListTile(
                title: Uihelper.myText(Trafficrules.trafficRules![i]['title']!,
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                subtitle: Uihelper.myText(
                  Trafficrules.trafficRules![i]['description']!,
                  TextStyle(fontWeight: FontWeight.w600),
                ),
              );
            }));
  }
}
