import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:ev_verde/bloc/device_bloc.dart';
import 'package:ev_verde/model/deviceactivity/request_device.dart';
import 'package:ev_verde/repo/ev_verde_repo.dart';
import 'package:ev_verde/ui/home_page.dart';
import 'package:ev_verde/ui/login_page.dart';
import 'package:ev_verde/utils/constants.dart';
import 'package:ev_verde/widgets/splash_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../utils/color_file.dart';
import '../utils/preference_utils.dart';
import '../widgets/loading_dialog.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() => _SplashPage();
}

class _SplashPage extends State<SplashPage> {
  PackageInfo? packageInfo;
  String uuid = Uuid().v4(); // Generate a random UUID
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  late String manufacturer, model, platform;
  late RequestDevice requestDevice;

  @override
  void initState() {
    // TODO: implement initState

    getPackage();
    if (kDebugMode) {
      print(uuid);
    }
    getDeviceInfo();
    getRequestDevice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorFile().greyColor,
      body: bodyWidget(),
    );
  }

  void getPackage() async {
    packageInfo = await PackageInfo.fromPlatform();
    String appName = packageInfo!.appName;
    String packageName = packageInfo!.packageName;
    String version = packageInfo!.version;
    String buildNumber = packageInfo!.buildNumber;
    if (kDebugMode) {
      print(
          "App Name : ${appName}, App Package Name: ${packageName},App Version: ${version}, App build Number: ${buildNumber}");
    }
  }

  void getDeviceInfo() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      manufacturer = androidInfo.manufacturer;
      model = androidInfo.model;
      platform = "Android";
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      manufacturer = iosInfo.utsname.machine!;
      model = iosInfo.model!;
      platform = "IOS";
    }
    //getRequestDevice();
  }

  void getRequestDevice() {
    requestDevice = RequestDevice(
        appId: uuid,
        clientKey: Constants().clientKey,
        platform: 'android',
        manufacturer: 'manufacturer',
        model: 'model',
        appVersion: '1.0.0',
        appBuild: '1',
        timeZoneOffset: '05:30:00');
  }

  Widget bodyWidget() {
    return BlocProvider(
      create: (context) =>
          DeviceBloc(EvVerdeRepo())..add(GetDeviceActivity(requestDevice)),
      child: BlocConsumer<DeviceBloc, DeviceState>(
        listener: (context, state) async {
          if (state is DeviceError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Text(state.error),
              ),
            );
          } else if (state is DeviceLoaded) {
            final prefs = await SharedPreferences.getInstance();
            await PreferenceUtils.setString('appId', uuid);
            final String? firstName = prefs.getString(Constants().firstname);
            if (kDebugMode) {
              print('firstName $firstName');
            }
            if(mounted) {
              if(firstName != null){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              }else{
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              }

            }
          }
        },
        builder: (context, state) {
          //else{
          return const SplashView();
          //}
          //return Container();
        },
      ),
    );
  }
}
