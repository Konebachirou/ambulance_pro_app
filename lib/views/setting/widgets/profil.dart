import 'package:ambulance_pro_app/views/widget/radial_progress.dart';
import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RadialProgress(
            width: 5,
            progressColor: Colors.blue,
            goalCompleted: 0.9,
            child: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                radius: 98,
                child: ClipOval(
                  child: Image.asset(
                    "assets/images/avatarM.jpg",
                    width: 220,
                    height: 280,
                  ),
                ),
              ),
            )),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.22,
          left: MediaQuery.of(context).size.height * 0.14,
          child: Container(
            // width: 40,
            // height: 40,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
                onPressed: () async {},
                icon: const Icon(
                  Icons.camera_alt_rounded,
                  size: 28,
                  color: Colors.white,
                )),
          ),
        )
      ],
    );
  }
}
