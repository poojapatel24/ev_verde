import 'dart:async';
import 'dart:ui';

import 'package:ev_verde/bloc/chargepoint_bloc.dart';
import 'package:ev_verde/model/chargepoint/response_chargepoint.dart';
import 'package:ev_verde/ui/bottomnavbar/charge_point_details_screen.dart';
import 'package:ev_verde/ui/bottomnavbar/map_cluster_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:label_marker/label_marker.dart';

import '../../repo/ev_verde_repo.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<StatefulWidget> createState() => _MapPage();
}

class _MapPage extends State<MapPage> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(20.5937, 78.9629);
  late BitmapDescriptor _markerIcon;
  late BitmapDescriptor busBitmap;
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  //-----new added------------------
  Completer<GoogleMapController> _controller = Completer();
  late ClusterManager _manager;
  Set<Marker> markers = Set();
  List<Place> items =[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: bodyWidget());
  }

  Widget bodyWidget() {
    return BlocProvider(
      create: (context) =>
          ChargePointBloc(EvVerdeRepo())..add(GetChargePointList()),
      child: BlocConsumer<ChargePointBloc, ChargePointState>(
        listener: (context, state) async {

          if (state is ChargePointLoaded) {
           // _markerIcon = await _getMarkerBitmap(70, '2');
            /*ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Text('${state.responseChargePoint.noOfRecords}'),
              ),
            );*/

          } else if (state is ChargePointError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.error),
              ),
            );
          } else if (state is ChargePointLoading) {
            //add progress dialog
          }
        },
        builder: (context, state) {
          if(state is ChargePointLoaded){
            for (int i = 0; i < state.responseChargePoint.data.length; i++){
              Place place=Place(name: state.responseChargePoint.data[i].noOfConnectors.toString(), latLng: LatLng(state.responseChargePoint.data[i].latitude,
                  state.responseChargePoint.data[i].longitude),id: state.responseChargePoint.data[i].chargePointId);
              items.add(place);
            }
            return MapClusterPage(items: items);


            /*return GoogleMap(
              mapType: MapType.normal,
              compassEnabled: false,
              zoomControlsEnabled: false,
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 5.0,
              ),
              markers:<Marker>{
                for (int i = 0; i < state.responseChargePoint.data.length; i++)
                //if (state.responseChargePoint.data[i].available)
                  Marker(
                    markerId: MarkerId(state.responseChargePoint.data[i].chargePointId
                        .toString()),
                    position: LatLng(state.responseChargePoint.data[i].latitude,
                        state.responseChargePoint.data[i].longitude),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueAzure),
                    //icon: await _getMarkerBitmap(70, state.responseChargePoint.data[i].noOfConnectors.toString()),
                      onTap: (){
                        //------- on tap map marker it will open charge point details screen
                        if (kDebugMode) {
                          print('charge id ${state.responseChargePoint.data[i].chargePointId}');
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ChargePointDetailScreen(chargePointId: state.responseChargePoint.data[i].chargePointId)),
                        );
                      },
                  ),
              },
            );*/
          }
          return Container();
        },
      ),
    );
  }

  ClusterManager<Place> _initClusterManager() {
    return ClusterManager<Place>(items, _updateMarkers,
        markerBuilder: _markerBuilder);
  }

  void _updateMarkers(Set<Marker> markers) {
    print('Updated ${markers.length} markers');
    setState(() {
      this.markers = markers;
    });
  }
  Future<Marker> Function(Cluster) get _markerBuilder =>
          (cluster) async {
        return Marker(
          markerId: MarkerId(cluster.getId()),
          position: cluster.location,
          onTap: () {
            print('---- $cluster');
            cluster.items.forEach((p) => print(p));
          },
          icon: await _getMarkerBitmap(cluster.isMultiple ? 125 : 75,
              text: cluster.isMultiple ? cluster.count.toString() : null),
        );
      };

  Future<BitmapDescriptor> _getMarkerBitmap(int size, {String? text}) async {
    if (kIsWeb) size = (size / 2).floor();

    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint1 = Paint()..color = Colors.orange;
    final Paint paint2 = Paint()..color = Colors.white;

    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint1);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.2, paint2);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.8, paint1);

    if (text != null) {
      TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
      painter.text = TextSpan(
        text: text,
        style: TextStyle(
            fontSize: size / 3,
            color: Colors.white,
            fontWeight: FontWeight.normal),
      );
      painter.layout();
      painter.paint(
        canvas,
        Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
      );
    }

    final img = await pictureRecorder.endRecording().toImage(size, size);
    final data = await img.toByteData(format: ImageByteFormat.png) as ByteData;

    return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
  }

 }
class Place extends ClusterItem {
  Place({
    required this.name,
    required this.latLng,
    required this.id,
    this.isClosed,
  });
  String name;
  LatLng latLng;
  bool? isClosed;
  int id;

  @override
  // TODO: implement location
  LatLng get location => latLng;

  String get placeName {
    return name;
  }
  int get getId {
    return id;
  }
}


