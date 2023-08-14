import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:lumainar/core/constants/colors.dart';
import 'package:lumainar/presentation/bottom_nav_bar_screen/view/bottom_nav_bar_screen.dart';
import 'package:lumainar/presentation/payment_failed_screen/paymentFailedScreen.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Column(
              children: [
                Lottie.asset(
                  'assets/animations/payment_success.json',
                  reverse: true,
                ),
                // Center(
                //   child: CircleAvatar(
                //     radius: 60,
                //     backgroundColor: iconRose,
                //     child: CircleAvatar(
                //       radius: 58,
                //       backgroundColor: iconsColorLite,
                //       child: Icon(
                //         Icons.done,
                //         size: 50,
                //         color: Colors.white,
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(height: 15),
                Text(
                  "Congratulations",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color(0xff830293)),
                ),
                SizedBox(height: 15),
                Text("Your registration Is Successful"), SizedBox(height: 5),
                Text("Please Check your Gmail")
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => BottomNavBar()),
                    (route) => false);
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ColorConstants.iconsColor),
                child: Center(
                  child: Text(
                    "continue",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
