class PodcastModel{
  // key index ?? 
  int idPodcast;  // stt
  String title;
  String artist;
  String description;
  String url;
  String imageUrl = 'assets/images/login_image.jpg';
  String duration;
  String createAt;


  PodcastModel({required this.idPodcast,required this.title,required this.artist,required this.description,required this.url,required this.imageUrl, required this.duration, required this.createAt});

  String getCusCreateAndDuration(){
    return createAt + ', ' + duration + " • ";
  }
  static List <PodcastModel> podcasts = [
    PodcastModel(
      idPodcast: 1,
      title: '1. Khi nào chúng ta nên rời bỏ một mối quan hệ?',
      artist: 'Tones and I',
      description: 'Every website and mobile app, more or less, contains text. In Flutter, you can display a paragraph text that has multiple different styles by using a RichText widget and a tree of TextSpan widgets in combination. The text may be on a single line or multiple lines based on the layout constraints.',
      url: 'assets/musics/emyeucoay.mp3',
      imageUrl: 'assets/images/login_image.jpg',
      duration: '3:00',
      createAt: '2021.09.01'
    ),

    PodcastModel(
      idPodcast: 2,
      title: '2. Dance Monkey',
      artist: 'Tones and I',
      description: 'hello!!!',
      url: 'assets/musics/emyeucoay.mp3',
      imageUrl: 'assets/images/login_image.jpg',
      duration: '3:00',
      createAt: '2021.09.01'
    ),
    PodcastModel(
      idPodcast: 3,
      title: '3. Dance Monkey',
      artist: 'Tones and I',
      description: 'hello!!!',
      url: 'assets/musics/emyeucoay.mp3',
      imageUrl: 'assets/images/login_image.jpg',
      duration: '3:00',
      createAt: '2021.09.01'
    ),
    // PodcastModel(
    //   idPodcast: 4,
    //   title: 'Dance Monkey',
    //   artist: 'Tones and I',
    //   description: 'hello!!!',
    //   url: 'assets/musics/emyeucoay.mp3',
    //   imageUrl: 'assets/images/login_image.jpg'
    // ),
    // PodcastModel(
    //   idPodcast: 5,
    //   title: 'Dance Monkey',
    //   artist: 'Tones and I',
    //   description: 'hello!!!',
    //   url: 'assets/musics/emyeucoay.mp3',
    //   imageUrl: 'assets/images/login_image.jpg'
    // ),
    // PodcastModel(
    //   idPodcast: 6,
    //   title: 'Dance Monkey',
    //   artist: 'Tones and I',
    //   description: 'hello!!!',
    //   url: 'assets/musics/emyeucoay.mp3',
    //   imageUrl: 'assets/images/login_image.jpg'
    // ),
    // PodcastModel(
    //   idPodcast: 7,
    //   title: 'Dance Monkey',
    //   artist: 'Tones and I',
    //   description: 'hello!!!',
    //   url: 'assets/musics/emyeucoay.mp3',
    //   imageUrl: 'assets/images/login_image.jpg'
    // ),
    // PodcastModel(
    //   idPodcast: 8,
    //   title: 'Dance Monkey',
    //   artist: 'Tones and I',
    //   description: 'hello!!!',
    //   url: 'assets/musics/emyeucoay.mp3',
    //   imageUrl: 'assets/images/login_image.jpg'
    // ),
    // PodcastModel(
    //   idPodcast: 9,
    //   title: 'Dance Monkey',
    //   artist: 'Tones and I',
    //   description: 'hello!!!',
    //   url: 'assets/musics/emyeucoay.mp3',
    //   imageUrl: 'assets/images/login_image.jpg'
    // ),
    // PodcastModel(
    //   idPodcast: 10,
    //   title: 'Dance Monkey',
    //   artist: 'Tones and I',
    //   description: 'hello!!!',
    //   url: 'assets/musics/emyeucoay.mp3',
    //   imageUrl: 'assets/images/login_image.jpg'
    // ),
    // PodcastModel(
    //   idPodcast: 11,
    //   title: 'Dance Monkey',
    //   artist: 'Tones and I',
    //   description: 'hello!!!',
    //   url: 'assets/musics/emyeucoay.mp3',
    //   imageUrl: 'assets/images/login_image.jpg'
    // ),
    
  ];
}