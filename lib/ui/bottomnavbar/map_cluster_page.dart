import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:label_marker/label_marker.dart';

import 'charge_point_details_screen.dart';
import 'map_page.dart';

class MapClusterPage extends StatefulWidget {
  List<Place> items;

  MapClusterPage({required this.items, super.key});

  @override
  State<StatefulWidget> createState() => _MapClusterPage();
}

class _MapClusterPage extends State<MapClusterPage> {
  Completer<GoogleMapController> _controller = Completer();
  late ClusterManager _manager;
  Set<Marker> markers = Set();
  final LatLng _center = const LatLng(22.5645, 72.9289);


 /* late GoogleMapController mapController;

  late BitmapDescriptor _markerIcon;
  late BitmapDescriptor busBitmap;
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }*/

  @override
  void initState() {
    _manager = _initClusterManager();
    /*markers.addLabelMarker(LabelMarker(
      label: widget.items[1].placeName,
      markerId: MarkerId("idString"),
      position: widget.items[1].location,
      backgroundColor: Colors.green,
      icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueAzure)
    )).then((value) {
      setState(() {});
    },
    );*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   /* return GoogleMap(
              mapType: MapType.normal,
              compassEnabled: false,
              zoomControlsEnabled: false,
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 5.0,
              ),
              markers:markers,
            );*/
    return GoogleMap(
        mapType: MapType.normal,
        compassEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 9.0,
        ),
        markers: markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          _manager.setMapId(controller.mapId);
        },
        zoomGesturesEnabled: true,
        tiltGesturesEnabled: false,
        onCameraMove: _manager.onCameraMove,
        onCameraIdle: _manager.updateMap);

    // This trailing comma makes auto-formatting nicer for build methods.
  }

  ClusterManager<Place> _initClusterManager() {
    return ClusterManager<Place>(widget.items, _updateMarkers,
        markerBuilder: _markerBuilder);
  }

  void _updateMarkers(Set<Marker> markers) {
    print('Updated ${markers.length} markers');
    setState(() {
      this.markers = markers;
    });
  }

  Future<Marker> Function(Cluster) get _markerBuilder => (cluster) async {
        List<Place> place = cluster.items as List<Place>;
        late Place p;
        for (int i = 0; i < place.length; i++) {
          p = place.elementAt(i);
          p.placeName;
        }

        return Marker(
          markerId: MarkerId(cluster.getId()),
          position: cluster.location,
          onTap: () {
            print('---- $cluster');
            List<Place> place = cluster.items as List<Place>;
            late Place p;
            for (int i = 0; i < place.length; i++) {
              p = place.elementAt(i);
              p.placeName;
            }
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChargePointDetailScreen(chargePointId: p.getId)),
            );
          },
          icon: await _getMarkerBitmap(cluster.isMultiple ? 125 : 75,
              text: cluster.isMultiple ? cluster.count.toString() : p.placeName),
        );
      };

  Future<BitmapDescriptor> _getMarkerBitmap(int size, {String? text}) async {
    if (kIsWeb) size = (size / 2).floor();

    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint1 = Paint()..color = Colors.cyan;
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
