import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/my_button.dart';
import '../widgets/company_name_list_widget.dart';
final key = GlobalKey<CompanyNameListStateWidget>();
class AddNewVehiclePage extends StatefulWidget {
  const AddNewVehiclePage({super.key});

  @override
  State<StatefulWidget> createState() => _AddNewVehiclePage();
}

class _AddNewVehiclePage extends State<AddNewVehiclePage> {
  CompanyNameListStateWidget companyNameListWidget=CompanyNameListStateWidget();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          'ADD NEW VEHICLE',
          style: TextStyle(color: Colors.black, fontFamily: 'Questrial'),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            //------company name list-------------
            CompanyNameListWidget(),
            const SizedBox(
              height: 20,
            ),
            MyButton(
              myColor: Colors.deepOrange,
              buttonName: 'Add New Vehicle',
              onPressedFunction: () async{
                final prefs = await SharedPreferences.getInstance();
                final String? name = prefs.getString('companyname');
                if (kDebugMode) {
                  //print(key.currentState?.selectedValue);
                  print(name);
                }
              },
            ),
            //CompanyModelListWidget(),
          ],
        ),
      ),
    );
  }
}
