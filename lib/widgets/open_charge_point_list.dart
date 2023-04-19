import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class OpenChargePointList extends StatefulWidget{
  const OpenChargePointList({super.key});

  @override
  State<StatefulWidget> createState() => _OpenChargePointList();

}
class _OpenChargePointList extends State<OpenChargePointList>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return openMapsSheet(context);
  }

}
openMapsSheet(
    context) async {
  try {
    /*final title =
        '${responseChargeDetailPoint.data?.chargingZone?.location?.name}';
    final description =
        '${responseChargeDetailPoint.data?.chargingZone?.location?.city}';
    final coords = Coords(
        (responseChargeDetailPoint.data?.chargingZone?.location?.latitude)!,
        (responseChargeDetailPoint.data?.chargingZone?.location?.longitude)!);
    final availableMaps = await MapLauncher.installedMaps;*/

    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.60,
              decoration:  const BoxDecoration(
                color: Colors.white,
                borderRadius:  BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
              ),
              child: Wrap(
                children: <Widget>[
                  Text('data')
                ],
              ),
            ),
          ),
        );
      },
    );
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}