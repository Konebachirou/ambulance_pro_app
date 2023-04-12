import 'package:ambulance_pro_app/models/mission.dart';
import 'package:flutter/material.dart';
import '../../controller/mission_controller.dart';
import 'mission_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Acceuil extends StatefulWidget {
  const Acceuil({super.key});

  @override
  State<Acceuil> createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  Future<List<Mission>>? futureMission;

  @override
  void initState() {
    super.initState();
    setState(() {
      futureMission = fetchAllMission();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Missions"),
          centerTitle: true,
        ),
        body: Center(
          child: FutureBuilder(
            future: futureMission,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  return snapshot.hasData
                      ? snapshot.data!.length != 0
                          ? ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                print(snapshot.data![index].commentaire);
                                // return Text(index.toString());
                                return MissionWidget(
                                  id: snapshot.data![index].id.toString(),
                                  dep: snapshot.data![index].adresseDep,
                                  arriv: snapshot.data![index].adresseArriv,
                                  val: snapshot.data![index].heureDeb,
                                );
                              })
                          : Text('aucune mission disponible')
                      : const CircularProgressIndicator(
                          color: Colors.black,
                          semanticsValue: "Wait...",
                        );
                // return Text(snapshot.data![1].commentaire.toString());

                // break;
                default:
                  return const CircularProgressIndicator(
                    // color: Colors.black,
                    semanticsValue: "Wait...",
                  );
              }
            },
          ),
        ));
  }
}
