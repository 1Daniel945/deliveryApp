import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class Mapviewer extends ConsumerStatefulWidget {
  const Mapviewer({super.key});

  @override
  ConsumerState<Mapviewer> createState() => _MapviewerState();
}

class _MapviewerState extends ConsumerState<Mapviewer> {
  MapboxMap? _mapboxMap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MapWidget(
            key: const ValueKey('mapWidget'),
            styleUri: 'mapbox://styles/daniel945/cmwlwvfhs00dj01s3hker75ia',
            onMapCreated: (MapboxMap controller) {
              _mapboxMap = controller;
              _moverCameraInitial();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _moverCameraInitial() async {
    await _mapboxMap?.setCamera(
      CameraOptions(
        center: Point(
          coordinates: Position(20.13767, -101.16588),
        ),
        zoom: 20.0,
        pitch: 0,
        bearing: 0,
      )
    );
  }
}