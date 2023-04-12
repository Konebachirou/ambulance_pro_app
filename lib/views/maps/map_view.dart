// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:pfe/widgets/bottom_navigation.dart';

// class MapView extends StatefulWidget {
//   final List<dynamic> userInf;
//   const MapView({Key? key, required this.userInf}) : super(key: key);

//   @override
//   _MapViewState createState() => _MapViewState();
// }

// class _MapViewState extends State<MapView> {
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         widget.userInf.last
//             ? Navigator.of(context).pushAndRemoveUntil(
//                 MaterialPageRoute(builder: (_) => const BottomNavigation()),
//                 ModalRoute.withName('/student'),
//               )
//             : Navigator.pop(context, true);
//         return false;
//       },
//       child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.blue.shade900,
//             toolbarHeight: 50,
//             centerTitle: true,
//             title: const Text("FSM MAP"),
//           ),
//           body: Center(
//             child: Column(
//               children: [
//                 Flexible(
//                   child: FlutterMap(
//                     options: MapOptions(
//                       center: LatLng(35.76475, 10.80495),
//                       zoom: 17.2,
//                     ),
//                     layers: [
//                       TileLayerOptions(
//                           urlTemplate:
//                               "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//                           subdomains: ['a', 'b', 'c']),
//                       MarkerLayerOptions(
//                         markers: [
//                           Marker(
//                             point:
//                                 LatLng(35.76416936598237, 10.805134177207947),
//                             builder: (ctx) => const Icon(
//                               Icons.location_pin,
//                               size: 40,
//                               color: Colors.blue,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           )),
//     );
//   }
// }
