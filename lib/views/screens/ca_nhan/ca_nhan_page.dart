import 'package:flutter/material.dart';
import 'package:music_app_test_getx/model/album_model.dart';
import 'package:music_app_test_getx/model/song_model.dart';
import 'package:music_app_test_getx/views/screens/ca_nhan/folders/album_page.dart';
import 'package:music_app_test_getx/views/screens/ca_nhan/folders/playlist_page.dart';
import 'package:music_app_test_getx/views/screens/ca_nhan/folders/thiet_bi_page.dart';
import 'package:music_app_test_getx/views/screens/ca_nhan/folders/yeu_thich_page.dart';
import 'package:music_app_test_getx/widget/all_widget.dart';
import 'package:music_app_test_getx/widget/cus_appbar_title.dart';

class CaNhanPage extends StatefulWidget {
  @override
  _CaNhanPageState createState() => _CaNhanPageState();
}

class _CaNhanPageState extends State<CaNhanPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> folders = [
      YeuThichPage(),
      PlaylistPage(),
      ThietBiPage(),
      AlbumPage(),
    ];

    List<String> folderName = [
      'Yêu thích',
      'Playlist',
      'Trên thiết bị',
      'Album',
    ];

    List<IconData> folderIcon = [
      Icons.favorite,
      Icons.playlist_play,
      Icons.phone_android,
      Icons.album,
    ];

    List<Album> albums = Album.albums;
    List<SongModel> songs = SongModel.songs;

    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: CusTextField(),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              /************************
               * Thư viện
               ************************/
              Container(
                padding: EdgeInsets.only(left: 10),
                child: const Text(
                  'Thư viện',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 230,
                margin: EdgeInsets.all(10),
                child: GridView.builder(
                    physics: ClampingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0, // Horizontal space between items
                      mainAxisSpacing: 10.0, // Vertical space between items
                      childAspectRatio: 1.5, // Aspect ratio of each item
                    ),
                    itemCount: folders.length,
                    itemBuilder: (context, index) {
                      return Card(
                        //color: Colors.amber[50],
                        child: Container(
                          //height:100,
                          padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                folderIcon[index],
                                size: 35,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(folderName[index])
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              /****************************
               * Gần đây
               *****************************/
              TitleAndButton(
                titleName: 'Gần đây',
                fontSize: 22,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 215,
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return SongCard(song: songs[index]);
                  },
                ),
              ),

              /****************************
               * Có thể bạn muốn nghe
               *****************************/
              TitleAndButton(
                titleName: 'Mixed riêng cho bạn',
                fontSize: 22,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 215,
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return AlbumCard(album: albums[index]);
                  },
                ),
              ),
              /****************************
               * US - UK
               *****************************/
              TitleAndButton(
                titleName: 'US - UK',
                fontSize: 22,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 215,
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return SongCard(song: songs[index]);
                  },
                ),
              ),
              /****************************
               * Hôm nay có gì
               *****************************/
              TitleAndButton(
                titleName: 'Hôm nay có gì',
                fontSize: 22,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 215,
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return SongCard(song: songs[index]);
                  },
                ),
              ),
              /****************************
               * Sôi dộng cùng EDM
               *****************************/
              TitleAndButton(
                titleName: 'Sôi động cùng EDM',
                fontSize: 22,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 215,
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return SongCard(song: songs[index]);
                  },
                ),
              ),
              /****************************
               * Nhạc thư giãn
               *****************************/
              TitleAndButton(
                titleName: 'Nhạc thư giãn',
                fontSize: 22,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 215,
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return SongCard(song: songs[index]);
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
