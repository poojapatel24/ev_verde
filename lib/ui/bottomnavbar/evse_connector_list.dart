import 'package:ev_verde/model/chargepoint/response_chargedetailpoint.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/my_round_container.dart';

class EvseConnectorList extends StatefulWidget {
  Data? data;

  EvseConnectorList({required this.data, super.key});

  @override
  State<StatefulWidget> createState() => _EvseConnectorList();
}

class _EvseConnectorList extends State<EvseConnectorList>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController =
        TabController(length: 2, vsync: this, initialIndex: 1);
    return Container(
      child: Column(
        children: [
          Container(
            child: TabBar(
              controller: _tabController,
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.black,
              tabs: const [
                Tab(
                  text: 'Overview',
                ),
                Tab(
                  text: 'Connectors',
                )
              ],
            ),
          ),
          Container(
            //color: Colors.blue,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            child: TabBarView(
              controller: _tabController,
              children: [
                //Overview TAB data
                const Center(
                  child: Text(
                    'Not a Available',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Questrial',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                //Connector TAB data
                connectorTabData(widget.data, context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget connectorTabData(Data? data, BuildContext context) {
    return ListView.builder(
       // physics: const NeverScrollableScrollPhysics(),
        itemCount: data?.chargePointEvse?.length,
        itemBuilder: (context, index) {
          /*return ListTile(
              title: Text('${data?.chargePointEvse![index]?.chargePointEvseConnector![0].typeDisplay}'),
              leading: Image.network('${data?.chargePointEvse![index]?.chargePointEvseConnector![0].typeResourceUrl}'),
            );*/
          return Card(
            elevation: 0,
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              //<-- SEE HERE
              side: BorderSide(
                color: Colors.grey.shade300,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.grey.shade300,
                          ),
                          child: Image.network(
                              '${data?.chargePointEvse![index].chargePointEvseConnector![0].typeResourceUrl}'),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          margin: const EdgeInsets.only(left: 5),
                          padding: const EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                '${data?.chargePointEvse![index].chargePointEvseConnector![0].typeDisplay}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    fontFamily: 'Questrial'),
                                maxLines: 1,
                              ),
                              Text.rich(
                                TextSpan(children: [
                                  const TextSpan(
                                      text: 'Power:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text:
                                          ' ${data?.chargePointEvse![index].maxPower} kW - '),
                                  TextSpan(
                                      text:
                                          '${data?.chargePointEvse![index].typeDisplay}'),
                                ]),
                                style: const TextStyle(fontSize: 13),
                              ),
                              Text.rich(
                                TextSpan(children: [
                                  const TextSpan(
                                    text: 'ID:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                      text:
                                          ' ${data?.chargePointEvse![index].qrCodeId}')
                                ]),
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child:((data?.chargePointEvse![index].statusDisplay) ==
                            'Active')
                            ? MyRoundContainer(
                          color: Colors.green.shade100,
                          mytext: 'Available',
                          textcolor: Colors.green,
                        )
                            : MyRoundContainer(
                          color: Colors.red.shade100,
                          mytext: 'Unavailable',
                          textcolor: Colors.red,
                        ),

                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        const Expanded(
                            flex: 2,
                            child: Center(
                                child: Text(
                              'Tariff',
                              style: TextStyle(
                                  fontFamily: 'Questrial', color: Colors.grey),
                            ))),
                        Expanded(
                            flex: 8,
                            child: Text(
                              ((data?.chargePointEvse![index].tariff?.connectionFee)! > 0)?'\u{20B9}${data?.chargePointEvse![index].tariff?.connectionFee} /kWh':'${data?.chargePointEvse![index].tariff?.tariffTypeDisplay}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
