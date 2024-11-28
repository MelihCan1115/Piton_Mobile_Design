/*import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:mobil_proje_piton/models/list_musics.dart';

class PlaylistProvider extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  int? _currentSongIndex;
  bool _isPlaying = false;
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  PlaylistProvider() {
    listenToDuration();
  }

  List<listMusics> get playlist => musics;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  set currentSongIndex(int? newIndex) {
    _currentSongIndex = newIndex;
    if (newIndex != null) {
      play();
    }
    notifyListeners();
  }

  void play() async {
    if (_currentSongIndex == null) return;
    final String path = playlist[_currentSongIndex!].musics_Musicpath;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
    _isPlaying = true;
    notifyListeners();
  }

  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  void pauseOrResume() {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
  }

  void playNextSong() {
    if (_currentSongIndex != null) {
      currentSongIndex =
          (_currentSongIndex! + 1) % playlist.length; // Döngüye alır
    }
  }

  void playPreviousSong() {
    if (_currentSongIndex != null) {
      currentSongIndex = (_currentSongIndex! - 1) < 0
          ? playlist.length - 1
          : _currentSongIndex! - 1;
    }
  }

  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  void listenToDuration() {
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }
}
*/