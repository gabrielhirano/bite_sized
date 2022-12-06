// import 'package:firebase_core/firebase_core.dart';
import 'package:bite_sized/modules/screens/login_screen.dart';
import 'package:bite_sized/utils/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'modules/screens/main_screen.dart';
// import 'package:bite_sized/modules/screens/login_screen.dart';

// import 'package:homebitesized/screens/register/register.dart';
// import './screens/navscreen/navscreen.dart';
// import 'package:homebitesized/service/localUserInfoService.dart';
// import 'package:homebitesized/screens/login/login.dart';
// import 'package:homebitesized/screens/principal/principal.dart';
// import 'firebase_options.dart';
// import './widgets/storage_service_file.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:file_picker/file_picker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

// bool checkLogged() {
//   clearLocalUserInfo();
//   var userInfo = getLocalUserInfo();
//   return userInfo.toString().isNotEmpty ? true : false;
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: "Bite Sized",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.black54,
          brightness: Brightness.dark,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedItemColor: Colors.white)),
      // correto :home: checkLogged() ? NavScreen() : RegisterScreen(),
      home: const MainScreen(),
      //home: LoginScreen(),
    );
  }
}
