import 'package:flutter/material.dart';
import 'package:music_app_test_getx/model/podcast_model.dart';

class PodcastCard extends StatelessWidget {
  final PodcastModel podcast;

  PodcastCard({
    super.key,
    required this.podcast,
  });

  @override
  Widget build(BuildContext context) {
    //giá trị cố định để set cho phần tử Stack
    final double x = 5;
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        // what tap to navigate to song detail
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /************************************
             * podcast Card begin
             **********************************/
            Stack(fit: StackFit.loose, clipBehavior: Clip.none, children: [
              Container(
                //height: size.height * 0.6,
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.only(left: 5, right: 10, top: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey.withOpacity(0.4)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //podcast's title and button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: size.width * 0.7,
                            alignment: Alignment.topLeft,
                            child: ListTile(
                              title: Text(
                                podcast.title,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    //color: Colors.white
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),

                              //podcast's artist
                              subtitle: Text(
                                podcast.artist,
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_border_outlined))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //podcast's image
                    Container(
                      padding: EdgeInsets.only(left: 70, right: 70),
                      child: Image.asset(podcast.imageUrl),
                    ),

                    const SizedBox(
                      height: 30,
                    ),

                    //podcast's description
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 5),
                      width: size.width * 0.8,
                        child: RichText(
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                      children: [
                        TextSpan(
                          text: podcast.getCusCreateAndDuration(),
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              //color: Colors.white
                          ),
                        ),
                       
                        TextSpan(
                          text: podcast.description,
                          style: TextStyle(fontSize: 15,
                              //color: Colors.white70
                          ),
                        )
                      ],
                    ))),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),

              //icon button play
              const Positioned(
                bottom: 30,
                right: 30,
                child: Icon(
                  Icons.play_circle_fill,
                  //color: Colors.white70,
                  size: 40,
                ),
              )
            ]),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
