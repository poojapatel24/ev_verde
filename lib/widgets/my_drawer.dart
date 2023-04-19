import 'package:ev_verde/components/my_listitem.dart';
import 'package:ev_verde/ui/drawer_ui/user_profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ui/login_page.dart';
import '../ui/drawer_ui/reservation_page.dart';
import '../utils/constants.dart';
import 'drawer_item.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<StatefulWidget> createState() => _MyDrawer();
}

class _MyDrawer extends State<MyDrawer> {
  String? firstName, lastName;
  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    getLoginValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                '$firstName $lastName',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
              accountEmail: const Text(
                'poojapatel@gmail.com',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w200),
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              currentAccountPicture: Container(
                  /*decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepOrange[900],
                ),*/
                  padding: const EdgeInsets.all(3),
                  child: ProfilePicture(
                    name: '$firstName $lastName',
                    radius: 31,
                    fontsize: 21,
                    random: true,
                  )),
            ),
            //for (int i = 0; i < drawerItems.length; i++)
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: drawerItems.length,
              itemBuilder: (context, index) {
                //return drawerItems[index];
                return InkWell(
                  child: Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: drawerItems[index],
                  ),
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => widgetOptions[index]));
                  },
                );

              },
            ),
            /* ListTile(
                leading: Icon(
                  drawerItems[i].icon,
                  color: Colors.black,
                  size: 25,
                ),
                title: Text(
                  drawerItems[i].title,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => widgetOptions[i]));
                },
              ),*/

            const SizedBox(
              height: 130,
            ),
            //logout button
            SizedBox(
              width: 30,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  minimumSize: Size(40, 70),
                ),
                onPressed: () {
                  // AuthService().signOutWithGoogle();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "LogOut",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.login_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getLoginValue() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      firstName = prefs.getString(Constants().firstname);
      lastName = prefs.getString(Constants().lastName);
      if (kDebugMode) {
        print('get firstname  $firstName');
      }
    });
  }

  final drawerItems = [
    //DrawerItem("User Profile", Icons.account_circle),
    MyListItem(
      listText: 'User Profile',
      prefixIcon: Icons.account_circle,
      suffixIcon: Icons.navigate_next,
      color: Colors.greenAccent,
    ),
    MyListItem(
      listText: 'Reservation',
      prefixIcon: Icons.calendar_month,
      suffixIcon: Icons.navigate_next,
      color: Colors.green,
    ),
    MyListItem(
      listText: 'History',
      prefixIcon: Icons.history,
      suffixIcon: Icons.navigate_next,
      color: Colors.deepPurpleAccent,
    )
    //DrawerItem("Reservation", Icons.calendar_month),
    //DrawerItem("History", Icons.history)
  ];

  final widgetOptions = [
    const UserProfilePage(),
    const ReservationPage(),
    // const FeederPanelPage(),
  ];
}
