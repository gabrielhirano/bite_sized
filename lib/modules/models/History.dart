import 'dart:convert';

import 'Coment.dart';
import 'User.dart';

History historyFromJson(String str) => History.fromJson(json.decode(str));

String historyToJson(History data) => json.encode(data.toJson());

class History {
  History({
    required this.id,
    required this.title,
    required this.author,
    required this.thumbUrl,
    required this.like,
    required this.deslike,
    this.coments,
    required this.dateStamp,
  });

  final String id;
  final String title;
  final User author;
  final String thumbUrl;
  final String like;
  final String deslike;
  final List<Coment>? coments;
  final DateTime dateStamp;

  factory History.fromJson(Map<String, dynamic> json) {

    List<Coment> comentarios = [];

    json['coments'].forEach((comentario) {
      var newComentario = Coment.fromJson(comentario);

      comentarios.add(newComentario);

    });

    return History(
      id: json['id'],
      title: json['title'],
      author: User.fromJson(json['author']),
      thumbUrl: json['thumbUrl'],
      like: json['like'],
      deslike: json['deslike'],
      coments: comentarios,
      dateStamp: json['dateStamp'],
    );
  }

  toJson() {
    return {
      'id': id,
      'title': title,
      'author': author.toJson(),
      'thumbUrl': thumbUrl,
      'like': like,
      'deslike': deslike,
      'coments': coments!.map((coment) => coment.toJson()).toList(),
      'dateStamp': dateStamp,
    };
  }
}
