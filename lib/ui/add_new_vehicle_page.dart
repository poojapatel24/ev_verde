import 'package:flutter/material.dart';
import '../widgets/company_name_list_widget.dart';

class AddNewVehiclePage extends StatefulWidget {
  const AddNewVehiclePage({super.key});

  @override
  State<StatefulWidget> createState() => _AddNewVehiclePage();
}

class _AddNewVehiclePage extends State<AddNewVehiclePage> {
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
            //CompanyModelListWidget(),
          ],
        ),
      ),
    );
  }
}
