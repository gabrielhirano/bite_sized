
import 'dart:convert';

import 'User.dart';

Coment comentFromJson(String str) => Coment.fromJson(json.decode(str));

String comentToJson(Coment data) => json.encode(data.toJson());


class Coment {
    const Coment({
    required this.author,
    required this.coment,
    required this.dateStamp
  });

  final User author;
  final String coment;
  final DateTime dateStamp;

  factory Coment.fromJson(Map<String, dynamic> json) => Coment(
    author: User.fromJson(json['author']),
    coment: json['coment'],
    dateStamp: json['dateStamp']
  );

  toJson(){
    return{
      'author': author.toJson(),
      'coment': coment,
      'dateStamp': dateStamp
      
    };
  }
}