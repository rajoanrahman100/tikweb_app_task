import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tikwebapptask/components/color_config.dart';
import 'package:tikwebapptask/components/style_text.dart';
import 'package:tikwebapptask/controller/userDataController.dart';
import 'package:tikwebapptask/widgets/customLoader.dart';
import 'package:tikwebapptask/widgets/textFieldWidget.dart';

class UserScreen extends StatelessWidget {
  var userController = Get.put(UserDatController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: kWhiteColor,
        centerTitle: true,
        title: textRoboto("User List", kBlackColor, fontWeight: weight500),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: mainAxisAlignmentBetween,
              children: [
                Obx(
                  () => Column(
                    crossAxisAlignment: crossAxisAlignmentCenter,
                    children: [
                      Icon(
                        Icons.person_outline,
                        color: kBlackColor,
                      ),
                      textRoboto("Total User", kBlackColor, fontSize: 18.0),
                      textRoboto("${userController.totalUser.value}", kBlackColor, fontSize: 18.0),
                    ],
                  ),
                ),
                Container(
                  height: 25.0,
                  padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 5.0),
                  decoration: containerBoxDecoration(color: kBlackColor, borderRadius: 5.0),
                  child: Center(
                    child: Row(
                      children: [
                        Icon(
                          Icons.person_outline,
                          color: kWhiteColor,
                          size: 18.0,
                        ),
                        width5,
                        textRoboto("Add New User", kWhiteColor),
                      ],
                    ),
                  ),
                )
              ],
            ),
            size20,
            TextFieldWidget(
              hintText: "Search",
              inputType: TextInputType.text,
              isSuffix: false,
              isPrefix: true,
              prefixWidget: Icon(
                Icons.search,
                color: kBlackColor.withOpacity(0.4),
              ),
            ),
            size20,
            Obx(() =>userController.usersData.value.response!.userList!.isEmpty
                ?Text("NO user Found"):userController.totalUser.value == 0
                ? Center(
                    child: CircularProgressIndicator(
                      color: kBlackColor,
                      strokeWidth: 2,
                    ),
                  ) : Expanded(
                        child: ListView.builder(
                          itemCount: userController.totalUser.value,
                          itemBuilder: (_, index) {
                            var userValue = userController.usersData.value.response!.userList![index];

                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(30.0),
                                          child: CachedNetworkImage(
                                            imageUrl: userValue.profileImage!,
                                            height: 40,
                                            width: 40,
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
                                        width10,
                                        Column(
                                          crossAxisAlignment: crossAxisAlignmentStart,
                                          children: [
                                            textRoboto("${userValue.name}", kBlackColor, fontSize: 18.0),
                                            textRoboto("${userValue.email}", kBlackColor.withOpacity(0.5),
                                                fontSize: 16.0),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,

                                          //barrierDismissible: false,
                                          builder: (context) {
                                            return Dialog(
                                              child: Container(
                                                height: size.height / 5,
                                                color: kWhiteColor,
                                                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                                                child: Column(
                                                  crossAxisAlignment: crossAxisAlignmentStart,
                                                  children: [
                                                    textRoboto("Are you sure?", kBlackColor, fontSize: 18.0),
                                                    Spacer(),
                                                    Row(
                                                      mainAxisAlignment: mainAxisAlignmentBetween,
                                                      children: [
                                                        MaterialButton(
                                                          onPressed: () => Navigator.of(context).pop(),
                                                          color: Colors.grey[200],
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(5.0)),
                                                          child: textRoboto("Cancel", kBlackColor),
                                                        ),
                                                        MaterialButton(
                                                          onPressed: () async {

                                                            await userController.deleteUser(userValue.id.toString(),
                                                                context).whenComplete((){
                                                              Navigator.of(context).pop();
                                                            });
                                                            await userController.fetchUser();
                                                          },
                                                          color: Colors.red.withOpacity(0.4),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(5.0)),
                                                          child: textRoboto("Confirm", kBlackColor),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    },
                                    child: Container(
                                      height: 22,
                                      padding: EdgeInsets.symmetric(horizontal: 7),
                                      decoration:
                                          containerBoxDecoration(borderRadius: 5.0, color: kGreyColor.withOpacity(0.4)),
                                      child: Center(
                                        child: textRoboto("Remove", kBlackColor, fontWeight: weight400),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ))
          ],
        ),
      ),
    );
  }
}
