import 'package:flutter/material.dart';

import '../core/constants/colors.dart';

class TextfieldRefactor extends StatefulWidget {
  final controllerData;
  final fildName;

  // final IconData fieldIcon;
  const TextfieldRefactor({
    super.key,
    required this.controllerData,
    required this.fildName,

    // required this.fieldIcon
  });

  @override
  State<TextfieldRefactor> createState() => _TextfieldRefactorState();
}

class _TextfieldRefactorState extends State<TextfieldRefactor> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controllerData,
      decoration: InputDecoration(
        //  isDense: true,
        contentPadding: EdgeInsets.all(15),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorConstants.iconsColor),
            borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorConstants.iconsColor)),
        labelText: widget.fildName,
        labelStyle: TextStyle(color: ColorConstants.iconsColor),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ColorConstants.iconsColor),
        ),
        //  focusedBorder: OutlineInputBorder()
      ),
    );
  }
}
