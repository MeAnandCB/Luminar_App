import 'package:flutter/material.dart';
import 'package:lumainar/presentation/batch_details_screen/view/batch_details.dart';
import '../../../core/constants/colors.dart';
import '../../../global_widgets/SearchBar.dart';
import 'widgets/ongoing_container.dart';

class ClassDetailScreen extends StatelessWidget {
  const ClassDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Batches",
          style: TextStyle(
              color: ColorConstants.iconsColor, fontWeight: FontWeight.bold),
        )),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              SizedBox(height: 30),
              SearchBarContainer(),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "2 Batches",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Recently Added",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 30),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BatchDetails()));
                  },
                  child: OngoingContainer()),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
