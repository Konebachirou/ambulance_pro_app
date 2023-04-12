// import 'dart:io';

// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:pfe/views/setting/commons/radial_progress.dart';

// class MyInfo extends StatefulWidget {
//   final List<dynamic> userInf;
//   const MyInfo({Key? key, required this.userInf}) : super(key: key);

//   @override
//   State<MyInfo> createState() => _MyInfoState();
// }

// class _MyInfoState extends State<MyInfo> {
//   DatabaseReference database = FirebaseDatabase.instance.ref("Users");
//   final User? user = FirebaseAuth.instance.currentUser;

//   PlatformFile? pikedFile;
//   String filename = "";

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         const SizedBox(
//           width: 30,
//         ),
//         Stack(
//           children: [
//             GestureDetector(
//               onTap: () async {
//                 try {
//                   final result = await FilePicker.platform.pickFiles(
//                     type: FileType.image,
//                   );
//                   setState(() {
//                     pikedFile = result!.files.first;
//                     filename = pikedFile!.name;
//                     print(filename);
//                     showDialog<bool>(
//                         context: context,
//                         builder: (context) {
//                           var file = File(pikedFile!.path.toString());
//                           return AlertDialog(
//                             contentPadding: EdgeInsets.zero,
//                             content: Image.file(file),
//                             actions: [
//                               TextButton(
//                                 onPressed: () async {
//                                   print(filename + " nouveau ficher");
//                                   try {
//                                     final ref = FirebaseStorage.instance
//                                         .ref()
//                                         .child("profil/$filename");
//                                     var file = File(pikedFile!.path.toString());
//                                     ref
//                                         .putFile(file)
//                                         .then((p0) => database
//                                                 .child(user!.uid.toString())
//                                                 .update({
//                                               "img": filename,
//                                             }))
//                                         .then((value) =>
//                                             Navigator.pop(context, true));
//                                     // final file = result.files.first;
//                                     // OpenFile.open(file.path);
//                                   } catch (e) {}
//                                 },
//                                 child: const Text("Changer"),
//                               ),
//                               TextButton(
//                                 onPressed: () {
//                                   Navigator.pop(context, true);
//                                 },
//                                 child: const Text("Annuler"),
//                               ),
//                             ],
//                           );
//                         }).then((value) {
//                       if (value == true) {
//                         setState(() {});
//                       }
//                     });
//                     // obj = result!.files;
//                   });
//                 } catch (e) {}
//                 setState(() {});
//               },
//               child: RadialProgress(
//                 width: 4,
//                 progressColor: Colors.amber,
//                 goalCompleted: 0.9,
//                 child: CircleAvatar(
//                   radius: 50,
//                   child: ClipOval(
//                     child: widget.userInf.isNotEmpty
//                         ? widget.userInf[2] != ''
//                             ? Image.network(
//                                 widget.userInf[2],
//                                 fit: BoxFit.fill,
//                                 height:
//                                     MediaQuery.of(context).size.height * 0.5,
//                                 width: MediaQuery.of(context).size.width * 0.9,
//                               )
//                             : widget.userInf.isNotEmpty
//                                 ? Image.asset(
//                                     widget.userInf[1] == 'F'
//                                         ? "assets/images/avatarF.jpg"
//                                         : "assets/images/avatarM.jpg",
//                                     width: 100,
//                                     height: 150,
//                                   )
//                                 : const Text("")
//                         : const Text(""),
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               top: MediaQuery.of(context).size.height * 0.1,
//               left: MediaQuery.of(context).size.height * 0.08,
//               child: IconButton(
//                   onPressed: () {},
//                   icon: const Icon(
//                     Icons.camera_alt,
//                     size: 40,
//                   )),
//             )
//           ],
//         ),
//         const SizedBox(
//           width: 20,
//         ),
//         Flexible(
//           child: Container(
//             margin: const EdgeInsets.symmetric(horizontal: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   widget.userInf.isNotEmpty
//                       ? widget.userInf[0].toUpperCase()
//                       : " ",
//                   style: const TextStyle(
//                     fontSize: 20.0,
//                     color: Colors.black,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   widget.userInf.isNotEmpty ? widget.userInf[3] : " ",
//                   //textAlign: TextAlign.center,
//                   maxLines: 6,
//                   style: const TextStyle(
//                     fontSize: 18.0,
//                     color: Colors.black,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 widget.userInf.isNotEmpty
//                     ? widget.userInf[4] == true
//                         ? Text(
//                             widget.userInf.isNotEmpty ? widget.userInf[4] : " ",
//                             //textAlign: TextAlign.center,
//                             maxLines: 6,
//                             style: const TextStyle(
//                               fontSize: 18.0,
//                               color: Colors.black,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           )
//                         : const Text("")
//                     : const Text("")
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
