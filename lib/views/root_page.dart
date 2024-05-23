import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:music_app_test_getx/views/screens/ca_nhan/ca_nhan_page.dart';
import 'package:music_app_test_getx/views/screens/nhac_moi/nhac_moi_page.dart';
import 'package:music_app_test_getx/views/screens/the_loai/the_loai_page.dart';
import 'package:music_app_test_getx/views/screens/top_podcast/top_podcast_page.dart';
import 'package:music_app_test_getx/views/screens/xep_hang/xep_hang_page.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _currentIndex = 0;
  final _pageController = PageController();

  //Danh sách các trang
  List<Widget> pages = [
    NhacMoiPage(),
    CaNhanPage(),
    TopPodcastPage(),
    XepHangPage(),
    TheLoaiPage()
  ];

// Danh sách các icon của BottomNavigationBar
  List<IconData> pageIcon = [
    Icons.home,
    Icons.co_present_outlined,
    Icons.podcasts_rounded,
    Icons.looks,
    Icons.music_video_rounded
  ];

// Danh sách tên page

  List<String> pageName = [
    'Nhạc mới',
    'Cá nhân',
    'Top Podcast',
    'Xếp hạng',
    'Thể loại'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: pages),
        Miniplayer(minHeight: 70, 
        maxHeight: MediaQuery.of(context).size.height, 
        builder: (height, percentage) {
          return Container(
            color: Colors.red,
            height: height,
            child: Center(
              child: Text('$height $percentage'),
            ),
          );
        }
        ),
      ]),

      /******************************
       * Create a bottom navigation bar
       ******************************/
      bottomNavigationBar: NavigationBarTheme(
        //cài theme
        data: NavigationBarThemeData(
            //indicatorColor: Color.fromARGB(255, 223, 234, 159),

            labelTextStyle: WidgetStateProperty.all(
                TextStyle(fontSize: 12, fontWeight: FontWeight.w400))),

        //set giá trị
        child: NavigationBar(
          //backgroundColor: LocalColor.color2,
          selectedIndex: _currentIndex,
          onDestinationSelected: (index) {
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
            setState(() {
              _currentIndex = index;
            });
          },
          destinations: [
            for (var i = 0; i < pages.length; i++)
              NavigationDestination(
                icon: Icon(pageIcon[i]),
                label: pageName[i],
              )
          ],
        ),
      ),
    );
  }
}
