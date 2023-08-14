import 'package:flutter/material.dart';
import 'package:lumainar/presentation/otp_Screen/view/otpScreen.dart';

import '../../../core/constants/colors.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Verify your Mail",
          style: TextStyle(
              color: ColorConstants.iconsColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.asset("assets/images/dp/mail_verify.jpg"),
            ),
            SizedBox(height: 50),
            Text(
              "Change your  Password?",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width * .75,
              child: Text(
                "Hey Buddy !  Please enter the Email ID. we will send an OTP to the Email.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w400, height: 1.5),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorConstants.iconsColor)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorConstants.iconsColor)),
                  labelText: "Email ID",
                  labelStyle: TextStyle(color: ColorConstants.iconsColor),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorConstants.iconsColor),
                  ),
                  //  focusedBorder: OutlineInputBorder()
                ),
              ),
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => VerificationCodeScreen()));
          },
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorConstants.iconsColor),
            child: Center(
              child: Text(
                "Send OTP",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
