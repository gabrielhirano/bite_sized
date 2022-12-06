import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.icon,
    required this.text,
  });

  final Icon icon;
  final String text;

  var onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 148, 155, 167),
            borderRadius: BorderRadius.circular(2),
            border: Border.all(
              color: Color.fromARGB(255, 25, 66, 131),
              width: 1,
            )),
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 255, 255, 255)),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  (text == null) ? 'default' : text,
                  style: TextStyle(color: Colors.black),
                ),
                icon,
              ],
            ),
          ),
        ));
  }
}
