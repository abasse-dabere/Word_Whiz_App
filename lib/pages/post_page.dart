import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../custom_widgets/custom_title.dart';
import '../data/quiz_examples.dart';

class PostPage extends StatefulWidget {
  final String? quiz;
  const PostPage({super.key, required this.quiz});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: const Color(0xFFd9534f),
              child: Icon(
                MdiIcons.close,
                color: Colors.white,
              ),
            ),
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            children: [
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(quizList[widget.quiz]?['image']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                quizList[widget.quiz]?['title'],
                textAlign: TextAlign.start,
                style: GoogleFonts.arimo(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Row(children: [
                      const LikeButton(),
                      Text(
                        "${(quizList[widget.quiz]?['likes'] / 1000).toStringAsFixed(1)}k",
                        style: GoogleFonts.arimo(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                  ),
                  Text(
                    "@${quizList[widget.quiz]?['username']}",
                    style: GoogleFonts.arimo(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomTitle(
                color: Colors.green,
                title: "Description",
                clickable: false,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                quizList[widget.quiz]?['description'],
                style: GoogleFonts.arimo(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomTitle(
                color: Colors.green,
                title: "100 Words to learn",
                clickable: false,
              ),
              const SizedBox(
                height: 70,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF5cb85c),
        child: const Icon(Icons.save_alt),
      ),
    );
  }
}
