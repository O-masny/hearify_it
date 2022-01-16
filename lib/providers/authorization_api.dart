import 'dart:async';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:http/http.dart' show Client;

class AuthorizationApiProvider {
  Client client = Client();

  static String url = "https://accounts.spotify.com/authorize";
  static String client_id = "1c9f60ec949d4f6a8ec0da2e7eab4d54";
  static String response_type = "code";
  static String redirect_uri = "hearify_it://callback";
  static String scope =
      "playlist-read-private playlist-read-collaborative";
  static String state = "34fFs29kd09";

  String urlDireccion = url +
      "?client_id=$client_id" +
      "&response_type=$response_type" +
      "&redirect_uri=$redirect_uri" +
      "&scope=$scope" +
      "&state=$state";

  Future<String?> fetchCode() async {
    final response = await FlutterWebAuth.authenticate(
        url: urlDireccion, callbackUrlScheme: "hearify_it://callback");
    final error = Uri.parse(response).queryParameters['error'];
    if (error == null) {
      final code = Uri.parse(response).queryParameters['code'];
      return code;
    } else {
      print("Error al autenticar");
      return error;
    }
  }
}