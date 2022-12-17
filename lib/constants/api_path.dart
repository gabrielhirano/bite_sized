import 'package:bite_sized/modules/models/Coment.dart';
import 'package:bite_sized/modules/models/User.dart';
import 'package:bite_sized/modules/models/History.dart';

class ApiPath {
  static String get login => '';
  static String get cadastro => '';

  static String get baseImageProfile => 'https://avatars.dicebear.com/api/bottts/';
  static List<dynamic> get historias => historiaList.map((historia) => historia.toJson()).toList();
  static String get comentarios => '';



  static final List<History> historiaList = [
    History(
        id: "1",
        title: "Elf Garden",
        author: currentUser,
        thumbUrl:
            "https://i.pinimg.com/originals/fa/e4/d5/fae4d5240a783047aeefb72ebd61fb60.jpg",
        like: "10k",
        deslike: "0",
        coments: [
          coment2,
          coment3,
          coment4,
        ],
        dateStamp: DateTime(2022, 09, 21)),
    History(
        id: "2",
        author: currentUser4,
        title: "Ice Giant",
        thumbUrl:
            "https://i.pinimg.com/736x/d6/82/88/d6828870fa444bf85bd59a8346a21c60.jpg",
        like: "15k",
        deslike: "0",
        coments: [
          coment3,
          coment2,
          coment1,
        ],
        dateStamp: DateTime(2022, 08, 21)),
    History(
        id: "3",
        author: currentUser2,
        title: "Glendosaur",
        thumbUrl:
            "https://live.staticflickr.com/4076/4914179747_89a75e1328_b.jpg",
        like: "18k",
        deslike: "0",
        coments: [
          coment1,
          coment4,
          coment3,
        ],
        dateStamp: DateTime(2022, 08, 21)),
    History(
        id: "4",
        author: currentUser3,
        title: "High map",
        thumbUrl:
            "https://media.discordapp.net/attachments/1008869815714328722/1023265206035566723/pxi496juhtp91.jpg?width=299&height=427",
        like: "18k",
        deslike: "0",
        coments: [
          coment2,
          coment4,
          coment1,
        ],
        dateStamp: DateTime(2022, 08, 21))
  ];
}

User currentUser = User(
    userName: "Sleepado",
    subscribers: "Sleeping");

User currentUser2 = User(
    userName: "Glendius",
    subscribers: "Beeeeez");

User currentUser3 = User(
    userName: "Rafl27",
    subscribers: "Muito forte");

User currentUser4 = User(
    userName: "Billy jhow",
    subscribers: "Workando");

Coment coment1 = Coment(
    author: currentUser,
    coment: "But I must explain to you how all this mistaken idea" +
        "and praising pain was born and I will give you a" +
        "the system, and expound the actual teachings of the" +
        "great explorer of the truth, the master-builder of human" +
        "happiness.",
    dateStamp: DateTime(2022, 09, 21)

    // dataComent: DateTime(2022, 09, 21),
    );
Coment coment2 = Coment(
  author: currentUser2,
  coment: "But I must explain to you how all this mistaken idea" +
      "and praising pain was born and I will give you a" +
      "the system, and expound the actual teachings of the" +
      "great explorer of the truth, the master-builder of human" +
      "happiness.",
  dateStamp: DateTime(2022, 09, 20),
);

Coment coment3 = Coment(
  author: currentUser3,
  coment: "But I must explain to you how all this mistaken idea" +
      "and praising pain was born and I will give you a" +
      "the system, and expound the actual teachings of the" +
      "great explorer of the truth, the master-builder of human" +
      "happiness.",
  dateStamp: DateTime(2022, 09, 20),
);
Coment coment4 = Coment(
  author: currentUser4,
  coment: "But I must explain to you how all this mistaken idea" +
      "and praising pain was born and I will give you a" +
      "the system, and expound the actual teachings of the" +
      "great explorer of the truth, the master-builder of human" +
      "happiness.",
  dateStamp: DateTime(2022, 09, 20),
);
