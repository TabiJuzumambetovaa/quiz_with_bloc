import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_test/models/question_model.dart';
import 'package:flutter_bloc_test/network/dio_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizInitial()){
    on<StartQuizEvent>((event, emit) async {
      emit(QuizLoading());
      try {
        final qwizModel = await fetchQuestions();
        // final categoryModel = await fetchQuestions2();

        
        emit(QuizLoaded(success: '', qwizModel: qwizModel!),);
      } catch (e) {
        emit(const QuizError("error"));
      }
    });
  }

  

  

  Future<QwizModel?> fetchQuestions() async {
    final Dio dio = DioSettings().dio;

    try {
      final response = await dio.get('&category=11&type=multiple');
      final qwizModel = QwizModel.fromJson(response.data);
      
      return qwizModel;
    } catch (e) {
      Text('Error during API request: $e');
      return null;
    }
  }
  
  Future<void> saveAnswers(String key, String value)async{
    final SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.setString(key, value);

  }
}
