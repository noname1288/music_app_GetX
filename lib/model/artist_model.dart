class Artist{
  final String name;
  final String genre;
  String image = 'assets/images/login_image.jpg';

  Artist({required this.name, required this.genre});

  static List<Artist> artists = [
    Artist(name: 'Quan', genre: 'pop'),
    Artist(name: 'Long', genre: 'pop'),
    Artist(name: 'Ha', genre: 'pop'),
    Artist(name: 'Quan', genre: 'pop'),
    Artist(name: 'Tam hhahaa', genre: 'pop'),
    Artist(name: 'NHI HAHAA', genre: 'pop')
  ];
}