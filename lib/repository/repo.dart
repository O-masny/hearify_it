import 'dart:async';
import 'package:hearify_it/entities/entity_auth_token.dart';
import 'package:hearify_it/entities/entity_playlist.dart';
import 'package:hearify_it/entities/entity_track.dart';
import 'package:hearify_it/providers/api_provider_token.dart';
import 'package:hearify_it/providers/authorization_api.dart';
import 'package:hearify_it/providers/playlist_api_provider.dart';
import 'package:hearify_it/providers/tracks_api_provider.dart';

class RepositoryAuthorization {
  final authorizationCodeApiProvider = AuthorizationApiProvider();
  final authorizationTokenApiProvider = AuthorizationTokenApiProvider();
  Future<String?> fetchAuthorizationCode() =>
      authorizationCodeApiProvider.fetchCode();
  Future<AuthorizationModel> fetchAuthorizationToken(String code) =>
      authorizationTokenApiProvider.fetchToken(code);
}

class RepositoryPlaylist {
  final playlistsListApiProvider = PlaylistListApiProvider();
  final tracksPlaylistApiProvider = TracksPlaylistApiProvider();
  Future<ListPlaylistModel> fetchPlaylistList() =>
      playlistsListApiProvider.fetchPlaylistList();
  Future<TracksPlaylistModel> fetchTracksList(String url) =>
      tracksPlaylistApiProvider.fetchTracks(url);
}
