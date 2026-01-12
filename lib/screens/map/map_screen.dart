import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const CameraPosition _initialCamera = CameraPosition(
    target: LatLng(-33.4489, -70.6693), // Santiago, Chile
    zoom: 12.0,
  );

  late GoogleMapController _mapController;

  bool _isMapDark = false;
  bool _hasPermission = false;

  @override
  void initState() {
    super.initState();
    _setStatusBar();
    _requestLocationPermission();
  }

  void _setStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: _isMapDark
            ? Brightness.light
            : Brightness.dark,
      ),
    );
  }

  Future<void> _requestLocationPermission() async {
    final status = await Permission.location.request();

    if (status.isGranted) {
      setState(() => _hasPermission = true);
    } else if (status.isPermanentlyDenied) {
      await openAppSettings();
    } else {
      setState(() => _hasPermission = false);
    }
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _mapController = controller;

    final style = await rootBundle.loadString('assets/map_style.json');
    _mapController.setMapStyle(style);
  }

  @override
  Widget build(BuildContext context) {
    final overlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: _isMapDark ? Brightness.light : Brightness.dark,
    );

    if (!_hasPermission) {
      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: overlayStyle,
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Se requiere permiso de ubicación para usar el mapa",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _requestLocationPermission,
                  child: const Text("Conceder permiso"),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Positioned.fill(
              child: GoogleMap(
                initialCameraPosition: _initialCamera,
                onMapCreated: _onMapCreated,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                compassEnabled: true,
                mapType: MapType.normal,
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
