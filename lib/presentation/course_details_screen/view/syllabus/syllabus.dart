import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class Syllabus extends StatelessWidget {
  final String titile;
  final String subtitile;
  final String description;
  const Syllabus(
      {super.key,
      required this.description,
      required this.subtitile,
      required this.titile});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Module $titile",
          style: TextStyle(
              color: ColorConstants.iconsColor,
              height: 1.7,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        Text(
          subtitile,
          style: TextStyle(
              color: ColorConstants.lightGrey,
              height: 1.7,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          description,
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: ColorConstants.lightGrey,
            height: 1.7,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
