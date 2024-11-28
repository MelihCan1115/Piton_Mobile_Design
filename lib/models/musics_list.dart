class MusicsList {
  final String musics_Textfield;
  final String musics_Name;
  final String musics_Imagepath;
  final String musics_Category;
  final String musics_Musicpath;

  MusicsList({
    required this.musics_Textfield,
    required this.musics_Name,
    required this.musics_Imagepath,
    required this.musics_Category,
    required this.musics_Musicpath,
  });
}

List<MusicsList> musics = [
  MusicsList(
    musics_Name: 'Claire Malone',
    musics_Textfield: 'The missing 96 percent of the universe',
    musics_Imagepath: 'assets/images/img_Claire_Malone.png',
    musics_Category: 'Life',
    musics_Musicpath: 'assets/musics/music_Abumenyang.wav',
  ),
  MusicsList(
    musics_Name: 'Abumenyang',
    musics_Textfield: 'How Dolly Parton led me to an epiphany',
    musics_Imagepath: 'assets/images/img_Abumenyang.png',
    musics_Category: 'Life',
    musics_Musicpath: 'assets/musics/music_Abumenyang.wav',
  ),
  MusicsList(
    musics_Name: 'Tir McDohl',
    musics_Textfield: 'The missing 96 percent of the universe',
    musics_Imagepath: 'assets/images/img_Tir_McDohl.png',
    musics_Category: 'Comedy',
    musics_Musicpath: 'assets/musics/music_Abumenyang.wav',
  ),
  MusicsList(
    musics_Name: 'Denny Kulon',
    musics_Textfield: 'Ngobam with Denny Caknan',
    musics_Imagepath: 'assets/images/img_Denny_Kulon.png',
    musics_Category: 'Tech',
    musics_Musicpath: 'assets/musics/music_Abumenyang.wav',
  ),
  MusicsList(
    musics_Name: 'Abumenyang2',
    musics_Textfield: 'How Dolly Parton led me to an epiphany',
    musics_Imagepath: 'assets/images/img_Abumenyang.png',
    musics_Category: 'Life',
    musics_Musicpath: 'assets/musics/music_Abumenyang.wav',
  ),
];
