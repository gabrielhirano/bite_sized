import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key, required this.pathImage});

  final String pathImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0, 25, 0.0),
      child: Image.network(
        pathImage,
        height: MediaQuery.of(context).size.height * 0.3,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
