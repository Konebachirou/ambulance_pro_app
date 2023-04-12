import 'package:flutter/material.dart';

import 'mission_detail.dart';

class MissionWidget extends StatelessWidget {
  MissionWidget(
      {super.key,
      required this.id,
      required this.dep,
      required this.val,
      required this.arriv});
  final String id;
  final String dep;
  final String arriv;
  final val;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (() {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => MissionDetail(
                      title: 'Mission N°$id',
                      id: id,
                    )),
          );
        }),
        child: Card(
          shape: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
              borderSide: BorderSide(color: Colors.white)),
          elevation: 10,
          margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Column(children: [
            Container(
              color: val == null
                  ? Color.fromARGB(255, 1, 66, 94)
                  : Color.fromARGB(255, 11, 112, 52),
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.date_range_rounded,
                    size: 26,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    'Mission N°$id',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 157, 210, 248),
                      borderRadius: BorderRadius.only()),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 26,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        "Start: $dep",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          // color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(8),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 37, 53, 64),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_sharp,
                          size: 26,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "Stop: $arriv",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          // textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ],
                    )),
              ],
            )
          ]),
        ));
  }
}
