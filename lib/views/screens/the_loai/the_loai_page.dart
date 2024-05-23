import 'package:flutter/material.dart';
import 'package:music_app_test_getx/widget/cus_appbar_title.dart';


class TheLoaiPage extends StatefulWidget {
  @override
  _TheLoaiPageState createState() => _TheLoaiPageState();
}

class _TheLoaiPageState extends State<TheLoaiPage> {
  String resImage = 'assets/images/login_image.jpg';

  List<String>lst1 = [
      'COFFEE',
      'SPORT',
      'TẾT'
  ];

  List<String>lst2 = [
    'QUỐC GIA',
    'NĂM MỚI',
    'NHẠC PHIM'
  ];

  List<String>lst3 = [
    'GIÁNG SINH',
    'THIẾU NHI',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CusTextField(),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            /***********************************
             * Tâm trạng và hoạt động
             * *********************************/
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Tâm trạng và hoạt động',
                style:
                TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 220,
              child: GridView.builder(
                  physics: ClampingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0, // Horizontal space between items
                    mainAxisSpacing: 10.0, // Verticinal space between items
                    childAspectRatio: 2.0, // Aspect ratio of each item
                  ),
                  itemCount: lst1.length,
                  itemBuilder: (context, index){
                    return Card(
                      child: Container(
                        child: Center(
                          child: Text(lst1[index]),
                        ),
                      ),
                    );
                  }

              )
            ),
            /***********************************
             * Tâm trạng và hoạt động
             * *********************************/
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Thể loại',
                style:
                TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                height: 220,
                child: GridView.builder(
                    physics: ClampingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0, // Horizontal space between items
                      mainAxisSpacing: 10.0, // Verticinal space between items
                      childAspectRatio: 2.0, // Aspect ratio of each item
                    ),
                    itemCount: lst2.length,
                    itemBuilder: (context, index){
                      return Card(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(resImage),
                              fit: BoxFit.cover
                            ),


                          ),
                          child: Center(
                            child: Text(lst2[index], style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold
                            ),),
                          ),
                        ),
                      );
                    }

                )
            ),
            /***********************************
             * Tâm trạng và hoạt động
             * *********************************/
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Chủ đề',
                style:
                TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                height: 220,
                child: GridView.builder(
                    physics: ClampingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0, // Horizontal space between items
                      mainAxisSpacing: 10.0, // Verticinal space between items
                      childAspectRatio: 2.0, // Aspect ratio of each item
                    ),
                    itemCount: lst3.length,
                    itemBuilder: (context, index){
                      return Card(
                        child: Container(
                          child: Center(
                            child: Text(lst3[index]),
                          ),
                        ),
                      );
                    }

                )
            ),
          ],
        ),
      )
    );
  }
}