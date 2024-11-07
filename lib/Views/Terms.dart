import 'package:rto/Exports/myExports.dart';

class MyTermsOfUse extends StatelessWidget {
  final String? id;
  const MyTermsOfUse({required this.id , super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Uihelper.myText('Terms of Use', TextStyle()),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Uihelper.myText(Texthelper().myText, TextStyle()),
                SizedBox(height: 5),
                Uihelper.myText(Texthelper().user_gen, TextStyle()),
              ],
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            title: Uihelper.myText(Texthelper().term_1, TextStyle()),
            leading: Icon(
              size: 35,
              Icons.person,
              color: MyAppColors.buttonPrimary,
            ),
          ),
          ListTile(
            title: Uihelper.myText(Texthelper().term_2, TextStyle()),
            leading: Icon(
              size: 35,
              Icons.lock,
              color: MyAppColors.buttonPrimary,
            ),
          ),
          ListTile(
            title: Uihelper.myText(Texthelper().term_3, TextStyle()),
            leading: Icon(
              size: 35,
              Icons.settings,
              color: MyAppColors.buttonPrimary,
            ),
          ),
          ListTile(
            title: Uihelper.myText(Texthelper().term_4, TextStyle()),
            leading: Icon(
              size: 35,
              Icons.privacy_tip,
              color: MyAppColors.buttonPrimary,
            ),
          ),
          ListTile(
            title: Uihelper.myText(Texthelper().term_5, TextStyle()),
            leading: Icon(
              size: 35,
              Icons.block,
              color: MyAppColors.buttonPrimary,
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: 120,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: MyAppColors.buttonPrimary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Instruction(id: id,)));
                },
                child: Text(
                  "Accept",
                  style: TextStyle(color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
