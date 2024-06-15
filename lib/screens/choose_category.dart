// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc_test/bloc/quiz_bloc.dart';
// import 'package:flutter_bloc_test/models/category_model.dart';

// class Choosecategory extends StatefulWidget {
//   const Choosecategory({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<Choosecategory> createState() => _CategoryFilmState();
// }

// class _CategoryFilmState extends State<Choosecategory> {
//   int currentQuestionIndex = 0;

//   @override
//   void initState() {
//     BlocProvider.of<QuizBloc>(context).add(StartQuizEvent());
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(""),
//       ),
//       floatingActionButton: IconButton(
//         color: Colors.purple,
//         onPressed: () {
//           setState(() {
//             currentQuestionIndex++;
//           });
//         },
//         icon: const Icon(Icons.arrow_forward),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             BlocBuilder<QuizBloc, QuizState>(
//               builder: (context, state) {
//                 if (state is QuizLoading) {
//                   return const CircularProgressIndicator();
//                 } else if (state is QuizLoaded) {
//                   final CategoryModel categoryModel = state.categoryModel;

//                   if (categoryModel.results != null &&
//                       categoryModel.results!.isNotEmpty) {
//                     return Column(
//                       children: [
//                         ListTile(
//                           title: Text(
//                             "Категория: ${categoryModel.results![currentQuestionIndex].category ?? "hi"}",
//                             style: const TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.purple,
//                             ),
//                           ),
//                           onTap: () {
//                             print("");
//                           },
//                         ),
//                         const SizedBox(
//                           height: 30,
//                         ),
//                       ],
//                     );
//                   }
//                 }
//                 return Container();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }