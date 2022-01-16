import 'package:hearify_it/entities/entity_playlist.dart';
import 'package:hearify_it/entities/entity_track.dart';
import 'package:hearify_it/repository/repo.dart';

import 'package:rxdart/rxdart.dart';

class PlaylistBloc {
  final _repository = RepositoryPlaylist();

  final PublishSubject _playlist_list_Fetcher = PublishSubject<ListPlaylistModel>();
  final PublishSubject _tracks_list_Fetcher = PublishSubject<TracksPlaylistModel>();

  Stream get playlistList => _playlist_list_Fetcher.stream;
  Stream get tracksList => _tracks_list_Fetcher.stream;

  fetchPlaylistList() async {
    ListPlaylistModel code = await _repository.fetchPlaylistList();
    _playlist_list_Fetcher.sink.add(code);
  }
  fetchTracksList(String url) async {
    TracksPlaylistModel tracks = await _repository.fetchTracksList(url);
    _tracks_list_Fetcher.sink.add(tracks);
  }

  disposePlaylist() {
    _playlist_list_Fetcher.close();
  }
  disposeTracks() {
    _tracks_list_Fetcher.close();
  }
}

final PlaylistBloc playlistBloc = PlaylistBloc();