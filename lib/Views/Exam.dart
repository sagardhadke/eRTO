import 'package:percent_indicator/percent_indicator.dart';
import 'package:rto/Exports/myExports.dart';
import 'package:http/http.dart' as http;


class MyExam extends StatefulWidget {
  final String? id;
  const MyExam({required this.id, super.key});

  @override
  State<MyExam> createState() => _MyExamState();
}

class _MyExamState extends State<MyExam> {
  String baseUri = dotenv.env['BASE_URL'] ?? '';
  List<ExamModel>? ofExam;
  int currentQuestionIndex = 0;
  int score = 0;
  int? selectedAnswer;
  bool isLoading = true;

  getQuestions() async {
    String apiUri = "$baseUri/test_data?cat_id=${widget.id}";
    Uihelper.logger.d("API URI: $apiUri");
    try {
      var examApiRes =
          await http.get(Uri.parse("$baseUri/test_data?cat_id=${widget.id}"));
      if (examApiRes.statusCode == 200) {
        ofExam = ExamModel.ofExamModel(jsonDecode(examApiRes.body));
        setState(() {});
        Uihelper.logger.d("Exam API Response $ofExam");
      } else {
        Uihelper.logger.e("Failed to Load Exam API $examApiRes");
      }
    } catch (e) {
      Uihelper.logger.e("Error ${e.toString()}");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<bool> _onWillPop() async {
    bool exit = false;
    bool _isDarkMode = Theme.of(context).brightness == Brightness.dark;
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(
                Icons.warning,
                color: Colors.red,
              ),
              SizedBox(width: 8),
              Text("Are you sure?"),
            ],
          ),
          content: Text(
            "Do you want to cancel the exam and go back?",
            style: TextStyle(color: _isDarkMode ? Colors.white : Colors.black),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                exit = true;
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MyDashboard()),
                  (route) => false,
                );
              },
              child: Text(
                "Yes",
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("No"),
            ),
          ],
        );
      },
    );
    return exit;
  }

  @override
  void initState() {
    super.initState();
    getQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title:
                Uihelper.myText('Exam', TextStyle(fontWeight: FontWeight.bold)),
            centerTitle: true,
          ),
          body: isLoading
              ? MyexamShimmer()
              : ofExam == null
                  ? Column(
                      children: [
                        Image.asset("Assets/no_data.png"),
                        Uihelper.myText(
                            'No Questions Available',
                            TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      ],
                    )
                  : Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Uihelper.myText(
                                        "Question ${currentQuestionIndex + 1} ",
                                        TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    Uihelper.myText(
                                        "${currentQuestionIndex + 1}/${ofExam?.length ?? 0}",
                                        TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                SizedBox(height: 10),
                                LinearPercentIndicator(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  lineHeight: 8.0,
                                  percent: (currentQuestionIndex + 1) /
                                      (ofExam?.length ?? 1),
                                  backgroundColor: Colors.grey,
                                  progressColor: MyAppColors.buttonPrimary,
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                ),
                              ],
                            )),
                        _questionWidget(),
                        SizedBox(height: 5),
                        _answerList(),
                        _nextButton(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              textAlign: TextAlign.center,
                              softWrap: true,
                              "Note: Your valuable input in responding to these questions will greatly assist us to understand your knowledge and expertise in the field of driving.",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
        ),
        onWillPop: _onWillPop);
  }

  //Shimmer Loader
  myShimmerLoader() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[300]!,
      child: Row(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
          ),
          const SizedBox(width: 10),
          Expanded(
              child: Column(
            children: [
              const SizedBox(height: 15),
              Container(height: 20, color: Colors.white),
              const SizedBox(height: 10),
              Container(height: 15, width: 80, color: Colors.white),
            ],
          ))
        ],
      ),
    );
  }

  Widget _questionWidget() {
    if (ofExam == null || ofExam!.isEmpty) {
      return Text("No questions available.");
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: MyAppColors.buttonPrimary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          ofExam![currentQuestionIndex].question ?? '',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _answerList() {
    if (ofExam == null || ofExam!.isEmpty) return Container();

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          _answerButton(1, ofExam![currentQuestionIndex].option1),
          _answerButton(2, ofExam![currentQuestionIndex].option2),
          _answerButton(3, ofExam![currentQuestionIndex].option3),
          _answerButton(4, ofExam![currentQuestionIndex].option4),
        ],
      ),
    );
  }

  Widget _answerButton(int answerIndex, String? answerText) {
    bool isSelected = selectedAnswer == answerIndex;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 48,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedAnswer = answerIndex;
            if (answerIndex ==
                int.tryParse(ofExam![currentQuestionIndex].answer ?? '')) {
              score++;
            }
          });
        },
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          backgroundColor: isSelected ? Color(0XFF2155B5) : Colors.white,
          foregroundColor: isSelected ? Colors.white : Colors.black,
        ),
        child: Text(answerText ?? ''),
      ),
    );
  }

  Widget _nextButton() {
    bool isLastQuestion = currentQuestionIndex == (ofExam?.length ?? 0) - 1;
    bool _isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 48,
      child: ElevatedButton(
        onPressed: () {
          if (selectedAnswer == null) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                "Please select an answer to proceed.",
                style:
                    TextStyle(color: _isDarkMode ? Colors.white : Colors.black),
              ),
              backgroundColor: Colors.red,
            ));
          } else {
            if (isLastQuestion) {
              _showScoreDialog();
            } else {
              setState(() {
                currentQuestionIndex++;
                selectedAnswer = null;
              });
            }
          }
        },
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          backgroundColor: MyAppColors.buttonPrimary,
          foregroundColor: Colors.white,
        ),
        child: Text(isLastQuestion ? 'Submit' : 'Next'),
      ),
    );
  }

  void _showScoreDialog() {
    bool isPassed = score >= (ofExam?.length ?? 0) * 0.6;
    String title = isPassed ? 'Passed' : 'Failed';

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: Text("$title | Score is $score",
            style: TextStyle(color: isPassed ? Colors.green : Colors.red)),
        content: ElevatedButton(
          child: const Text("Submit Result"),
          onPressed: () {
            Navigator.pop(context);
            setState(() {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MyDashboard()),
                (route) => false,
              );
            });
          },
        ),
      ),
    );
  }
}
