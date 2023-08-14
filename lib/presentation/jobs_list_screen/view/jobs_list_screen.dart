import 'package:flutter/material.dart';
import 'package:lumainar/core/constants/colors.dart';

class JobsListScreen extends StatelessWidget {
  const JobsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
            fontSize: 18,
            color: ColorConstants.iconsColor,
            fontWeight: FontWeight.bold),
        title: Text("Job Portal"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [JobCard(), JobCard()],
        ),
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  const JobCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle jobDetailsTilteTextStyle = TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: ColorConstants.lightGrey);
    TextStyle jobDetailsValueTextStyle =
        TextStyle(fontSize: 15, fontWeight: FontWeight.w500);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(4, 6),
              color: ColorConstants.lightGrey.withOpacity(.20),
              blurRadius: 6,
            )
          ],
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1, color: Colors.grey.shade300),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage:
                      AssetImage('assets/images/course_image/android1.png'),
                  radius: 30,
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jr. Flutter Developer',
                      style: TextStyle(
                          fontSize: 20,
                          color: ColorConstants.iconsColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Luminar Technolab',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 75,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Location",
                                    style: jobDetailsTilteTextStyle),
                                Text(":  "),
                              ],
                            ),
                          ),
                          Text(
                            "Ernakulam",
                            style: jobDetailsValueTextStyle,
                          )
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          SizedBox(
                            width: 75,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Salary", style: jobDetailsTilteTextStyle),
                                Text(":  "),
                              ],
                            ),
                          ),
                          Text(
                            "30,00/-",
                            style: jobDetailsValueTextStyle,
                          )
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 75,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Bond", style: jobDetailsTilteTextStyle),
                                Text(":  "),
                              ],
                            ),
                          ),
                          Text(
                            "1 year",
                            style: jobDetailsValueTextStyle,
                          )
                        ],
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/dp/img_org_logo.png'))),
                      height: 60,
                      width: 130,
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        // Navigator.of(context).push(
                        //     MaterialPageRoute(builder: (context) => GuestRegisterScreen()));
                      },
                      child: Container(
                        height: 30,
                        width: 130,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: ColorConstants.iconsColor),
                        child: Center(
                          child: Text(
                            "Apply Now ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
