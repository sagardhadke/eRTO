import 'package:rto/Exports/myExports.dart';

class MyExam extends StatefulWidget {
  final String? id;
  const MyExam({required this.id, super.key});

  @override
  State<MyExam> createState() => _MyExamState();
}

class _MyExamState extends State<MyExam> {
  String baseUri = dotenv.env['BASE_URL'] ?? '';

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Uihelper.myText('Exam', TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
    );
  }
}
