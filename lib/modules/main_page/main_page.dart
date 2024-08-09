import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kodiary_test/constants/custom_sizedBox.dart';

import '../google_maps/google_map.dart';
import '../ntc_data_package/home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonButton(
              buttonText: "Home Page",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyHomePage();

                },));
              },



            ),
            sBoxH10,
            CommonButton(
              buttonText: "Map Page",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MapPage();

                },));
              },


            ),
          ],
        ),
      ),
    );
  }
}

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key, required this.buttonText, this.onTap,
  });
  final String buttonText;
  final void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,horizontal: 10,

      ),
      decoration: BoxDecoration(
        color: Colors.blue,


      ),
      child: GestureDetector(
          onTap: onTap,
          child: Text(buttonText)),
    );
  }
}
