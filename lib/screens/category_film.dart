// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/bloc/quiz_bloc.dart';
import 'package:flutter_bloc_test/models/question_model.dart';
import 'package:flutter_bloc_test/widgets/answers.dart';

class CategoryFilm extends StatefulWidget {
  const CategoryFilm({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryFilm> createState() => _CategoryFilmState();
}

class _CategoryFilmState extends State<CategoryFilm> {
  int currentQuestionIndex = 0;

  @override
  void initState() {
    BlocProvider.of<QuizBloc>(context).add(StartQuizEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      floatingActionButton: IconButton(
        color: Colors.purple,
        onPressed: () {
          setState(() {
            currentQuestionIndex++;
          });
        },
        icon: const Icon(Icons.arrow_forward),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: BlocBuilder<QuizBloc, QuizState>(
                builder: (context, state) {
                  if (state is QuizLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is QuizLoaded) {
                    final QwizModel qwizModel = state.qwizModel;

                    if (qwizModel.results != null &&
                        qwizModel.results!.isNotEmpty) {
                      return Column(
                        children: [
                          Text(
                            "Категория: ${qwizModel.results![currentQuestionIndex].category ?? "hi"}",
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              qwizModel.results?[currentQuestionIndex].question ??
                                  "hi",
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Answers(
                            qwizModel: qwizModel,
                            answerText: qwizModel.results?[currentQuestionIndex].correctAnswer ??
                                "hi",
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Answers(
                            qwizModel: qwizModel,
                            answerText: qwizModel.results?[currentQuestionIndex].incorrectAnswers?[0] ??
                                "hi",
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Answers(
                            qwizModel: qwizModel,
                            answerText: qwizModel.results?[currentQuestionIndex].incorrectAnswers?[1] ??
                                "hi",
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Answers(
                            qwizModel: qwizModel,
                            answerText: qwizModel.results?[currentQuestionIndex].incorrectAnswers?[2] ??
                                "hi",
                          ),
                        ],
                      );
                    }
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
 
}
