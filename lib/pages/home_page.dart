import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../custom_widgets/category_display.dart';
import '../custom_widgets/custom_title.dart';
import '../custom_widgets/post_display.dart';

import '../data/quiz_examples.dart';
import 'category_page.dart';
import 'post_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  @override
  bool get wantKeepAlive => true;

  Future<void> handleRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(
        () {}); // Appelez setState pour notifier que le rafraîchissement est terminé
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      onRefresh: handleRefresh,
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: [
            helloDisplay(),
            searchBarDisplay(),
            trendsDisplay(context),
            categoryDisplay(context),
          ],
        ),
      ),
    );
  }

  Widget helloDisplay() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello,",
                style: GoogleFonts.arimo(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Text(
                "Dabere 👋",
                style: GoogleFonts.arimo(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const CircleAvatar(
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
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '100 common words ...',
                    hintStyle: GoogleFonts.arimo(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 12),
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
          ...trendsQuiz.map((entry) {
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
        ],
      ),
    );
  }

  Widget categoryDisplay(BuildContext context) {
    return Column(
      children: [
        CustomTitle(
          color: Colors.green,
          title: "Categories",
          clickable: true,
          onTap: () {},
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  ...trendsCategories.take(2).map((entry) {
                    return CategoryDisplay(
                      image: AssetImage(categoriesList[entry]?['image']),
                      topic: entry,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return CategoryPage(category: entry);
                            },
                          ),
                        );
                      },
                    );
                  }).toList(),
                  const SizedBox(height: 25),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  ...trendsCategories.skip(2).take(2).map((entry) {
                    return CategoryDisplay(
                      image: AssetImage(categoriesList[entry]?['image']),
                      topic: entry,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return CategoryPage(category: entry);
                            },
                          ),
                        );
                      },
                    );
                  }).toList(),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
