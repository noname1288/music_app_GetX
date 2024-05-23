import 'package:flutter/material.dart';
import 'package:music_app_test_getx/model/podcast_model.dart';
import 'package:music_app_test_getx/widget/cus_appbar_title.dart';
import 'package:music_app_test_getx/widget/podcast_card.dart';
import 'package:music_app_test_getx/widget/title_and_button.dart';

class TopPodcastPage extends StatefulWidget {
  @override
  _TopPodcastPageState createState() => _TopPodcastPageState();
}

class _TopPodcastPageState extends State<TopPodcastPage> {
  List<PodcastModel> podcasts = PodcastModel.podcasts;

  @override
  Widget build(BuildContext context) {
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
            /******************
            *****Top Podcast
            *******************/
            TitleAndButton(
              titleName: 'Top Podcast',
              fontSize: 25,
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
              shrinkWrap: true, // Ensures ListView takes only the necessary space
              physics: NeverScrollableScrollPhysics(), // Disables ListView's own scrolling
              itemCount: podcasts.length,
              itemBuilder: (context, index) {
                return PodcastCard(podcast: podcasts[index]);
              },
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        )));
  }
}
