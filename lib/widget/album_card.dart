import 'package:flutter/material.dart';
import 'package:music_app_test_getx/model/album_model.dart';

class AlbumCard extends StatelessWidget {
  const AlbumCard({
    super.key,
    required this.album,
  });

  final Album album;

  @override
  Widget build(BuildContext context) {
    //giá trị cố định để set cho phần tử Stack
    final double x = 5;
    return GestureDetector(
      onTap: (){
        // what tap to navigate to album detail
      },
      child: Container(
        margin: EdgeInsets.only(right: 10, left: 10),
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(fit: StackFit.loose, clipBehavior: Clip.none, children: [
              Container(
                height: 120,
                  width: 120,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Positioned(
                bottom: x*2,
                left: x*2,
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Positioned(
                bottom: x,
                left: x,
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(album.coverUrl),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                ),
              ),
              const Positioned(
                bottom: 2,
                right: 2,
                child: Icon(
                  Icons.play_circle_fill,
                  color: Colors.white70,
                  size: 25,
                ),
              )
            ]),
            SizedBox(
              height: 10,
            ),
            Container(
                height: 45,
                //color: Colors.amber,
                width: 120,
                child: Text(album.title,
                    style:
                        TextStyle(overflow: TextOverflow.ellipsis, fontSize: 14),
                    maxLines: 2))
          ],
        ),
      ),
    );
  }
}
