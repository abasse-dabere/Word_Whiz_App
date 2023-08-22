import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTitle extends StatelessWidget {
  final MaterialColor color;
  final String title;
  final bool clickable;
  final Function()? onTap;

  const CustomTitle({
    super.key,
    required this.color,
    required this.title,
    required this.clickable,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                color: color,
              ),
              Text(
                " $title",
                style: GoogleFonts.arimo(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          viewAll(context, clickable, onTap),
        ],
      ),
    );
  }

  Widget viewAll(BuildContext context, bool clickable, Function()? onTap) {
    if (!clickable) return Container();
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Icon(
            Icons.remove,
            size: 18,
            color: Colors.green,
          ),
          Text(
            " See all",
            style: GoogleFonts.arimo(
              fontSize: 15,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
