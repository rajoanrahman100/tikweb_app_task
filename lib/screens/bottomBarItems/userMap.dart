import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:tikwebapptask/components/color_config.dart';
import 'package:tikwebapptask/controller/logInController.dart';
import 'package:latlong2/latlong.dart';

class UserLocationMap extends StatelessWidget {
  const UserLocationMap({
    Key? key,
    required this.size,
    required this.loginController,
  }) : super(key: key);

  final Size size;
  final LogInController loginController;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          center: LatLng(double.parse(loginController.userLat.value),
              double.parse(loginController.userLong.value)),
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
                  point: LatLng(double.parse(loginController.userLat.value),
                      double.parse(loginController.userLong.value)),
                  builder: (ctx) =>
                      Icon(Icons.location_on,color: kBlackColor,size: 30,)
              ),
            ],
          ),
        ],
      ),
    );
  }
}
