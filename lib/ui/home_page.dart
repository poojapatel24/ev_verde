import 'dart:io';

import 'package:ev_verde/model/chargepoint/request_chargepointlist.dart';
import 'package:ev_verde/ui/bottomnavbar/Scanner_page.dart';
import 'package:ev_verde/ui/bottomnavbar/activesessions_page.dart';
import 'package:ev_verde/ui/bottomnavbar/map_page.dart';

import 'package:ev_verde/utils/constants.dart';
import 'package:ev_verde/widgets/qr_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/my_drawer.dart';
import '../widgets/mycustom_floating_action_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  late RequestChargePointList requestChargePointList;

  @override
  void initState() {
    List<int> id = [1, 1318, 5245, 5263];
    requestChargePointList = RequestChargePointList(chargePointIdList: id);
    super.initState();
    getLoginValue();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: const Text(
            'VerdeMobility',
            style: TextStyle(color: Colors.black, fontFamily: 'Questrial'),
          ),
        ),
        body: bodyWidget(),
        floatingActionButton: Visibility(
          visible: (_selectedIndex == 0) ? true : false,
          child:CustomFloatingButton(requestChargePointList: requestChargePointList),
        ),
       /* floatingActionButton:
            CustomFloatingButton(requestChargePointList: requestChargePointList),*/
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar:
            SizedBox(height: 80, child: myCustomBottomAppBar(context)),
        drawer: const MyDrawer(),
        extendBody:
            true, // very important property to transparent background in bottom navigation bar
      ),
    );
  }

  getLoginValue() async {
    final prefs = await SharedPreferences.getInstance();
    final String? appId = prefs.getString(Constants().firstname);
    if (kDebugMode) {
      print('get firstname  $appId');
    }
  }

  Widget bodyWidget() {
    return Container(
      child: widgetOptions.elementAt(_selectedIndex),
    );
  }

  Future<bool> _onBackPressed() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to exit an App'),
            actions: <Widget>[
              GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: const Text("NO"),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                //onTap: () => Navigator.of(context).pop(true),
                //---------exit() use for the close the application---------
                onTap: () => exit(0),
                child: const Text("YES"),
              ),
            ],
          ),
        )) ??
        false;
  }

  List<IconData> iconListBottomAppBar = [
    Icons.map_outlined,
    Icons.qr_code_scanner_outlined,
    Icons.charging_station_outlined,
  ];
  int _selectedIndex = 0;
  final widgetOptions = [
    const MapPage(),
    const ScannerPage(),
    const ActiveSessionsPage(),
    // const FeederPanelPage(),
  ];

  Widget myCustomBottomAppBar(BuildContext context) => BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0.7),
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: <BottomNavigationBarItem>[
          for (int i = 0; i < iconListBottomAppBar.length; i++)
            BottomNavigationBarItem(
              icon: Icon(
                iconListBottomAppBar[i],
                size: 25,
              ),
              label: 'Calls',
            ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      );

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const QrView()));
      }
    });
  }
}
