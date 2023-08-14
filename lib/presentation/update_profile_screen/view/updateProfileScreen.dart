import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

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
        title: Text("Personal Detials"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(15),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/dp/dp.jpg'),
                  backgroundColor: ColorConstants.iconsColor,
                  radius: 60,
                ),
              )),
              CustomContainerWithTitle(
                  title: "Name   (not editable contact admin)",
                  value: 'User Name',
                  values: false),
              CustomContainerWithTitle(
                  title: "Email", value: 'testuser@gmail.com', values: false),
              CustomContainerWithTitle(
                  title: "Phone Number", value: '+91 9897865434', values: true),
              CustomContainerWithTitle(
                  title: "Parent Number   (not editable)",
                  value: '+91 9897865434',
                  values: false),
              CustomContainerWithTitle(
                  title: "Date of Birth", value: '27/07/2000', values: true),
              CustomContainerWithTitle(
                  title: "Gender", value: 'Male', values: true),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: ColorConstants.iconsColor),
              child: Center(
                child: Text(
                  "Save",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomContainerWithTitle extends StatelessWidget {
  final String title;
  final String value;
  final bool values;

  const CustomContainerWithTitle(
      {Key? key,
      required this.title,
      required this.value,
      required this.values})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text.rich(
          //   TextSpan(
          //      children: [
          //   title,

          // ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: title,
                ),
                TextSpan(
                  text: (values == true) ? ' *' : ' ',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 255, 54, 13),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.all(8),
            alignment: Alignment.centerLeft,
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade200,
            ),
            child: TextField(
              enabled: values,
              controller: TextEditingController(text: value),
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
