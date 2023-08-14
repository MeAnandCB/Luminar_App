import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class MonthlyAttandanceScreen extends StatefulWidget {
  const MonthlyAttandanceScreen({super.key});

  @override
  State<MonthlyAttandanceScreen> createState() =>
      _MonthlyAttandanceScreenState();
}

class _MonthlyAttandanceScreenState extends State<MonthlyAttandanceScreen> {
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  List<String> year = [
    '2000',
    '2001',
    '2002',
    '2003',
    '2004',
    '2005',
    '2006',
    '2007',
    '2008',
    '2009',
    '2010',
    '2011',
  ];

  String selectedMonth = 'January';
  String selectedyear = '2000';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "test",
          style: TextStyle(
              color: ColorConstants.iconsColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              "FLT-Nov22-B1-Sreedevi",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorConstants.tdGrey,
                          ),
                          child: Center(
                            child: DropdownButton2<String>(
                              value: selectedyear,
                              onChanged: (newValue) {
                                setState(() {
                                  selectedyear = newValue!;
                                });
                              },
                              items: year.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorConstants.tdGrey,
                          ),
                          child: Center(
                            child: DropdownButton2<String>(
                              value: selectedMonth,
                              onChanged: (newValue) {
                                setState(() {
                                  selectedMonth = newValue!;
                                });
                              },
                              items: months.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * .30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: ColorConstants.iconsColor,
                  ),
                  child: Center(
                    child: Text(
                      "Show",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            Text(
              "Monthly Attendance",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          height: 48,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: index % 2 == 0
                                ? ColorConstants.tdGrey1
                                : Color.fromARGB(255, 237, 237, 237),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                    "assets/images/course_image/android1.png"),
                                Text("20-07-2023"),
                                SizedBox(),
                                index % 2 == 0
                                    ? Container(
                                        height: 30,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .20,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          color: Color(0xffE92D2D),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Absent",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        height: 30,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .20,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          color: Color(0xff108C2B),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Present",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 18,
                        )
                      ],
                    );
                  }),
            )
          ],
        ),
      )),
    );
  }
}
