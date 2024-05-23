import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app_test_getx/controllers/audio_player_controller.dart';
import 'package:music_app_test_getx/model/song_model.dart';
import 'package:music_app_test_getx/widget/cus_appbar_title.dart';
import 'package:music_app_test_getx/widget/song_list.dart';
import 'package:music_app_test_getx/widget/title_and_button.dart';

class NhacMoiPage extends StatefulWidget {
  @override
  _NhacMoiPageState createState() => _NhacMoiPageState();
}

class _NhacMoiPageState extends State<NhacMoiPage> {
  @override
  void initState() {
    super.initState();
    //Get.put(AudioPlayerController());

  }
  
  @override
  Widget build(BuildContext context) {
    List<SongModel> songs = SongModel.songs;

    return Scaffold(
        appBar: AppBar(
          title: CusTextField(),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /******************
              *****Nhạc Tổng hợp
              *******************/
              const SizedBox(
                height: 20,
              ),
              TitleAndButton(titleName: 'Nhạc Tổng Hợp', fontSize: 25,),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 420,
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return SongList(song: songs[index]);
                  },
                ),
              ),

              /******************
              *Nhạc Thái Lan
              *******************/
              const SizedBox(
                height: 20,
              ),
              TitleAndButton(titleName: 'Nhạc Thái Lan', fontSize: 25,),
              const SizedBox(
                height: 10,
              ),
              Container(
                height:420,
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return SongList(song: songs[index]);
                  },
                ),
              ),

              /******************
              *Nhạc KPop
              *******************/
              const SizedBox(
                height: 20,
              ),
              TitleAndButton(titleName: 'Nhạc KPOP',fontSize: 25,),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 420,
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return SongList(song: songs[index]);
                  },
                ),
              ),

              /******************
              *Nhạc US UK 
              *******************/
              const SizedBox(
                height: 20,
              ),
              TitleAndButton(titleName: 'Nhạc US UK', fontSize: 25,),
              const SizedBox(
                height: 10,
              ),
              Container(
                height:420,
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return SongList(song: songs[index]);
                  },
                ),
              ),

              /******************
              *Test Indonesia song 
              *******************/
              const SizedBox(
                height: 20,
              ),
              TitleAndButton(titleName: 'Nhạc Indonesia',fontSize: 25,),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 420,
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return SongList(song: songs[index]);
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
