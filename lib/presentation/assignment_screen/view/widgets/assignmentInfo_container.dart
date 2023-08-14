import 'package:flutter/material.dart';

class AssignmentContainer extends StatelessWidget {
  final name;
  final status;
  final duedate;
  final time;
  const AssignmentContainer(
      {super.key,
      required this.name,
      required this.status,
      required this.duedate,
      required this.time});

  @override
  Widget build(BuildContext context) {
    print(status);
    return Column(
      children: [
        Container(
          height: 80,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xffDEDEDE)),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 25,
                    child: Icon(Icons.workspaces),
                    backgroundColor: Colors.pink[50],
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * .40,
                        child: Text(
                          name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        duedate,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    time,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 10),
                  Text(
                    status,
                    style: TextStyle(
                        fontSize: 15,
                        color: (status == "completed")
                            ? Colors.green
                            : Colors.red),
                  )
                ],
              ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}
