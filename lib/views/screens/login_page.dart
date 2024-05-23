import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:music_app_test_getx/const/color.dart';
import 'package:music_app_test_getx/views/root_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        decoration: const BoxDecoration(
          color: LocalColor.color1,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          /***********************
           * "Page's Name and Description"
           **********************/

            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(40, 40, 0, 10),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(40, 0, 0, 30),
              child: Text(
                'Welcome to Miso Music!',
                style: TextStyle(fontSize: 20),
              ),
            ),
          
          
          /***********************
           * "Body"
           **********************/
            Expanded(
              child: Container(

                // Set màu với opacity
                decoration: BoxDecoration(
                  color: LocalColor.color3.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                ),

                //giao diện nhập username và password
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 0, 30, 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            ),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                              ),
                              child: TextField(
                                  decoration: InputDecoration(
                                      hintText: 'Username',
                                      hintStyle: TextStyle(
                                          color: ColorText.color_hintText,
                                          fontWeight: FontWeight.normal),
                                      border: InputBorder.none)),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 0,0, 0),
                              child: TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                          color: ColorText.color_hintText,
                                          fontWeight: FontWeight.normal),
                                      border: InputBorder.none)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    //Button "Login"
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorButton.color_button,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        minimumSize: Size(200, 50),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => RootPage()));
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),

                    //Button "Forgot password?"
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(
                              color: ColorText.color_text,
                              fontSize: 12,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
