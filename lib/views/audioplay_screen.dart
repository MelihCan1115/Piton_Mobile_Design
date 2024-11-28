import 'package:flutter/material.dart';
import 'package:mobil_proje_piton/models/musics_list.dart';
import 'package:mobil_proje_piton/core/constants/color_Palette.dart';
import 'package:just_audio/just_audio.dart';

class AudioplayScreen extends StatefulWidget {
  final MusicsList music;

  const AudioplayScreen({Key? key, required this.music}) : super(key: key);

  @override
  _AudioplayScreenState createState() => _AudioplayScreenState();
}

class _AudioplayScreenState extends State<AudioplayScreen> {
  late AudioPlayer _audioPlayer; // Ses çalar
  late Stream<Duration> _positionStream; // İlerleme için akış
  bool _isPlaying = false; // Çalıyor mu durumu
  Duration _currentPosition = Duration.zero; // Şu anki konum
  Duration _totalDuration = Duration.zero; // Toplam süre

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _positionStream = _audioPlayer.positionStream;
    _setAudioSource();

    // Toplam süreyi ayarla
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
      // Dynamically load the audio source from the music model
      await _audioPlayer.setAsset(widget.music.musics_Musicpath);
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _togglePlayback() async {
    if (_audioPlayer.playing) {
      await _audioPlayer.pause();
      setState(() {
        _isPlaying = false;
      });
    } else {
      await _audioPlayer.play();
      setState(() {
        _isPlaying = true;
      });
    }
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
            padding: const EdgeInsets.only(
                top: 20.0, left: 20.0), // Üstten ve soldan 20px boşluk
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
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("24:32", style: TextStyle(color: Colors.white70)),
                  Text("34:00", style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0),
              ),
              child: Slider(
                min: 0,
                max: 100,
                value: 50,
                activeColor: Colors.green,
                onChanged: (value) {},
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.skip_previous, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    _isPlaying ? Icons.pause_circle_filled : Icons.play_circle,
                    color: Colors.white,
                    size: 50,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPlaying = !_isPlaying;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.skip_next, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
