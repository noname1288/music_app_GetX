import 'package:flutter/material.dart';
import 'package:music_app_test_getx/controllers/audio_player_controller.dart';
import 'package:music_app_test_getx/model/song_model.dart';
import 'package:music_app_test_getx/views/root_page.dart';
import 'package:music_app_test_getx/views/screens/ca_nhan/ca_nhan_page.dart';
import 'package:music_app_test_getx/views/screens/library_page/library_page.dart';
import 'package:music_app_test_getx/views/screens/nhac_moi/nhac_moi_page.dart';
import 'package:music_app_test_getx/views/screens/song_detail/song_detail_page.dart';
import 'package:music_app_test_getx/views/screens/search_page.dart';


import 'package:get/get.dart';
import 'package:music_app_test_getx/views/screens/the_loai/the_loai_page.dart';
import 'package:music_app_test_getx/views/screens/top_podcast/top_podcast_page.dart';
import 'package:music_app_test_getx/views/screens/xep_hang/xep_hang_page.dart';

void main() {
  Get.put(AudioPlayerController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        // primarySwatch: Colors.blue,
        // primaryColor: Colors.red,
        scaffoldBackgroundColor: Colors.white,
        
        
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        appBarTheme:const  AppBarTheme(
          color: Colors.black,
        ),
        scaffoldBackgroundColor: Colors.black,
      ),
      //initialBinding: AudioBinding(),
      home: RootPage(),
      getPages: [
        GetPage(name: '/', page: () => NhacMoiPage()),
        GetPage(name: '/CaNhanPage', page: () => CaNhanPage()),
        GetPage(name: '/TopPodcastPage', page: () => TopPodcastPage()),
        GetPage(name: '/XepHangPage', page: () => XepHangPage()),
        GetPage(name: '/TheLoaiPage', page:() => TheLoaiPage()),
        GetPage(name: '/searchPage', page: () => SearchPage()),
        GetPage(name: '/libraryPage', page: () => LibraryPage()),
        GetPage(
          name: '/songDetail', 
          page: (){
            final SongModel songUrl = Get.arguments as SongModel;
            return SongDetail(song: songUrl);
          }),
      ],

     
      
    );
  }
}




/***********
 * a minium of X screens:
+ authentication ( đăng nhập )
+ home
+ search ( have genre )
+ wishlist
+ setting
+ song page (list songs)
+ author page (list songs)

nav bar bottom
+ home
+ search
+ wishlist
+ setting
***********/