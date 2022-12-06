import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;


class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  //faz o upload de imagem
  Future<void> uploadFile(String filePath, String fileName) async {
    File file = File(filePath);

    try {
      await storage.ref('arts/$fileName').putFile(file);
      print('enviando');
    } on firebase_core.FirebaseException catch (e) {
      print(e);
    }
  }

  //lista todos as imagens no bucket (file name)
  Future<firebase_storage.ListResult> listFiles() async {
    firebase_storage.ListResult results = await storage.ref('arts').listAll();

    results.items.forEach((firebase_storage.Reference ref) {
      print('Found file: $ref');
    });

    return results;
  }

  //lista imagem (.jpg)
  Future<String> donwloadUrl(String imageName) async {
    String donwloadUrl = await storage.ref('arts/$imageName').getDownloadURL();

    return donwloadUrl;
  }
}
