import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:tikwebapptask/components/color_config.dart';
import 'package:tikwebapptask/components/style_text.dart';
import 'package:tikwebapptask/controller/logInController.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';

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
      body: Obx(()=>Container(
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
                      "${dateTimeFormat.format(DateTime.parse(loginController.createdDate.value))}",
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
              Container(
                width: size.width,
                height: size.height/3,
                margin: EdgeInsets.symmetric(horizontal: 25.0,vertical: 15.0),
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(color: kOrdinaryColor),
                  borderRadius: BorderRadius.circular(7.0),
                  boxShadow: [

                      BoxShadow(
                        color: kOrdinaryColor.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),

                  ]
                ),
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(23.7136,90.4278),
                    zoom: 13.0,
                  ),
                  layers: [
                    TileLayerOptions(
                        urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a', 'b', 'c']
                    ),
                    MarkerLayerOptions(
                      markers: [
                        Marker(
                          width: 80.0,
                          height: 80.0,
                          point: LatLng(23.7136, 90.4278),
                          builder: (ctx) =>
                              Icon(Icons.location_on,color: kBlackColor,size: 30,)
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
