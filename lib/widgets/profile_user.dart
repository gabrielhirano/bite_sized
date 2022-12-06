import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfileUser extends StatelessWidget {
  const ProfileUser({super.key, required this.userImage});

  final String userImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(left: 5, bottom: 10),
      child: GestureDetector(
        onTap: () => print('profile'),
        child: Container(
          decoration: BoxDecoration(
            border:
                Border.all(color: Color.fromARGB(255, 255, 255, 255), width: 1),
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: CircleAvatar(foregroundImage: NetworkImage(userImage)),
        ),
      ),
    );
  }
}
