import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test_task_2/widgets/dialog_box.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  late Set<Marker> _markers = {
     Marker(
        markerId: const MarkerId('1'),
        position: const LatLng(31.5102,74.3441),
        onTap: theDialog,
        infoWindow: InfoWindow(
            title: 'Marker 1',
        )
    ),
     Marker(
        markerId: MarkerId('2'),
        position: LatLng(31.5236,74.3514),
        onTap: theDialog,
        infoWindow: InfoWindow(
            title: 'Marker 2'
        )
    ),
     Marker(
        markerId: MarkerId('3'),
        position: LatLng(31.5316,74.3485),
         onTap: theDialog,
        infoWindow: InfoWindow(
            title: 'Marker 3'
        )
    ),
     Marker(
        markerId: MarkerId('4'),
        position: LatLng(31.4699,74.4391),
        onTap: theDialog,
        infoWindow: InfoWindow(
            title: 'Marker 4'
        )
    ),
     Marker(
        markerId: MarkerId('5'),
        position: LatLng(31.5010,74.3216),
        onTap: theDialog,
        infoWindow: InfoWindow(
            title: 'Marker 5'
        )
    )
  };
  static const CameraPosition _kGooglePlex =  CameraPosition(
    target: LatLng(31.5204, 74.3587),
    zoom: 14.4746,
  );

theDialog(){
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const DialogBox();
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: GoogleMap(
        markers: _markers,
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}