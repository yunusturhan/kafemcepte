import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kafemcepte/model/yol_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kafemcepte/service/yol_repository.dart';
class IletisimSayfasi extends StatefulWidget {
  double x_konumu=38.0266937,y_konumu=32.5101791;
  IletisimSayfasi({Key? key,required double this.x_konumu,required double this.y_konumu }) : super(key: key);

  @override
  State<IletisimSayfasi> createState() => _IletisimSayfasiState();
}

class _IletisimSayfasiState extends State<IletisimSayfasi> {

  GoogleMapController? _googleMapController;
  Marker? _origin;
  Marker? _destination;
  Directions? _info;
  double enlem = 0.0, boylam = 0.0;
  var konum;
  LatLng? bitisKonum;

  LatLng basKonum=LatLng(38.0266937,32.5101791);
  LatLng? bizimKonum;

  @override
  void dispose() {
    _googleMapController!.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    final _initialCameraPosition = CameraPosition(
      target: LatLng(38.0266937,32.5101791),
      zoom: 16,
    );
    bizimKonum=LatLng(widget.x_konumu,widget.y_konumu);


    return Scaffold(
      appBar: AppBar(
        title: Text("İletişim"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(padding: EdgeInsets.all(5),
              width: 400,
              height: 400,
              child: Stack(
                alignment: Alignment.center,

                children: [
                  GoogleMap(

                    initialCameraPosition: _initialCameraPosition,
                    onMapCreated: (controller) => _googleMapController = controller,
                    markers: {
                      if (_origin != null) _origin!,
                      if (_destination != null) _destination!
                    },
                    polylines: {
                      if (_info != null)
                        Polyline(
                          polylineId: const PolylineId('overview_polyline'),
                          color: Colors.red,
                          width: 5,
                          points: _info!.polylinePoints
                              .map((e) => LatLng(e.latitude, e.longitude))
                              .toList(),
                        ),
                    },
                    onTap:_addMarker,

                  ),
                  if (_info != null)
                    Positioned(
                      top: 20.0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 6.0,
                          horizontal: 12.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.yellowAccent,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: Text(
                          '${_info!.totalDistance}, ${_info!.totalDuration}',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Text("Konya Teknik Üniversitesi Yemekhanesi",style: TextStyle(fontSize: 16),),
Text("Akademi, Yeni İstanbul Cd. No:235/1, 42250 Selçuklu/Konya",style: TextStyle(fontSize: 14),),
            Text("Rezervasyon için : +90 (531) 968 8542",style: TextStyle(fontSize: 16),)
          ],
        ),
      ),

    );
  }



  void _addMarker(LatLng pos) async {
    konum =
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    bitisKonum = bizimKonum;

    _origin = Marker(
      markerId: const MarkerId('origin'),
      infoWindow: const InfoWindow(title: 'Origin'),
      icon:
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: basKonum,
    );

    // Origin is already set
    // Set destination
    setState(() {
      _destination = Marker(
        markerId: const MarkerId('destination'),
        infoWindow: const InfoWindow(title: 'Destination'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        position: bizimKonum!,
      );
    });


    final directions = await DirectionsRepository()
        .getDirections(origin: basKonum, destination: bitisKonum!);
    setState(() => _info = directions);
    print(_info!.totalDuration);
    print(_info!.totalDistance);


  }


  }
