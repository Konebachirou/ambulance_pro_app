import 'dart:convert';

import 'package:ambulance_pro_app/models/user.dart';
import 'package:ambulance_pro_app/views/setting/widgets/profil.dart';
import 'package:ambulance_pro_app/views/widget/animation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../connexion/signin_view.dart';
import 'widgets/buildoption.dart';
import 'widgets/textforms/email.dart';
import 'widgets/textforms/password.dart';
import 'widgets/textforms/profil_detail.dart';
import '../../controller/auth_controller.dart';

class SettingView extends StatefulWidget {
  // final List<dynamic> userInf;
  const SettingView({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  late final List<dynamic> userInf;
  Future<User>? user;
  var nw = Network();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = nw.getUser();

    print(user);
  }

  @override
  Widget build(BuildContext context) {
    var isActive = true;
    var isActive2 = false;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Paramètre"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder(
              future: user,
              builder: (context, snapshot) {
                print(snapshot.data);
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Profil(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Text(
                      snapshot.data != null
                          ? snapshot.data!.nom +
                              ' ' +
                              snapshot.data!.prenom.toString()
                          : '',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              AnimationWidget(
                                  time: 200,
                                  offset: const Offset(0, 0.5),
                                  child: BuildOption(
                                    icon: Icons.person_outline_rounded,
                                    title: "Modifier Profil",
                                    ontap: () {
                                      showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (BuildContext context) =>
                                              const ProfilDetail());
                                    },
                                  )),
                              AnimationWidget(
                                  time: 250,
                                  offset: const Offset(0, 0.5),
                                  child: BuildOption(
                                    icon: Icons.person_outline_rounded,
                                    title: "Modifier Email",
                                    ontap: () {
                                      showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (BuildContext context) =>
                                              const EmailEdit());
                                    },
                                  )),
                              AnimationWidget(
                                  time: 300,
                                  offset: const Offset(0, 0.5),
                                  child: BuildOption(
                                    title: "Modifier Mot de Passe",
                                    icon: Icons.lock_outline_rounded,
                                    ontap: () {
                                      showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (BuildContext context) =>
                                              const Password());
                                    },
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: OutlinedButton(
                              style: TextButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              onPressed: () async {
                                SharedPreferences localStorage =
                                    await SharedPreferences.getInstance();
                                localStorage.clear();
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const SigninView()),
                                    (Route<dynamic> route) => false);

                                // localStorage.setString('token', json.encode(body['token']));
                                // FirebaseAuth.instance.signOut().then((value) =>
                                //     Navigator.pushAndRemoveUntil(
                                //         context,
                                //         MaterialPageRoute(
                                //             builder: (BuildContext context) =>
                                //                 const SigninView()),
                                //         (Route<dynamic> route) => false));
                              },
                              child: const Text("SIGN OUT",
                                  style: TextStyle(
                                      fontSize: 16,
                                      letterSpacing: 2.2,
                                      color: Colors.black)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }

  row(String title, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.grey.shade50,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
