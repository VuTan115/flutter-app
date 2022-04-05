import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:goob_by_me/core/maps/map_builder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapHelper {
  MapHelper();

  Widget create({
    required double width,
    required double height,
    required double cameraZoom,
    required LatLng startPosition,
    required Map<MarkerId, Marker> markers,
    required Map<PolygonId, Polygon> polygons,
    required Map<PolylineId, Polyline> polyLines,
    required Map<CircleId, Circle> circles,
    required MapCreatedCallback onMapCreated,
    required VoidCallback onCameraMoveStarted,
    required CameraPositionCallback onCameraMove,
    required VoidCallback onCameraIdle,
    required ArgumentCallback<LatLng> onTap,
    required ArgumentCallback<LatLng> onLongPress,
  }) {
    CameraPosition _initialPosition = CameraPosition(target: startPosition, zoom: cameraZoom);
    var _markers, _polygons, _polylines, _circles;
    if (markers != null) _markers = markers;
    if (polygons != null) _polygons = polygons;
    if (polyLines != null) _polylines = polyLines;
    if (circles != null) _circles = circles;

    return SizedBox(
      width: width,
      height: height,
      child: MapBuilder(
        initialCameraPosition: _initialPosition,
        markers: _markers,
        polygons: _polygons,
        polylines: _polylines,
        circles: _circles,
        onMapCreated: onMapCreated,
        onCameraMoveStarted: onCameraMoveStarted,
        onCameraMove: onCameraMove,
        onCameraIdle: onCameraIdle,
        onTap: onTap,
        onLongPress: onLongPress,
        gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
          new Factory<OneSequenceGestureRecognizer>(
            () => EagerGestureRecognizer(),
          ),
        ].toSet(),
      ),
    );
  }
}
