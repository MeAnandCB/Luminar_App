import 'package:flutter/material.dart';
import 'package:lumainar/core/constants/colors.dart';
import 'package:lumainar/presentation/help_screen/view/helpScreen.dart';
import 'package:lumainar/presentation/jobs_list_screen/view/jobs_list_screen.dart';
import 'package:lumainar/presentation/payment_details_screen/view/paymentDetailsScreen.dart';
import 'package:lumainar/presentation/personal_details_screen/personal_detials_screen.dart';
import 'package:lumainar/presentation/security_screen/view/securityScreen.dart';
import 'package:lumainar/presentation/signin_method_screen/signin_method_screen.dart';
import 'profile_screen_widgets/profileTiles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
//show confirm dialogue =================================================================================================================================================================
      return await showDialog(
            //the return value will be from "Yes" or "No" options
            context: context,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(25),
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                title: CircleAvatar(
                  radius: 25,
                  backgroundColor: ColorConstants.iconsColor,
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.question_mark,
                      color: ColorConstants.iconsColor,
                    ),
                  ),
                ),
                content: Text(
                  // this is the one that actually works
                  'Do you want to LogOut?',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop(false);

                            // mark 2 yes button - for saving the json string to database
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: ColorConstants.iconsColor,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "No",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: ColorConstants.iconsColor,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SigninMethodScreen(),
                              ),
                              // (route) => false
                            );
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorConstants.iconsColor,
                            ),
                            child: Center(
                              child: Text(
                                "Yes",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ) ??
          false; //if showDialouge had returned null, then return false
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Profile",
          style: TextStyle(
              color: ColorConstants.iconsColor, fontWeight: FontWeight.bold),
        )),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(height: 30),
          Center(
            child: CircleAvatar(
              radius: 65,
              child: Image.asset("assets/images/dp/dp.jpg"),
            ),
          ),
          SizedBox(height: 55),
          AdminTiles(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PersonalDetailsScreen(),
                  ));
            },
            tilename: "Personal Details",
            icondataname: Icons.supervised_user_circle_sharp,
            iconname: Icons.arrow_forward_ios_rounded,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Divider(),
          ),
          AdminTiles(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => JobsListScreen(),
                  ));
            },
            tilename: "Jobs",
            icondataname: Icons.business_center,
            iconname: Icons.arrow_forward_ios_rounded,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Divider(),
          ),
          AdminTiles(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PaymentDetailsScreen()));
            },
            tilename: "Payment Details",
            icondataname: Icons.payments,
            iconname: Icons.arrow_forward_ios_rounded,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Divider(),
          ),
          AdminTiles(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SecurityScreen()));
            },
            tilename: "Security",
            icondataname: Icons.security,
            iconname: Icons.arrow_forward_ios_rounded,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Divider(),
          ),
          AdminTiles(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HelpScreen()));
            },
            tilename: "Help",
            icondataname: Icons.contact_support,
            iconname: Icons.arrow_forward_ios_rounded,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Divider(),
          ),
          AdminTiles(
            onTap: showExitPopup,
            tilename: "Logout",
            icondataname: Icons.logout,
          ),
        ],
      )),
    );
  }
}
