import 'package:rto/Exports/myExports.dart';

class Instruction extends StatefulWidget {
  const Instruction({super.key});

  @override
  State<Instruction> createState() => _InstructionState();
}

class _InstructionState extends State<Instruction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Uihelper.myText('Instruction', TextStyle()),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            title: Uihelper.myText(Texthelper().instruction_1, TextStyle()),
            leading: Icon(
              size: 35,
              Icons.arrow_forward_ios,
              color: MyAppColors.buttonPrimary,
            ),
          ),
          ListTile(
            title: Uihelper.myText(Texthelper().instruction_2, TextStyle()),
            leading: Icon(
              size: 35,
              Icons.arrow_forward_ios,
              color: MyAppColors.buttonPrimary,
            ),
          ),
          ListTile(
            title: Uihelper.myText(Texthelper().instruction_3, TextStyle()),
            leading: Icon(
              size: 35,
              Icons.arrow_forward_ios,
              color: MyAppColors.buttonPrimary,
            ),
          ),
          ListTile(
            title: Uihelper.myText(Texthelper().instruction_4, TextStyle()),
            leading: Icon(
              size: 35,
              Icons.arrow_forward_ios,
              color: MyAppColors.buttonPrimary,
            ),
          ),
          ListTile(
            title: Uihelper.myText(Texthelper().instruction_5, TextStyle()),
            leading: Icon(
              size: 35,
              Icons.arrow_forward_ios,
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
                      MaterialPageRoute(builder: (context) => MyTest()));
                },
                child: Text(
                  "Start Exam",
                  style: TextStyle(color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
