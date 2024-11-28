import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mobil_proje_piton/models/musics_list.dart';
import 'package:mobil_proje_piton/core/constants/color_Palette.dart';

class AudioplayScreen extends StatefulWidget {
  final MusicsList music;

  const AudioplayScreen({Key? key, required this.music}) : super(key: key);

  @override
  _AudioplayScreenState createState() => _AudioplayScreenState();
}

class _AudioplayScreenState extends State<AudioplayScreen> {
  late AudioPlayer _audioPlayer;
  late Stream<Duration> _positionStream;
  bool _isPlaying = false;
  Duration _currentPosition = Duration.zero;
  Duration _totalDuration = Duration.zero;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _positionStream = _audioPlayer.positionStream;
    _setAudioSource();

    _audioPlayer.playerStateStream.listen((state) {
      setState(() {
        _isPlaying = state.playing;
      });
    });

    _audioPlayer.durationStream.listen((duration) {
      if (duration != null) {
        setState(() {
          _totalDuration = duration;
        });
      }
    });
  }

  Future<void> _setAudioSource() async {
    try {
      await _audioPlayer.setAsset('assets/musics/music_Abumenyang.wav');
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  Future<void> _togglePlayback() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play();
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.pagesBackground,
      appBar: AppBar(
        backgroundColor: ColorPalette.pagesBackground,
        elevation: 0,
        leading: IconButton(
          icon: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0),
            child: Container(
              padding: const EdgeInsets.all(4),
              child: Image.asset(
                'assets/icons/icon_Back.png',
                width: 28,
                height: 28,
                color: Colors.white,
              ),
            ),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Now Playing",
          style: TextStyle(
            fontFamily: 'Poppins',
            color: ColorPalette.textColor,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.music.musics_Imagepath,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 24),
            Text(
              widget.music.musics_Textfield,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              widget.music.musics_Name,
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 24),
            StreamBuilder<Duration>(
              stream: _positionStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  _currentPosition = snapshot.data!;
                }
                return Column(
                  children: [
                    Container(
                      height: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: LinearProgressIndicator(
                        value: _currentPosition.inMilliseconds /
                            (_totalDuration.inMilliseconds > 0
                                ? _totalDuration.inMilliseconds
                                : 1),
                        backgroundColor: Colors.grey[300],
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${_formatDuration(_currentPosition)} / ${_formatDuration(_totalDuration)}",
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _togglePlayback,
              icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
              label: Text(_isPlaying ? "Pause" : "Play"),
            ),
          ],
        ),
      ),
    );
  }
}
