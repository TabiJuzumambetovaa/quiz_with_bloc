import 'package:flutter/material.dart';
import 'package:flutter_bloc_test/models/question_model.dart';

class Answers extends StatefulWidget {
  const Answers({
    Key? key,
    required this.qwizModel,
    required this.answerText,
  }) : super(key: key);

  final QwizModel qwizModel;
  final String answerText;

  @override
  // ignore: library_private_types_in_public_api
  _AnswersState createState() => _AnswersState();
}

class _AnswersState extends State<Answers> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String>? incorrectAnswers = widget.qwizModel.results?[0].incorrectAnswers;

    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade300),
        onPressed: () {
          
          

          setState(() {
            currentIndex = (currentIndex + 1) % (incorrectAnswers?.length ?? 1);
          });
        },
        child: Text(
          widget.answerText, // Получение доступа к answerText через widget.
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
