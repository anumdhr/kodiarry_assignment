import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kodiary_test/constants/custom_sizedBox.dart';

import '../../common_widgets/common_button.dart';
import '../google_maps/google_map.dart';
import '../ntc_data_package/pages/data_package_page.dart';

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
                  return const DataPackagePage();

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


