import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:lumainar/presentation/profile_screen/profileScreen.dart';

import '../../../core/constants/colors.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Verify your Mail",
          style: TextStyle(
              color: ColorConstants.iconsColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Lottie.asset(
                  'assets/animations/change_passwords.json',
                  reverse: true,
                ),
              ),
              Text(
                "Change Your Password",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              PasswordField(name: "Current Password"),
              SizedBox(height: 20),
              PasswordField(name: "New Password"),
              SizedBox(height: 20),
              PasswordField(name: "Confirm Password"),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: GestureDetector(
          onTap: () {
            // Navigator.of(context).pushReplacement(
            //     MaterialPageRoute(builder: (context) => ProfileScreen()));
            Navigator.pop(context);
          },
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorConstants.iconsColor),
            child: Center(
              child: Text(
                "Submit",
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

class PasswordField extends StatefulWidget {
  final name;
  const PasswordField({super.key, required this.name});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  // show the password or not
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _isObscure,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorConstants.iconsColor)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorConstants.iconsColor)),
          labelText: widget.name,
          labelStyle: TextStyle(color: ColorConstants.iconsColor),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: ColorConstants.iconsColor),
          ),
          suffixIcon: IconButton(
              icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off,
                  color: ColorConstants.iconsColor),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              })
          //  focusedBorder: OutlineInputBorder()
          ),
    );
  }
}
