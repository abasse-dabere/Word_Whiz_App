import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'navigation_page.dart';

class GetStartedPage extends StatelessWidget {
  GetStartedPage({super.key});

  final List<Map<String, dynamic>> pages = [
    {
      'image': 'assets/images/logo.svg',
      'title': 'Welcome !',
      'description':
          'Embark on a language adventure and test your knowledge with fun quizzes.Learn, challenge, and grow with English Level Up!',
    },
    {
      'image': 'assets/images/personalized.svg',
      'title': 'Personalized Study',
      'description':
          'Take charge of your learning journey with custom vocabulary lists and advanced techniques. Tailor your study for effective vocabulary building.',
    },
    {
      'image': 'assets/images/richvocabulary.svg',
      'title': 'Rich Vocabulary Sheets',
      'description':
          'Access 1000+ expertly crafted sheets covering diverse topics. Download and embark on captivating language learning.',
    },
    {
      'image': 'assets/images/contest.svg',
      'title': 'Challenges And Contests',
      'description':
          'Test your vocabulary prowess with engaging challenges. Compete with friends and users to become the ultimate wordsmith.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: DefaultTabController(
        length: pages.length,
        child: Builder(
          builder: (BuildContext context) => Column(
            children: [
              Expanded(
                flex: 25,
                child: TabBarView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    buildPage(0, context),
                    buildPage(1, context),
                    buildPage(2, context),
                    buildPage(3, context),
                  ],
                ),
              ),
              const Expanded(
                flex: 1,
                child: TabPageSelector(
                  selectedColor: Colors.white,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPage(int index, BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(),
        ),
        Expanded(
            flex: 14,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: SvgPicture.asset(pages[index]['image']),
            )),
        Expanded(
          flex: 2,
          child: Container(),
        ),
        Expanded(
          flex: 2,
          child: Text(
            pages[index]['title'],
            style: GoogleFonts.arimo(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(),
        ),
        Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                pages[index]['description'],
                textAlign: TextAlign.center,
                style: GoogleFonts.arimo(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            )),
        Expanded(
          flex: 1,
          child: Container(),
        ),
        Expanded(
          flex: 2,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return const NavigationPage();
              }));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // Set the button color
              // foregroundColor: pages[index]['color'], // Set the text color
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(20), // Set the border radius
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Text(
                'Get Started',
                style: GoogleFonts.arimo(
                  fontSize: 16,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(),
        ),
      ],
    );
  }
}
