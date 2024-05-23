import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app_test_getx/model/song_model.dart';

class SongList extends StatelessWidget {
  final SongModel song;
  SongList({
    super.key,
    required this.song,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // what tap to navigate to song detail
        Get.toNamed('/songDetail', arguments: song);
      },
      child: Container(
        padding: EdgeInsets.all(7),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(song.coverUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top:3),
                  height: 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        song.title,
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        song.artist,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 70,
                width: 50,
                decoration: BoxDecoration(
                ),
                child:IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz_outlined)),
              )
            ],
          ),
      ),
    );
  }
}