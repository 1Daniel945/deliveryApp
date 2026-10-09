import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class StaticMapWidget extends StatefulWidget {
  const StaticMapWidget({super.key});

  @override
  State<StaticMapWidget> createState() => _StaticMapWidgetState();
}

class _StaticMapWidgetState extends State<StaticMapWidget> {
  MapboxMap? mapboxMap;

  _onMapCreated(MapboxMap map) async {
    mapboxMap = map;
    
    await mapboxMap?.setCamera(
      CameraOptions(
        center: Point(coordinates: Position(20.1264558, -101.1933423)),
        zoom: 11.0,
      ),
    );

    await mapboxMap?.gestures.updateSettings(
      GesturesSettings(
        scrollEnabled: true,
        pinchToZoomEnabled: true,
        rotateEnabled: true,
        pitchEnabled: true,
        doubleTouchToZoomOutEnabled: true,
        boxZoomEnabled: true,
      ),
    );
  }

  // Este es el método que te hace falta:
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: MapWidget(
        onMapCreated: _onMapCreated,
        styleUri: MapboxStyles.MAPBOX_STREETS,
      ),
    );
  }
}