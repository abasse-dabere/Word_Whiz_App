import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryDisplay extends StatelessWidget {
  final ImageProvider<Object> image;
  final String topic;
  final double height;
  final Function()? onTap;
  const CategoryDisplay(
      {super.key,
      required this.image,
      required this.topic,
      required this.onTap,
      this.height = 200});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.grey,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: height,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: image,
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              topic,
              style: GoogleFonts.arimo(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
