import 'dart:io';
import 'package:http/http.dart' as http;

enum HttpMethod { GET, POST, PUT, PATCH, DELETE }

class BaseService {
  Future<http.Response> request(
      HttpMethod method, String endPoint, dynamic body) async {
    http.Response response;
    switch (method) {
      case HttpMethod.GET:
        response = await http.get(Uri.parse(endPoint));
        break;
      case HttpMethod.POST:
        response = await http.post(Uri.parse(endPoint),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: body);
        break;
      case HttpMethod.PUT:
        response = await http.put(Uri.parse(endPoint),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: body);
        break;
      case HttpMethod.PATCH:
        response = await http.patch(Uri.parse(endPoint),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: body);
        break;
      case HttpMethod.DELETE:
        response = await http.delete(Uri.parse(endPoint));
        break;
    }

    return response;
  }
}
