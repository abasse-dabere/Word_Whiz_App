import 'package:flutter/material.dart';

import '../custom_widgets/custom_title.dart';
import '../custom_widgets/post_display.dart';
import '../data/quiz_examples.dart';
import 'post_page.dart';

class CategoryPage extends StatelessWidget {
  final String category;
  final Map<String, dynamic>? categoryData;
  CategoryPage({super.key, required this.category})
      : categoryData = categoriesList[category];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(categoryData?['image']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          CustomTitle(
            color: Colors.green,
            title:
                "${(categoryData?['quizzes']?.length ?? 0)} Quiz on $category",
            clickable: false,
          ),
          const SizedBox(height: 20),
          ...(categoryData?['quizzes']).map((entry) {
            return PostDisplay(
              image: AssetImage(quizList[entry]?['image']),
              username: quizList[entry]?['username'],
              topic: quizList[entry]?['topic'],
              title: quizList[entry]?['title'],
              likes:
                  "${(quizList[entry]?['likes'] / 1000).toStringAsFixed(1)}k",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return PostPage(quiz: entry);
                    },
                  ),
                );
              },
            );
          }).toList(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
