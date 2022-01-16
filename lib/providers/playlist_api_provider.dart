import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:hearify_it/entities/entity_auth_token.dart';
import 'package:hearify_it/entities/entity_playlist.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'api_provider_token.dart';
import 'authorization_api.dart';

class PlaylistListApiProvider {
  final _client = Api().client;
  var urlToPlaylist = Uri.parse('https://api.spotify.com/v1/me/playlists');

  Future<ListPlaylistModel?> fetchPlaylistList() async {
    try{
      final response = await _client.get(
        urlToPlaylist.toString(),
      );
      if (response.statusCode == 200) {
        // If the call to the server was successful, parse the JSON
        return ListPlaylistModel.fromJson(response.data);
      } else {
        // If that call was not successful, throw an error.
        print("EstatusCode: ${response.statusCode}");
        print("BODY: ${response.data}");
        throw Exception('Failed to get Playlist');
      }
    }catch(e){
      if(e is DioError && (e).response?.statusCode == 401 || (e as DioError).response?.statusCode == 400){
        await Api().refreshToken();
        fetchPlaylistList();
        return null;
      }

    }


  }
}
