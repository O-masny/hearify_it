import 'dart:async';
import 'package:dio/dio.dart';
import 'package:hearify_it/entities/entity_track.dart';
import 'authorization_api.dart';

class UserInformationProvider {
  final _client = Api().client;

  Future<TracksPlaylistModel?> fetchUserInfo() async {
    var url = " https://api.spotify.com/v1/me";
    try {
      final response = await _client.get(
        url.toString(),
      );
      if (response.statusCode == 200) {
        // If the call to the server was successful, parse the JSON
        return TracksPlaylistModel.fromJson(response.data);
      } else {
        // If that call was not successful, throw an error.
        print("EstatusCode: ${response.statusCode}");
        print("BODY: ${response.data}");
        throw Exception('Failed to get Tracks');
      }
    } catch (e) {
      if (e is DioError && (e).response?.statusCode == 401 ||
          (e as DioError).response?.statusCode == 400) {
        await Api().refreshToken();
        fetchUserInfo();
        return null;
      }
    }
  }
}
