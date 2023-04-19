import 'package:ev_verde/model/chargepoint/request_chargepointlist.dart';
import 'package:ev_verde/widgets/qr_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_share/flutter_share.dart';

import '../bloc/chargepointlist_bloc.dart';
import '../components/my_round_container.dart';
import '../repo/ev_verde_repo.dart';
import '../ui/bottomnavbar/charge_point_details_screen.dart';
import 'custom_list_shimmer_loading.dart';
import 'custom_loading_widget.dart';
import 'loading_dialog.dart';

class CustomFloatingButton extends StatefulWidget {
  RequestChargePointList requestChargePointList;

  CustomFloatingButton({required this.requestChargePointList, super.key});

  @override
  State<StatefulWidget> createState() => _CustomFloatingButton();
}

class _CustomFloatingButton extends State<CustomFloatingButton> {
  @override
  Widget build(BuildContext context) {
    return myCustomFloatingActionButton(context, widget.requestChargePointList);
  }

  Widget myCustomFloatingActionButton(
      context, RequestChargePointList requestChargePointList) {
    return IconButton(
      padding: const EdgeInsets.only(bottom: 30, top: 10),
      onPressed: () {
        if (kDebugMode) {
          print('object');
        }
        openMapsSheet(context, requestChargePointList);
      },
      icon: const Icon(
        Icons.minimize_outlined,
        color: Colors.black,
        size: 40,
      ),
    );
  }

  openMapsSheet(context, RequestChargePointList requestChargePointList) async {
    try {
      showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.60,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                ),
                child: getChargePointList(requestChargePointList),
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

  Widget getChargePointList(RequestChargePointList requestChargePointList) {
    return BlocProvider(
      create: (context) => ChargePointListBloc(EvVerdeRepo())
        ..add(GetPointList(requestChargePointList)),
      child: BlocConsumer<ChargePointListBloc, ChargePointListState>(
        listener: (context, state) async {
          /*
          if (state is ChargePointListLoaded) {
            LoadingDialog.hide(context);
          } else if (state is ChargePointListError) {
            LoadingDialog.hide(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.error),
              ),
            );
          } else if (state is ChargePointListLoading) {
            //---------add progress dialog
            LoadingDialog.show(context);
          }*/
        },
        builder: (context, state) {
          if (state is ChargePointListLoaded) {
            return Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  // ---------------display close---------------------
                  Container(
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.cancel,
                          size: 30,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ),
                  ),
                  //-------------display no of connectors-----------------
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Charging Stations',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Questrial',
                              fontSize: 15),
                        ),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                              text:
                                  '${state.responseChargePointList.noOfRecords}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                  fontSize: 18)),
                          const WidgetSpan(
                              child: Icon(
                            Icons.charging_station_outlined,
                            color: Colors.green,
                            size: 20,
                          )),
                        ])),
                      ],
                    ),
                  ),
                  //---------------display charging point list----------------
                  Flexible(
                    child: ListView.builder(
                        // physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.responseChargePointList.data?.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ChargePointDetailScreen(
                                            chargePointId: state
                                                .responseChargePointList
                                                .data?[index]
                                                .chargePointId)),
                              );
                            },
                            child: Card(
                              elevation: 3,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                //<-- SEE HERE
                                side: BorderSide(
                                  color: Colors.grey.shade300,
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //-------------display image,name and address------------
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                            padding: EdgeInsets.all(2),
                                            width: double.infinity,
                                            //height: 70,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              color: Colors.white,
                                              boxShadow: const [
                                                BoxShadow(
                                                    color: Color(0xffDDDDDD),
                                                    //New
                                                    blurRadius: 6.0,
                                                    spreadRadius: 2.0,
                                                    offset: Offset(0.0, 0.0))
                                              ],
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: SizedBox.fromSize(
                                                size: const Size.fromRadius(48),
                                                // Image radius
                                                child: Column(
                                                  children: [
                                                    Image.network(
                                                      '${state.responseChargePointList.data?[index].chargingZone?.location?.locationImage?[0].imagePath}',
                                                    ),
                                                    const Text.rich(
                                                      TextSpan(children: [
                                                        WidgetSpan(
                                                            child: Icon(
                                                          Icons
                                                              .accessibility_sharp,
                                                          color: Colors
                                                              .greenAccent,
                                                          size: 15,
                                                        )),
                                                        TextSpan(
                                                            text: ' Public - '),
                                                        TextSpan(text: '2 km'),
                                                      ]),
                                                      style: TextStyle(
                                                          fontSize: 10),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 7,
                                          child: Container(
                                            margin:
                                                const EdgeInsets.only(left: 5),
                                            padding: const EdgeInsets.all(5),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  '${state.responseChargePointList.data?[index].name}',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16,
                                                      fontFamily: 'Questrial'),
                                                  maxLines: 1,
                                                ),
                                                Text(
                                                  '${state.responseChargePointList.data?[index].chargingZone?.location?.address}',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 14,
                                                      fontFamily: 'Questrial'),
                                                  maxLines: 2,
                                                ),
                                                SizedBox(
                                                  height: 50,
                                                  child: ListView.builder(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount: state
                                                          .responseChargePointList
                                                          .data?[index]
                                                          .chargePointEvse
                                                          ?.length,
                                                      itemBuilder:
                                                          (context, count) {
                                                        return Image.network(
                                                          '${state.responseChargePointList.data?[index].chargePointEvse![count].chargePointEvseConnector![0].typeResourceUrl}',
                                                          height: 30,
                                                          width: 30,
                                                        );
                                                      }),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    //----------display status and share option
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: ((state
                                                        .responseChargePointList
                                                        .data?[index]
                                                        .connectionStatusDisplay) ==
                                                    'Unavailable')
                                                ? MyRoundContainer(
                                                    color:
                                                        Colors.green.shade100,
                                                    mytext: 'Online',
                                                    textcolor: Colors.green,
                                                    width: 100,
                                                  )
                                                : MyRoundContainer(
                                                    color: Colors.red.shade100,
                                                    mytext: 'Offline',
                                                    textcolor: Colors.red,
                                                    width: 100,
                                                  ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: IntrinsicHeight(
                                              child: Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      var url =
                                                          'https://charger.verdemobility.com/';
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
                                                    onTap: () {},
                                                    child: const Icon(
                                                      Icons.favorite_border,
                                                      color: Colors.redAccent,
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
                                                      Navigator.of(context)
                                                          .push(
                                                              MaterialPageRoute(
                                                        builder: (context) =>
                                                            const QrView(),
                                                      ));
                                                    },
                                                    child: const Icon(
                                                      Icons
                                                          .qr_code_scanner_sharp,
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
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            );
          } else if (state is ChargePointListLoading) {
            return ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return buildListShimmer(context);
                });
          }
          return Container();
        },
      ),
    );
  }



  Future<void> share(String url) async {
    await FlutterShare.share(
        title: 'Verde Mobility',
        //text: 'Example share text',
        linkUrl: url,
        chooserTitle: 'Chooser Title');
  }
}
