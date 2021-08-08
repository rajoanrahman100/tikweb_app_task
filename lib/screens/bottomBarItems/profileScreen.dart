import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tikwebapptask/components/color_config.dart';
import 'package:tikwebapptask/components/responsive.dart';
import 'package:tikwebapptask/components/style_text.dart';
import 'package:tikwebapptask/controller/logInController.dart';
import 'package:intl/intl.dart';
import 'package:tikwebapptask/screens/bottomBarItems/userMap.dart';

class ProfileScreen extends StatelessWidget {

  var loginController=Get.put(LogInController());

  var dateTimeFormat=DateFormat.yMd().add_jm();


  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: kWhiteColor,
        centerTitle: true,
        title: textRoboto("Profile", kBlackColor, fontWeight: weight500),
      ),
      body: Responsive(
        mobile: Obx(()=>Container(
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: crossAxisAlignmentCenter,

              children: [

                size20,

                ClipRRect(
                  borderRadius: BorderRadius.circular(70.0),
                  child: CachedNetworkImage(
                    imageUrl: loginController.profileImage.value,
                    height: 140,
                    width: 140,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => CircularProgressIndicator(
                      strokeWidth: 1,
                      color: kBlackColor,
                      value: 20,
                    ),
                    errorWidget: (context, url, error) => Icon(
                      Icons.error,
                      color: kBlackColor,
                      size: 25,
                    ),
                  ),
                ),
                size20,
                textRoboto("${loginController.userName.value}", kBlackColor,fontSize: 30.0,fontWeight: weight500),
                size20,
                textRoboto("${loginController.userEmail.value}", kBlackColor,fontSize: 18.0,fontWeight: weight500),
                size10,
                textRoboto("password", kBlackColor,fontSize: 18.0,fontWeight: weight500),
                size10,
                textRoboto("Phone: ${loginController.userPhone.value}", kBlackColor,fontSize: 20.0,fontWeight: weight500),
                size20,
                Container(
                  width: size.width,height: 30.0,
                  margin: EdgeInsets.symmetric(horizontal: 25.0),
                  decoration: containerBoxDecoration(
                      borderRadius: 5.0,
                      color: kWhiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: kOrdinaryColor.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ]
                  ),
                  child: Center(
                    child:textRoboto("Created Date & Time: "
                        "${DateFormat.yMd().add_jm().format(DateTime.parse(loginController.createdDate.value))}",
                        kBlackColor.withOpacity(0.5)),
                  ),
                ),
                size20,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child:Row(
                      children: [
                        Icon(Icons.location_on,color: kOrdinaryColor,size: 16.0,),
                        textRoboto("Location",
                            kBlackColor.withOpacity(0.4),fontSize: 16.0,fontWeight: weight500),
                      ],
                    ),
                  ),
                ),
                UserLocationMap(size: size, loginController: loginController)
              ],
            ),
          ),
        )),
      ),
    );
  }
}

