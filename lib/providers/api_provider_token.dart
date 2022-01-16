import 'dart:async';
import 'package:hearify_it/entities/entity_auth_token.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';

class AuthorizationTokenApiProvider {
  Client client = Client();
  static String client_id = "1c9f60ec949d4f6a8ec0da2e7eab4d54";
  static String client_secret ="73a085e16a2f40c29f514fea4663c830";

  static String AuthorizationStr = "$client_id:$client_secret";
  static var bytes = utf8.encode(AuthorizationStr);
  static var base64Str = base64.encode(bytes);

  String Authorization= 'Basic ' + base64Str;

  var urlToToken = Uri.parse('https://accounts.spotify.com/api/token');

  Future<AuthorizationModel> fetchToken(String code) async {
    var response = await client.post(urlToToken, body: {
      'grant_type': "authorization_code",
      'code': code,
      'redirect_uri': 'http://localhost:8888/callback/'
    },headers: {'Authorization' : Authorization});

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return AuthorizationModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}