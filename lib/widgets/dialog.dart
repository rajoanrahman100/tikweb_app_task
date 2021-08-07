
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tikwebapptask/components/color_config.dart';
import 'package:tikwebapptask/components/style_text.dart';

enum DialogAction { yes, abort }

class Dialogs {
  static Future<DialogAction> pickImageDialog(
      BuildContext context,
      Size size,
      var controller
      ) async => await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: size.height / 6,
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                size10,
                textRoboto("Upload Profile Picture", kBlackColor, fontSize: 20.0, fontWeight: FontWeight.w500),
                SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  onTap: () {
                    controller.getProfileImage(ImageSource.camera, context);
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: kGreyColor.withOpacity(0.2)),
                        child: Center(
                          child: Icon(
                            Icons.camera,
                            color: kBlackColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      textRoboto("From Camera", kBlackColor, fontSize: 18.0, fontWeight: FontWeight.w500),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: () {
                    controller.getProfileImage(ImageSource.gallery, context);
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: kGreyColor.withOpacity(0.2)),
                        child: Center(
                          child: Icon(
                            Icons.perm_media,
                            color: kBlackColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      textRoboto("From Gallery", kBlackColor, fontSize: 18.0, fontWeight: FontWeight.w500),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
}