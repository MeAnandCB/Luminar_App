import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class AdminTiles extends StatelessWidget {
  final tilename;
  final VoidCallback? onTap;
  final IconData icondataname;
  final IconData? iconname;
  const AdminTiles(
      {super.key,
      required this.tilename,
      required this.icondataname,
      this.onTap,
      this.iconname});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xffD9D9D9),
                  child: Icon(
                    icondataname,
                    color: ColorConstants.iconsColorLite,
                    size: 20,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  tilename,
                  style: TextStyle(
                      color: ColorConstants.textColorblack,
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                ),
              ],
            ),
            Icon(
              iconname,
              size: 15,
            )
          ],
        ),
      ),
    );
  }
}
