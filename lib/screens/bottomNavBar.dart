import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tikwebapptask/components/color_config.dart';
import 'package:tikwebapptask/components/style_text.dart';
import 'package:tikwebapptask/controller/navBarController.dart';
import 'package:tikwebapptask/screens/bottomBarItems/profileScreen.dart';
import 'package:tikwebapptask/screens/bottomBarItems/usersScreen.dart';

class BottomNavBar extends StatelessWidget {

  var navController=Get.put(BottomNavBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(()=>PageView(
            onPageChanged: (int page) {
              navController.page.value=page;
            },
            controller: navController.controller.value,
            children: [
              UserScreen(),
              ProfileScreen(),
            ],
          ),),


          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  color: kBlackColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0),topRight: Radius.circular(40.0))
              ),
              child: Row(
                mainAxisAlignment: mainAxisAlignmentAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,width: 50,
                      child: Column(
                        crossAxisAlignment: crossAxisAlignmentCenter,
                        mainAxisAlignment: mainAxisAlignmentCenter,
                        children: [
                          Icon(Icons.exit_to_app,color: kWhiteColor,size: 14.0,),
                          textRoboto("EXIT", kWhiteColor,fontSize: 12)
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        navController.changePage(0);
                      },
                      child: Container(
                        height: 50,width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: kWhiteColor)
                        ),
                        child: Column(
                          crossAxisAlignment: crossAxisAlignmentCenter,
                          mainAxisAlignment: mainAxisAlignmentCenter,
                          children: [
                            Icon(Icons.people,color: kWhiteColor,size: 14,),
                            textRoboto("USERS", kWhiteColor,fontSize: 12.0)
                          ],
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        navController.changePage(1);
                      },
                      child: Container(
                        height: 50,width: 50,
                        child: Column(
                          crossAxisAlignment: crossAxisAlignmentCenter,
                          mainAxisAlignment: mainAxisAlignmentCenter,
                          children: [
                            Icon(Icons.person,color: kWhiteColor,size:14),
                            textRoboto("PROFILE", kWhiteColor,fontSize: 12)
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
