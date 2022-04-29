import 'dart:convert';

import 'package:http/http.dart' as http;

class UserDetails{
  late final int id;
  late final String userId;
  late final String title;
  late final String body;
  UserDetails({required this.id, required this.userId, required this.title, required this.body});
}

