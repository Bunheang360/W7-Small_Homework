import 'package:flutter/material.dart';
import '../../../../model/settings/app_settings.dart';
import '../../../../data/repositories/songs/song_repository.dart';
import '../../../../ui/states/player_state.dart';
import '../../../../ui/states/settings_state.dart';
import '../../../../model/songs/song.dart';

class LibraryViewModel extends ChangeNotifier {

  final SongRepository songRepository;
  final PlayerState playerState;
  final AppSettingsState settingsState;

  List<Song> _song = [];

  LibraryViewModel ({
    required this.songRepository,
    required this.playerState,
    required this.settingsState,
  }) {
    playerState.addListener(notifyListeners);
    settingsState.addListener(notifyListeners);
    init();
  }

  void init () {
    _song = songRepository.fetchSongs();
    notifyListeners();
  }

  List<Song> get songs => _song;

  ThemeColor get theme => settingsState.theme;
  
  bool isPlaying (Song song) => playerState.currentSong == song;

  void songPlay (Song song) {
    playerState.start(song);
  }

  void songStop () {
    playerState.stop();
  }

  @override
  void dispose () {
    playerState.removeListener(notifyListeners);
    settingsState.removeListener(notifyListeners);
    super.dispose();
  }

}