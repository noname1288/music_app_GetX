class Album{
  final int userId;
  final int id;
  final String title;
  final String coverUrl = 'assets/images/login_image.jpg';

  Album({required this.userId,required this.id,required this.title});

  static List<Album> albums = [
    Album(userId: 1, id: 1, title: 'quidem molestiae enim'),
    Album(userId: 1, id: 2, title: 'sunt qui excepturi placeat culpa'),
    Album(userId: 1, id: 3, title: 'omnis laborum odio'),
    Album(userId: 1, id: 4, title: 'non esse culpa molestiae omnis sed optio'),
    Album(userId: 1, id: 5, title: 'eaque aut omnis a'),
    Album(userId: 1, id: 6, title: 'natus impedit quibusdam illo est'),
    Album(userId: 1, id: 7, title: 'quibusdam autem aliquid et et quia'),
    Album(userId: 1, id: 8, title: 'qui fuga est a eum'),
    Album(userId: 1, id: 9, title: 'saepe unde necessitatibus rem'),
    Album(userId: 1, id: 10, title: 'distinctio laborum qui')
  
  ];

  factory Album.fromJson(Map<String, dynamic> json){
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title']
    );
  }
}