import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lumainar/global_widgets/textField.dart';

import '../../core/constants/colors.dart';
import '../payment_success_screen/payment_success_screen.dart';

class GuestRegisterScreen extends StatefulWidget {
  const GuestRegisterScreen({super.key});

  @override
  State<GuestRegisterScreen> createState() => _GuestRegisterScreenState();
}

class _GuestRegisterScreenState extends State<GuestRegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textFieldController1 = TextEditingController();
  final TextEditingController _textFieldController2 = TextEditingController();
  // final TextEditingController _textFieldController3 = TextEditingController();
  final TextEditingController _textFieldController4 = TextEditingController();
  final TextEditingController _textFieldController5 = TextEditingController();
  final TextEditingController _textFieldController6 = TextEditingController();
  final TextEditingController _textFieldController7 = TextEditingController();
  final TextEditingController _textFieldController8 = TextEditingController();

  void _showDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1980),
        lastDate: DateTime.now(),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: ColorConstants.iconsColor, // header background color
                onPrimary: Colors.white, // header text color
                onSurface: Color.fromARGB(255, 45, 46, 45), // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: ColorConstants.iconRose, // button text color
                ),
              ),
            ),
            child: child!,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 70),
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 55,
                          backgroundImage: AssetImage(
                              'assets/images/dp/dp.jpg'), // Replace with your own avatar image
                        ),
                        Positioned(
                          right: 10,
                          bottom: 0,
                          child: Icon(
                            Icons.manage_accounts,
                            size: 30,
                            color: ColorConstants.iconsColor,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 30),
                    TextfieldRefactor(
                        controllerData: _textFieldController1,
                        fildName: "Full Name"),
                    SizedBox(height: 20),
                    IntlPhoneField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorConstants.iconsColor)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorConstants.iconsColor)),
                        labelStyle: TextStyle(color: ColorConstants.iconsColor),
                        hintText: 'Phone Number',
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorConstants.iconsColor),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      initialCountryCode: 'IN', // Set initial country code
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                    ),
                    SizedBox(height: 20),
                    TextfieldRefactor(
                        controllerData: _textFieldController4,
                        fildName: "Email ID"),
                    SizedBox(height: 20),
                    TextfieldRefactor(
                        controllerData: _textFieldController5,
                        fildName: "Parent Number"),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _textFieldController6,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorConstants.iconsColor)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorConstants.iconsColor),
                            borderRadius: BorderRadius.circular(12)),
                        labelText: "DOB",
                        suffixIcon: IconButton(
                            onPressed: () {
                              _showDatePicker();
                            },
                            icon: Icon(
                              Icons.calendar_month_outlined,
                              color: ColorConstants.iconsColor,
                            )),
                        labelStyle: TextStyle(color: ColorConstants.iconsColor),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorConstants.iconsColor),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextfieldRefactor(
                        controllerData: _textFieldController7,
                        fildName: "Gender"),
                    SizedBox(height: 20),
                    TextfieldRefactor(
                        controllerData: _textFieldController8,
                        fildName: "Selected Course"),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          "Set your Credential",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 1,
                      color: ColorConstants.iconsColor,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextfieldRefactor(
                        controllerData: _textFieldController2,
                        fildName: "Username"),
                    SizedBox(height: 20),
                    TextfieldRefactor(
                        controllerData: _textFieldController2,
                        fildName: "Password"),
                  ],
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => PaymentSuccessScreen()),
              (route) => false);
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
                "Register Now",
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
