import 'package:flutter/material.dart';
import 'package:flutter_bloc_test/screens/category_film.dart';

class QwestionScreen extends StatelessWidget {
  const QwestionScreen({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => const CategoryFilm(),));
                  
                },
                child: const Text("Начать викторину"),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
