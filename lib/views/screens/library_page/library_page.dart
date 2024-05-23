import 'package:flutter/material.dart';
import 'package:music_app_test_getx/model/song_model.dart';
import 'package:music_app_test_getx/widget/song_card.dart';

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    //list recently song
    List<SongModel> songs = SongModel.songs;

    //list folder
    List<String> nameFolder = [
      'Liked Tracks',
      'Playlists',
      'Albums',
      'Artists',
    ];
    return Scaffold(
        appBar: _CustomAppBar1(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /******************* 
            'Liked Tracks','Playlists','Albums','Artists',
            ************************/
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: size.height * 0.3,
                child: ListView.builder(
                  itemCount: nameFolder.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        nameFolder[index],
                        style: TextStyle(fontSize: 17),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                      onTap: () {},
                    );
                  },
                ),
              ),

              /******************* 
            'Liked Tracks','Playlists','Albums','Artists',
            ************************/
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: const Text(
                  'Recently played',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.18,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: songs.length,
                        itemBuilder: (context, index) {
                          return SongCard(song: songs[index]);
                        }),
                  ),
                ],
              ),

              /******************* 
            *Listening history and list
            ************************/
              const SizedBox(
                height: 30,
              ),

              /********
               * listening history and button 
               */
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: const Text(
                      'Listening history',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all<Size>(Size(10, 10)),
                      ),
                      child: const Text('See all'),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              /********
               * list of history track
               ************/
              const SizedBox(
                height: 10,
              ),
              Column(children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: ListView.builder(
                    itemCount: songs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        
                        title: Text(songs[index].title),
                        subtitle: Text(songs[index].artist),
                        trailing: Text(songs[index].duration),
                      );
                    },
                                ),
                ),],)
              
            ],
          ),
        ));
  }
}

/********************
 * Custom AppBar
*********************/
class _CustomAppBar1 extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppBar1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Library',
        style: TextStyle(fontWeight: FontWeight.w800),
      ),
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            Navigator.pushNamed(context, '/searchPage');
          },
        ),
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {
            Navigator.pushNamed(context, '');
          },
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);
}
