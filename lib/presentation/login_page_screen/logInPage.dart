import 'package:flutter/material.dart';
import 'package:lumainar/core/constants/colors.dart';
import 'package:lumainar/presentation/bottom_nav_bar_screen/view/bottom_nav_bar_screen.dart';

import '../../global_widgets/textField.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _textFieldController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset("assets/images/dp/Group 155.png"),
              ],
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hey There',
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    'LogIn Now !',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 100),
                  TextfieldRefactor(
                    controllerData: _textFieldController,
                    fildName: "User Name",
                  ),
                  SizedBox(height: 30),
                  TextfieldRefactor(
                    controllerData: _textFieldController,
                    fildName: "Password",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {}, child: Text("Forgot password?"))
                    ],
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavBar(),
                        ),
                        (route) => false),
                    child: Center(
                      child: Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width * .75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorConstants.iconsColor,
                        ),
                        child: Center(
                            child: Text(
                          "LogIn",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                      child: Text(
                    "OR",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavBar(),
                        ),
                        (route) => false),
                    child: Center(
                      child: Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width * .75,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: ColorConstants.iconsColor,
                            )),
                        child: Center(
                            child: Text(
                          "Guest",
                          style: TextStyle(
                              fontSize: 20,
                              color: ColorConstants.iconsColor,
                              fontWeight: FontWeight.w600),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
