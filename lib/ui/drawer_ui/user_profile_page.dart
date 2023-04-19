import 'package:ev_verde/bloc/userprofile_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:image_picker/image_picker.dart';

import '../../bloc/generate_otp_bloc.dart';
import '../../model/user/response_userprofile.dart';
import '../../repo/ev_verde_repo.dart';
import '../../widgets/loading_dialog.dart';
import 'dart:io';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<StatefulWidget> createState() => _UserProfilePage();
}

class _UserProfilePage extends State<UserProfilePage> {
  final double coverHeight = 280;
  final double profileHeight = 120;
  var imagePicker;
  var _image;

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffd9dadb),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'User Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: bodyWidget(),
    );
  }

  Widget buildTop(Data? data) {
    final top = coverHeight - profileHeight / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomLeft,
      children: [
        buildCoverImage(),
        //Positioned(top: top, child: buildProfileImage(data)),
        buildProfileImage(data),
        buildUserInfo(data),
      ],
    );
  }

  Widget buildCoverImage() => Container(
        color: Colors.white70,
        width: double.infinity,
        height: coverHeight,
        child: Image.asset(
          'assets/images/logo.png',
        ),
      );

  Widget buildProfileImage(Data? data) => Container(
        padding: const EdgeInsets.only(left: 10),
        child: Stack(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey.shade200,
              child: CircleAvatar(
                radius: 45,
                child: _image != null
                    ? ClipOval(
                        child: Image.file(
                          _image,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Image.asset('assets/images/user.png'),
              ),
            ),
            Positioned(
              bottom: 1,
              right: 1,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.white,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        50,
                      ),
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(2, 4),
                        color: Colors.black.withOpacity(
                          0.3,
                        ),
                        blurRadius: 3,
                      ),
                    ]),
                child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: InkWell(
                      onTap: () {
                        print('open bottom sheet dialog');
                        showPickerDialog();
                      },
                      child: Icon(Icons.add_a_photo, color: Colors.black),
                    )),
              ),
            ),
          ],
        ),
        /*child: ProfilePicture(
        name: '${data?.firstName} ${data?.lastName}',
        radius: profileHeight / 2,
        fontsize: 21,
        random: true,
      )*/
      );

  Widget buildUserInfo(Data? data) => Container(
        padding: const EdgeInsets.only(left: 140, bottom: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '${data?.firstName} ${data?.lastName}',
              style: const TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontFamily: 'Questrial',
                  fontWeight: FontWeight.w600),
            ),
            InkWell(
              onTap: () {},
              child: const Icon(
                // <-- Icon
                Icons.edit_outlined,
                size: 24.0,
              ),
            ),
          ],
        ),
      );

  Widget buildContent(Data? data) {
    final double bottom = profileHeight;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: bottom),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  // <-- Icon
                  Icons.email_outlined,
                  size: 24.0,
                ),
                // <-- Text
                const SizedBox(
                  width: 5,
                ),
                Text('${data?.email}'),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: bottom),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  // <-- Icon
                  Icons.phone_android_outlined,
                  size: 24.0,
                ),
                // <-- Text
                const SizedBox(
                  width: 5,
                ),
                Text('${data?.phone}'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBottom() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.only(top: profileHeight / 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                minimumSize: Size(40, 70),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "ChangePassword",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  Icon(
                    Icons.login_outlined,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                minimumSize: Size(40, 70),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Delete Account",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  Icon(
                    Icons.login_outlined,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget bodyWidget() {
    return BlocProvider(
      create: (context) => UserProfileBloc(EvVerdeRepo())..add(GetUserData()),
      child: BlocConsumer<UserProfileBloc, UserProfileState>(
        listener: (context, state) async {
          if (state is UserProfileLoaded) {
            LoadingDialog.hide(context);
          } else if (state is UserProfileError) {
            LoadingDialog.hide(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.error),
              ),
            );
          } else if (state is UserProfileLoading) {
            //add progress dialog
            LoadingDialog.show(context);
          }
        },
        builder: (context, state) {
          if (state is UserProfileLoaded) {
            if (kDebugMode) {
              print('data loaded ${state.responseUserProfile.data?.firstName}');
            }
            return ListView(
              padding: EdgeInsets.zero,
              children: [
                buildTop(state.responseUserProfile.data),
                buildContent(state.responseUserProfile.data),
                buildBottom(),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  //-------------------edit profile pic ----------------------------
  Future showPickerDialog() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Wrap(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        getImageFromPicker(context, ImageSourceType.camera);
                      },
                      child: const CircleAvatar(
                        radius: 40,
                        backgroundColor:Colors.cyan,
                        child: Icon(Icons.camera_alt_outlined,
                            size: 40, color: Colors.white),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        getImageFromPicker(context, ImageSourceType.gallery);
                      },
                      child: const CircleAvatar(
                        radius: 40,
                        backgroundColor:Colors.cyan,
                        child: Icon(Icons.image_outlined,
                            size: 40, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }

  getImageFromPicker(BuildContext context, var type) async {
    var source = type == ImageSourceType.camera
        ? ImageSource.camera
        : ImageSource.gallery;
    XFile image = await imagePicker.pickImage(
        source: source,
        imageQuality: 50,
        preferredCameraDevice: CameraDevice.front);
    if (kDebugMode) {
      print(image.path);
    }
    setState(() {
      _image = File(image.path);
    });
  }
}

enum ImageSourceType { gallery, camera }
