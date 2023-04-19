
import 'package:flutter/material.dart';

import '../ui/drawer_ui/reservation_page.dart';
import '../ui/drawer_ui/user_profile_page.dart';

List<IconData> iconListBottomAppBar = [
  Icons.map_outlined,
  Icons.qr_code_scanner_outlined,
  Icons.charging_station_outlined,
];

final widgetOptions = [
  const UserProfilePage(),
  const ReservationPage(),
  // const FeederPanelPage(),
];
Widget myCustomBottomAppBar(BuildContext context) => BottomAppBar(
  color: Colors.white,
  shape: const CircularNotchedRectangle(),
  notchMargin: 5,
  child: Padding(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        for (int i = 0; i < iconListBottomAppBar.length; i++)
          IconButton(
              icon: Icon(
                iconListBottomAppBar[i],
                color: Colors.black54,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => widgetOptions[i]));
              }),

      ],
    ),
  ),
);
