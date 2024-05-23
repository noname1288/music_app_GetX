import 'package:flutter/material.dart';
import 'package:music_app_test_getx/model/artist_model.dart';

class ArtistCard extends StatelessWidget {
  const ArtistCard({
    super.key,
    required this.artist,
  });

  final Artist artist;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Container(
            width: 140,
            height: 140,
            child: CircleAvatar(
              backgroundImage: AssetImage(artist.image),
            )),
        Container(
          height: 25,
          margin: EdgeInsets.only(bottom: 5),
          padding: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.7)),
          child: Text(artist.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis)),
        ),
        SizedBox(height: 8,),
        ElevatedButton(onPressed: (){}, child: Text('Follow'))
      ]),
    );
  }
}
