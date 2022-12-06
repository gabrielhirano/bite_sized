import 'package:bite_sized/widgets/background_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  String pathImage = 'https://th.bing.com/th/id/OIP.GMFIR_fiNa4eDqfDV4gx7QHaE6?pid=ImgDet&rs=1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            BackgroundImage(
              pathImage: pathImage,
            ),
     
          ],
        ),
      ),
    );
  }
}
