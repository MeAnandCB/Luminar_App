import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:lumainar/core/constants/colors.dart';

import '../guest_enroll_screen/guestErollScreen.dart';

class PaymentFailedScreen extends StatelessWidget {
  const PaymentFailedScreen({super.key});

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
                  'assets/animations/payment_failed.json',
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
                  "OOPs !!",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                      color: ColorConstants.iconRose),
                ),

                Text(
                  "Payment Failed",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                      color: ColorConstants.iconRose),
                ),
                SizedBox(height: 8),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => GuestRegisterScreen()));
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), color: ColorConstants.iconRose),
                child: Center(
                  child: Text(
                    "Try again",
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
