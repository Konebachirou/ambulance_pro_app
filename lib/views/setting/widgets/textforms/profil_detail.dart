import 'package:ambulance_pro_app/views/widget/animation.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
// import 'package:pfe/constant.dart';

class ProfilDetail extends StatefulWidget {
  const ProfilDetail({Key? key}) : super(key: key);

  @override
  _ProfilDetailState createState() => _ProfilDetailState();
}

class _ProfilDetailState extends State<ProfilDetail> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nomController = TextEditingController();
  final TextEditingController prenomController = TextEditingController();
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  // DatabaseReference database = FirebaseDatabase.instance.ref('Users');
  bool error = false;
  String errorMsg = '';
  @override
  Widget build(BuildContext context) {
    return AnimationWidget(
      time: 350,
      offset: const Offset(0.5, 0),
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        content: Form(
          key: _formKey,
          child: Container(
            color: Colors.white,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const SizedBox(
                height: 15,
              ),
              AnimationWidget(
                time: 200,
                offset: const Offset(0, -0.5),
                child: TextFormField(
                  controller: nomController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "veuillez entrer un nom";
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: "Nom",
                    labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 196, 195, 195)),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              AnimationWidget(
                time: 200,
                offset: const Offset(0, -0.5),
                child: TextFormField(
                  controller: nomController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "veuillez entrer un nom";
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: "Prenom",
                    labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 196, 195, 195)),
                  ),
                ),
              ),
            ]),
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                // if (_auth.currentUser!.email != nomController.text) {
                //   setState(() {
                //     error = true;
                //     errorMsg = "Email incorrecte";
                //   });
                // } else {
                //   setState(() {
                //     error = false;
                //     errorMsg = "";
                //   });
                // }
                // if (_formKey.currentState!.validate() &&
                //     _auth.currentUser!.email == nomController.text) {
                //   _auth.currentUser!
                //       .updateEmail(prenomController.text.trim())
                //       .then((value) => database
                //               .child(_auth.currentUser!.uid.toString())
                //               .update({
                //             "email": prenomController.text,
                //           }).then((value) {
                //             Navigator.pop(context, true);
                //           }));
                // }
              },
              child: const Text("Modifier")),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Annuler")),
        ],
      ),
    );
  }

  textInput({controller, label, validate}) {
    return AnimationWidget(
      time: 200,
      offset: const Offset(0, -0.5),
      child: TextFormField(
        controller: controller,
        validator: validate,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
          ),
          labelText: label,
          labelStyle:
              const TextStyle(color: Color.fromARGB(255, 196, 195, 195)),
        ),
      ),
    );
  }
}
