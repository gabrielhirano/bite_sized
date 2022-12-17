import 'package:bite_sized/constants/api_path.dart';
import 'package:bite_sized/widgets/background_image.dart';
import 'package:bite_sized/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String pathImage =
      'https://th.bing.com/th/id/OIP.GMFIR_fiNa4eDqfDV4gx7QHaE6?pid=ImgDet&rs=1';

  final userName = TextEditingController();

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
            _profileIcon(),
            Container(
              padding: EdgeInsetsDirectional.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1),
              child: Column(
                children: [
                  _buildTitleArea(),

                  //Spacer(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _profileIcon() {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 255, 255, 255), width: 1),
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: ValueListenableBuilder(
          valueListenable: userName,
          builder: (_, __, ___) {
            print(userName.text == '');
            return CircleAvatar(
                foregroundImage: NetworkImage(ApiPath.baseImageProfile +
                    (userName.text ?? 'default') +
                    '.png'));
          }),
    );
  }

  _buildTitleArea() {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: ValueListenableBuilder(
            valueListenable: userName,
            builder: (_, __, ___) {
              return Text(
                (userName.text == '') ? 'Nickname' : userName.text,
                style: const TextStyle(fontSize: 20),
              );
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Name is required.';
                    }
                  },
                  style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 0, 0, 0),
                      hintText: 'Digite seu nick'),
                  controller: userName,
                ),
                const SizedBox(
                  height: 200,
                ),
                Builder(builder: (context) {
                  return _buildButtonCadastrar(context);
                })
                
              ],
            ),
          ),
        )
      ],
    );
  }

  _buildButtonCadastrar(BuildContext context) {
    return CustomButton(
      text: 'Confirmar',
      icon: const Icon(
        Icons.send,
        size: 24.0,
        color: Colors.black,
      ),
      onPressed: () {
        var validate = Form.of(context).validate();
        if (!validate!) return;
        print('Confirmando perfil');
      },
    );
  }
}
