import 'package:bite_sized/modules/models/User.dart';
import 'package:flutter/material.dart';

class LoggedUser{
  
  @protected
  static User? _usuario;
  
  static User get user => _usuario!;

  static void setUser(User user) => _usuario = user;

  static void reset() => _usuario = null;
}