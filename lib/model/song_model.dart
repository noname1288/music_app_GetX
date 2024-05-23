class SongModel {
  final String title;
  final String artist;
  final String genre;
  final String duration;
  final String url;
  final String coverUrl;


  SongModel(this.title, this.artist, this.genre, this.duration, this.url, this.coverUrl);

  static List<SongModel> songs = [
    SongModel(
      'Em Yêu Cô Ấy',
      'Double 2T',
      'Pop',
      '03:68',
      'assets/musics/emyeucoay.mp3',
      'assets/images/login_image.jpg'
    ),
     SongModel(
      'Hành trang chuyện buồn',
      'Đạt G',
      'Pop',
      '04:32',
      'assets/musics/HanhTrangChuyenBuon.mp3',
      'assets/images/login_image.jpg'
    ),
    SongModel(
      'Nhạt fine',
      'Tones and I',
      'Pop',
      '03:31',
      'assets/musics/nhatfine.mp3',
      'assets/images/login_image.jpg'
    ),
     SongModel(
      'Em Yêu Cô Ấy',
      'Double 2T',
      'Pop',
      '03:68',
      'assets/musics/emyeucoay.mp3',
      'assets/images/login_image.jpg'
    ),
     SongModel(
      'Hành trang chuyện buồn',
      'Đạt G',
      'Pop',
      '04:32',
      'assets/musics/HanhTrangChuyenBuon.mp3',
      'assets/images/login_image.jpg'
    ),
    SongModel(
      'Nhạt fine',
      'Tones and I',
      'Pop',
      '03:31',
      'assets/musics/nhatfine.mp3',
      'assets/images/login_image.jpg'
    ),
  ];
}