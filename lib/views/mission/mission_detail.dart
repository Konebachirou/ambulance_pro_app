import 'package:ambulance_pro_app/controller/mission_controller.dart';
import 'package:ambulance_pro_app/models/mission.dart';
import 'package:ambulance_pro_app/views/mission/mission_view.dart';
import 'package:ambulance_pro_app/views/widget/bottom_navigation.dart';
import 'package:flutter/material.dart';

class MissionDetail extends StatefulWidget {
  const MissionDetail({super.key, required this.title, required this.id});
  final String title;
  final String id;
  @override
  State<MissionDetail> createState() => _MissionDetailState();
}

class _MissionDetailState extends State<MissionDetail> {
  late Future<List<Mission>> mission;
  @override
  void initState() {
    super.initState();
    mission = getMission(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: FutureBuilder(
        future: mission,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return Column(children: [
              const SizedBox(
                height: 20,
              ),
              rows("N° Demande : ", snapshot.data![0].demande),
              rows("Adresse de départ : ", snapshot.data![0].adresseDep),
              rows("Adresse d'arriver : ", snapshot.data![0].adresseArriv),
              rows("N° chauffeur principal : ", snapshot.data![0].chauffeurP),
              rows("N° chauffeur secondaire : ", snapshot.data![0].chauffeurS),
              rows(
                  "N° immatriculation vehicule : ", snapshot.data![0].vehicule),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    snapshot.data![0].heureDeb == null
                        ? TextButton(
                            onPressed: () {
                              var hd = DateTime.now().toString();

                              updateheuredeb(widget.id, hd);
                              setState(() {
                                mission = getMission(widget.id);
                              });
                              // Navigator.of(context).pushAndRemoveUntil(
                              //   MaterialPageRoute(
                              //       builder: (_) => MissionDetail(
                              //             id: widget.id,
                              //             title: widget.title,
                              //           )),
                              //   ModalRoute.withName('/student'),
                              // );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor: Colors.green,
                                content: Text("Début de mission"),
                              ));
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                            ),
                            child: const Text(
                              "Démarrer",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        : TextButton(
                            child: const Text(
                              "Terminer",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              var hd = DateTime.now().toString();
                              updateheurefin(widget.id, hd);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const BottomNavigation()));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor: Colors.red,
                                content: Text("Fin de La mission"),
                              ));
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.red,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                            ),
                          ),
                  ],
                ),
              )
            ]);
          }
          return Center(
              heightFactor: MediaQuery.of(context).size.height * 0.03,
              child: CircularProgressIndicator());
        }),
      )),
    );
  }
}

Widget rows(data1, data2) {
  return Card(
    elevation: 8,
    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 18),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(data1),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(data2.toString()),
          ),
        ],
      ),
    ),
  );
}
