import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lumainar/core/constants/colors.dart';

class AnnouncementContainer extends StatelessWidget {
  final name;
  final description;
  final date;
  const AnnouncementContainer(
      {super.key,
      required this.name,
      required this.description,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: ColorConstants.iconsColor),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.forum,
                            color: ColorConstants.iconsColor,
                          ),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                name,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 7),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 100,
                                child: Text(
                                  description,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ]),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Date : ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        date != null
                            ? DateFormat("dd-MM-yyyy").format(date)
                            : '',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )
              ],
            )),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
