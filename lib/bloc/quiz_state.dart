part of 'quiz_bloc.dart';

abstract class QuizState  {
  const QuizState();

}

class QuizInitial extends QuizState {}

class QuizLoading extends QuizState {}

class QuizLoaded extends QuizState {
  final String success;
  final QwizModel qwizModel;
  

  QuizLoaded( {required this.success,required this.qwizModel}); 
 
}

class QuizError extends QuizState {
  final String message;

  const QuizError(this.message);

  
}
