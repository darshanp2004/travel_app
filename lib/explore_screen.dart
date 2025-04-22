import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:travel_app/utils/string.dart';

class exploreScreen extends StatefulWidget {
  @override
  State<exploreScreen> createState() => _exploreScreenState();
}

class _exploreScreenState extends State<exploreScreen> {
  GoogleMapController? mapController;

  LatLng currentLocation = LatLng(0.0, 0.0);
  LatLng Shimla = LatLng(31.1050, 77.1640);
  LatLng Manali = LatLng(32.2432, 77.1892);
  LatLng Nainital = LatLng(29.3924, 79.4534);
  LatLng Darjeeling = LatLng(27.0416, 88.2664);
  LatLng Lehladakh = LatLng(34.1526, 77.5771);
  LatLng Gulmarg = LatLng(34.0484, 74.3805);
  LatLng Paris = LatLng(48.8575,  2.3514);
  LatLng Hongkong = LatLng(22.3193,114.1694);
  LatLng Phuket = LatLng(7.8804, 98.3923);
  LatLng Pattaya = LatLng(12.9236, 100.8824);
  LatLng Bali = LatLng(-8.409518, 115.188919);

  Future<bool> requestPermission() async {
    final status = await Permission.location.request();
    return status.isGranted;
  }

  Future<Position?> getCurrentLocation() async {
    final permission = await requestPermission();

    if (!permission) {
      print(permissionDenied);
      return null;
    }
    return await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.best),
    );
  }

  Future<void> getLocation() async {
    await requestPermission();
    final position = await getCurrentLocation();
    if (position != null) {
      setState(() {
        currentLocation = LatLng(position.latitude, position.longitude);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      appBar: AppBar(
        title: Text(explore),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: currentLocation,
          zoom: 15,
        ),
        onMapCreated: (controller) {
          mapController = controller;
        },
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        markers: {
          Marker(
            markerId: MarkerId(currentLoc),
            position: currentLocation,
          ),
          Marker(markerId: MarkerId(shimla), position: Shimla),
          Marker(markerId: MarkerId(manali), position: Manali),
          Marker(markerId: MarkerId(nainital), position: Nainital),
          Marker(markerId: MarkerId(darjeeling), position: Darjeeling),
          Marker(markerId: MarkerId(lehladakh), position: Lehladakh),
          Marker(markerId: MarkerId(gulmarg), position: Gulmarg),
          Marker(markerId: MarkerId(paris), position: Paris),
          Marker(markerId: MarkerId(hongkong), position: Hongkong),
          Marker(markerId: MarkerId(phuket), position: Phuket),
          Marker(markerId: MarkerId(pattaya), position: Pattaya),
          Marker(markerId: MarkerId(bali), position: Bali),
        },
      ),
    );
  }
}
