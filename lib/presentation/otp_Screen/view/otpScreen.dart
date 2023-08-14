// Create an input widget that takes only one digit
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:lumainar/presentation/reset_password_screen/view/resetPassword.dart';
import 'package:pinput/pinput.dart';
import '../../../core/constants/colors.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({Key? key}) : super(key: key);

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.07,
                ),
                Lottie.asset(
                  'assets/animations/email_verification.json',
                  reverse: true,
                ),
                SizedBox(height: 60),
                Text(
                  'Verification Code',
                  style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 138, 36, 142),
                    fontSize: 32.0,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'Please enter the verification code that we have sent to your email ',
                        style: GoogleFonts.urbanist(
                          fontSize: 14.0,
                          color: const Color(0xff808d9e),
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                      TextSpan(
                        text: 'abcd@gmail.com',
                        style: GoogleFonts.urbanist(
                          fontSize: 14.0,
                          color: const Color(0xff005BE0),
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),

                /// pinput package we will use here
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    width: width,
                    child: Pinput(
                      length: 4,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      defaultPinTheme: PinTheme(
                        height: 50.0,
                        width: 60.0,
                        textStyle: GoogleFonts.urbanist(
                          fontSize: 24.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color.fromARGB(255, 101, 28, 91)
                                .withOpacity(0.5),
                            width: 1.0,
                          ),
                        ),
                      ),
                      focusedPinTheme: PinTheme(
                        height: 60.0,
                        width: 60.0,
                        textStyle: GoogleFonts.urbanist(
                          fontSize: 24.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: ColorConstants.iconsColor,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 16.0,
                ),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Resend Button',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => ResetPassword()));
          },
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorConstants.iconsColor),
            child: Center(
              child: Text(
                "Verify",
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
