import 'package:ev_verde/bloc/chargedetailpoint_bloc.dart';
import 'package:ev_verde/components/my_round_container.dart';
import 'package:ev_verde/model/chargepoint/response_chargedetailpoint.dart';
import 'package:ev_verde/ui/add_new_vehicle_page.dart';
import 'package:ev_verde/ui/bottomnavbar/evse_connector_list.dart';
import 'package:ev_verde/widgets/qr_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_svg/svg.dart';
import 'package:map_launcher/map_launcher.dart';

import '../../repo/ev_verde_repo.dart';
import '../../widgets/loading_dialog.dart';

class ChargePointDetailScreen extends StatefulWidget {
  int? chargePointId;

  ChargePointDetailScreen({super.key, required this.chargePointId});

  @override
  State<StatefulWidget> createState() => _ChargePointDetailScreen();
}

class _ChargePointDetailScreen extends State<ChargePointDetailScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      //1
      body: bodyWidget(),
    );
  }

  Widget bodyWidget() {
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => ChargeDetailPointBloc(EvVerdeRepo())
        ..add(GetChargeDetailPoint(widget.chargePointId!)),
      child: BlocConsumer<ChargeDetailPointBloc, ChargeDetailPointState>(
        listener: (context, state) async {
          if (state is ChargeDetailPointLoaded) {
            LoadingDialog.hide(context);
          } else if (state is ChargeDetailPointError) {
            LoadingDialog.hide(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.error),
              ),
            );
          } else if (state is ChargeDetailPointLoading) {
            //add progress dialog
            LoadingDialog.show(context);
          }
        },
        builder: (context, state) {
          if (state is ChargeDetailPointLoaded) {
            return CustomScrollView(
              slivers: <Widget>[
                //2
                SliverAppBar(
                  iconTheme: IconThemeData(color: Colors.black),
                  backgroundColor: Colors.white,
                  centerTitle: true,
                  pinned: true,
                  floating: false,
                  expandedHeight: 250.0,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        'STATION DETAILS',
                        style: TextStyle(color: Colors.black),
                      ),
                      Icon(Icons.favorite_border_rounded),
                    ],
                  ),
                  flexibleSpace: FlexibleSpaceBar(

                    centerTitle: true,
                    /*background: Image.asset(
                      'assets/images/sls.png',
                      fit: BoxFit.cover,
                    ),*/
                    background: Container(
                     // width: 116.0,
                     // height: 174.0,
                      foregroundDecoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.grey,
                            Colors.transparent,
                            //Colors.transparent,
                           // Colors.grey
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0, 0.3]//, 0.8],
                        ),
                      ),
                      child: ((state
                                  .responseChargeDetailPoint
                                  .data
                                  ?.chargingZone
                                  ?.location
                                  ?.locationImage
                                  ?.length!
                                  .toInt())! >
                              0)
                          ? FadeInImage.assetNetwork(
                              placeholder: 'assets/images/logo.png',
                              image:
                                  '${state.responseChargeDetailPoint.data?.chargingZone?.location?.locationImage?[0].imagePath}')
                          : Image.asset(
                              'assets/images/sls.png',
                              fit: BoxFit.cover,
                            ),
                    ),
                    /*background: ((state.responseChargeDetailPoint.data
                                ?.chargingZone?.location?.locationImage?.length!
                                .toInt())! >
                            0)
                        ? FadeInImage.assetNetwork(
                            placeholder: 'assets/images/logo.png',
                            image:
                                '${state.responseChargeDetailPoint.data?.chargingZone?.location?.locationImage?[0].imagePath}')
                        : Image.asset(
                            'assets/images/sls.png',
                            fit: BoxFit.cover,
                          ),*/
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: height * .88,
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        topWidget(state.responseChargeDetailPoint),
                        const Divider(
                          color: Colors.grey,
                        ),
                        middleWidget(),
                        const Divider(
                          color: Colors.grey,
                        ),
                        //myTabBarWidget(state.responseChargeDetailPoint.data),
                        EvseConnectorList(
                            data: state.responseChargeDetailPoint.data)
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget topWidget(ResponseChargeDetailPoint responseChargeDetailPoint) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //------------------Display station name
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 8,
                child: Text(
                  '${responseChargeDetailPoint.data?.chargingZone?.name}',
                  maxLines: 2,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: 'Questrial'),
                ),
              ),
              Expanded(
                flex: 2,
                child: MyRoundContainer(
                  color: Colors.deepOrangeAccent,
                  mytext: 'NA',
                  textcolor: Colors.white,
                  onPressedFunction: () async {
                    openMapsSheet(context, responseChargeDetailPoint);
                  },
                ),
              ),
            ],
          ),
          //------------------Display station address
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 8,
                child: Text(
                  '${responseChargeDetailPoint.data?.chargingZone?.location?.address}',
                  maxLines: 2,
                  style: const TextStyle(
                      color: Colors.grey, fontFamily: 'Questrial'),
                ),
              ),
              Expanded(
                flex: 2,
                child: ((responseChargeDetailPoint
                            .data?.chargingZone?.statusDisplay) ==
                        'Active')
                    ? MyRoundContainer(
                        color: Colors.green.shade100,
                        mytext: 'Online',
                        textcolor: Colors.green,
                      )
                    : MyRoundContainer(
                        color: Colors.red.shade100,
                        mytext: 'Offline',
                        textcolor: Colors.red,
                      ),
                /*child: MyRoundContainer(
                  color: Colors.green.shade100,
                  mytext: 'Online',
                  textcolor: Colors.green,
                ),*/
              ),
            ],
          ),
          //------------------Display no of connectors
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 8,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.charging_station_outlined,
                        color: Colors.green,
                      ),
                      Text(
                        '${responseChargeDetailPoint.data?.chargePointEvse?.length}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            fontSize: 16),
                      ),
                      const Text(
                        ' Connectors',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Questrial'),
                      ),
                      const Icon(
                        Icons.accessibility_sharp,
                        color: Colors.greenAccent,
                      ),
                      const Text(
                        'Public',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Questrial'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            var url = 'https://charger.verdemobility.com/';
                            if (kDebugMode) {
                              print('share');
                            }
                            share(url);
                          },
                          child: const Icon(
                            Icons.share_outlined,
                            color: Colors.blue,
                            size: 20,
                          ),
                        ),
                        const VerticalDivider(
                          color: Colors.grey,
                          thickness: 1,
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const QrView(),
                            ));
                          },
                          child: const Icon(
                            Icons.qr_code_scanner_sharp,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget middleWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 3),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Expanded(
          flex: 8,
          child: Row(
            children: const [
              Icon(
                Icons.directions_car,
                color: Colors.green,
              ),
              Text(
                '00',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: 16),
              ),
              Text(
                ' - Supported...',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Questrial'),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    //Add New Vehicle
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddNewVehiclePage()));
                  },
                  child: const Icon(
                    Icons.add_circle,
                    color: Colors.green,
                    size: 20,
                  ),
                ),
                const Icon(
                  Icons.navigate_next_rounded,
                  color: Colors.black,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  openMapsSheet(
      context, ResponseChargeDetailPoint responseChargeDetailPoint) async {
    try {
      final title =
          '${responseChargeDetailPoint.data?.chargingZone?.location?.name}';
      final description =
          '${responseChargeDetailPoint.data?.chargingZone?.location?.city}';
      final coords = Coords(
          (responseChargeDetailPoint.data?.chargingZone?.location?.latitude)!,
          (responseChargeDetailPoint.data?.chargingZone?.location?.longitude)!);
      final availableMaps = await MapLauncher.installedMaps;

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      ListTile(
                        onTap: () => map.showMarker(
                          coords: coords,
                          title: title,
                          description: description,
                        ),
                        title: Text(map.mapName),
                        leading: SvgPicture.asset(
                          map.icon,
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
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

  Future<void> share(String url) async {
    await FlutterShare.share(
        title: 'Verde Mobility',
        //text: 'Example share text',
        linkUrl: url,
        chooserTitle: 'Chooser Title');
  }
}
