import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import '../../controller/auth_controller.dart';
import '../widget/animation.dart';
import '../widget/bottom_navigation.dart';
import '../widget/constant.dart';
import 'forget_password_view.dart';

class SigninView extends StatefulWidget {
  const SigninView({Key? key}) : super(key: key);

  @override
  _SigninViewState createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // FirebaseDatabase database = FirebaseDatabase.instance;
  final _formKey = GlobalKey<FormState>();
  bool hasPwdError = false;
  String passwordError = '';
  bool hasEmailError = false;
  String emailError = '';
  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    // _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
              decoration: BoxDecoration(color: Colors.grey.shade300),
              padding: const EdgeInsets.only(bottom: 80),
              child: Column(children: [
                header(),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      SizedBox(
                        height: height * 0.03,
                      ),
                      _textInput(
                          hint: "Email",
                          icon: Icons.email,
                          controller: _emailController),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      _textInputPwd(
                          hint: "Password",
                          icon: Icons.vpn_key,
                          controller: _passwordController),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const ForgetPasswordView()));
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: height * 0.01),
                          alignment: Alignment.centerRight,
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Color.fromARGB(255, 204, 154, 2)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              signIn();
                              // _login();
                              // Navigator.of(context).pushAndRemoveUntil(
                              //   MaterialPageRoute(
                              //       builder: (_) => const BottomNavigation()),
                              //   ModalRoute.withName('/student'),
                              // );
                            }
                          },
                          child: const Text(
                            "Connexion",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          style: TextButton.styleFrom(
                            elevation: 10,
                            backgroundColor:
                                const Color.fromARGB(255, 1, 66, 94),
                            primary: Colors.white,
                            fixedSize: const Size(300, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      AnimationWidget(
                        time: 500,
                        offset: const Offset(0, -0.5),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                              text:
                                  "En continuant, vous acceptez les Conditions d'utilisation et la Politique de confidentialité. ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Lora",
                                  fontSize: 12)),
                        ),
                      ),
                    ],
                  ),
                ),
              ])),
        ),
      ),
    ));
  }

  Widget header() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.44,
      padding: const EdgeInsets.only(top: 15),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))),
      child: Center(
        child: Column(
          children: [
            AnimationWidget(
              time: 500,
              offset: const Offset(0, -0.5),
              child: Image.asset(
                "assets/images/logo.png",
                height: MediaQuery.of(context).size.height * 0.22,
                width: MediaQuery.of(context).size.height,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            const AnimationWidget(
              time: 500,
              offset: Offset(0, -0.5),
              child: Text(
                "Welcome",
                style: TextStyle(
                  fontFamily: "FleurDeLeah",
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            AnimationWidget(
              time: 500,
              offset: const Offset(0, -0.5),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1),
                child: const Text(
                  "veuillez-vous connecter pour accéder aux missions",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 1, 66, 94),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textInput({controller, hint, icon}) {
    return AnimationWidget(
      time: 500,
      offset: const Offset(0, -0.5),
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        elevation: 10,
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
          ),
          padding: const EdgeInsets.only(left: 10),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              } else if (value.length < 8) {
                return 'Please enter  correct mail';
              }
              return null;
            },
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              prefixIcon: Icon(icon),
            ),
          ),
        ),
      ),
    );
  }

  Widget _textInputPwd({controller, hint, icon}) {
    return AnimationWidget(
      time: 500,
      offset: const Offset(0, -0.5),
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        elevation: 10,
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
          ),
          padding: const EdgeInsets.only(left: 10),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              } else if (value.length < 6) {
                return 'Please enter  correct Password';
              }
              return null;
            },
            controller: controller,
            obscureText: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              prefixIcon: Icon(icon),
            ),
          ),
        ),
      ),
    );
  }

  void signIn() async {
    var dialogContexte;
    showDialog(
        barrierDismissible: false,
        barrierColor: Colors.black12,
        context: context,
        builder: (context) {
          dialogContexte = context;
          return circularProgress();
        });
    var data = {
      'email': _emailController.text,
      'password': _passwordController.text
    };

    var res = await Network().authData(data, 'auth/login');
    var body = json.decode(res.body);
    if (body['status']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['data']));
      setState(() {
        hasEmailError = false;
        hasPwdError = false;
      });

      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BottomNavigation()),
      );
    } else {
      Navigator.pop(dialogContexte);

      // ignore: use_build_context_synchronously
      AnimatedSnackBar.material(
        body['message'],
        type: AnimatedSnackBarType.warning,
        mobileSnackBarPosition: MobileSnackBarPosition.top,
        desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
        snackBarStrategy: RemoveSnackBarStrategy(),
      ).show(context);
      _showMsg(body['message']);
    }
  }
}
