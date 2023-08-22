import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../custom_widgets/custom_title.dart';
import '../custom_widgets/post_display.dart';

import '../data/quiz_examples.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          helloDisplay(),
          searchBarDisplay(),
          trendsDisplay(context),
        ],
      ),
    );
  }

  Widget helloDisplay() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello,",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily: 'Arimo',
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                "Dabere 👋",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Arimo',
                ),
              ),
            ],
          ),
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage("assets/images/drax.png"),
          )
        ],
      ),
    );
  }

  Widget searchBarDisplay() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[200],
          ),
          child: Row(
            children: [
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '100 common words ...',
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Colors.black,
                  size: 20,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget trendsDisplay(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const CustomTitle(
            color: Colors.green,
            title: "Discover",
            clickable: true,
          ),
          const SizedBox(height: 10),
          ...quiz_list_data.entries.map((entry) {
            var quizData = entry.value;
            return PostDisplay(
              image: AssetImage(quizData['image']),
              username: quizData['username'],
              topic: quizData['topic'],
              title: quizData['title'],
              likes: quizData['likestr'],
              onTap: () {},
            );
          }).toList(),
        ],
      ),
    );
  }
}