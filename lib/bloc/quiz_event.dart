part of 'quiz_bloc.dart';

abstract class QuizEvent {
  const QuizEvent();
}

class StartQuizEvent extends QuizEvent {
  final String? type;
  final String? difficulty;
  final String? category;
  final String? question;
  final String? correctAnswer;
  final List<String>? incorrectAnswers;

  StartQuizEvent(
      { this.category,
       this.correctAnswer,
       this.difficulty,
       this.incorrectAnswers,
       this.question,
       this.type});
}
