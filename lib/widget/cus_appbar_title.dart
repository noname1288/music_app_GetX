
import 'package:flutter/material.dart';

/****************
**SEARCH BAR
******************/

class CusTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(left: 40),
      width: size.width * 0.7,
      child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/searchPage');
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
          ),
          child: const Row(
            children: [
              Icon(
                Icons.search,
                color: Colors.grey,
              ),
              SizedBox(
                  width: 10), // This will add space between the icon and label
              Text(
                'Tìm kiếm bài hát ...',
                style: TextStyle(color: Colors.grey),
              )
            ],
          )),
    );
  }
}
