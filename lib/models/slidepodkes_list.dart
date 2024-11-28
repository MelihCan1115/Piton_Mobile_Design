class SlidePodkesList {
  final String podkes_Name;
  final String podkes_Textfield;
  final String podkes_Imagepath;

  SlidePodkesList(
      {required this.podkes_Name,
      required this.podkes_Textfield,
      required this.podkes_Imagepath});
}

List<SlidePodkesList> podkes = [
  SlidePodkesList(
      podkes_Name: 'Welcome',
      podkes_Textfield: 'Welcome to the app! Swipe right to explore more.',
      podkes_Imagepath: 'assets/images/img_Podkes.png'),
  SlidePodkesList(
      podkes_Name: 'Podkes',
      podkes_Textfield:
          'A podcast is an episodic series of spoken word digital audio files that a user can download to a personal device for easy listening.',
      podkes_Imagepath: 'assets/images/img_Podkes.png'),
  SlidePodkesList(
      podkes_Name: 'Discover',
      podkes_Textfield: 'lets try our podkes now',
      podkes_Imagepath: 'assets/images/img_Podkes.png'),
];
