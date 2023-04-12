import 'package:flutter/material.dart';
import '../widget/animation.dart';
import '../widget/bottom_navigation.dart';
import 'signin_view.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  _ForgetPasswordViewState createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
              padding: const EdgeInsets.only(bottom: 70),
              child: Column(children: [
                header(),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: const Text(
                          "Vous recevrez un nouveau message sur ce mail pour changer votre Mot de Passe",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      _textInput(
                          hint: "Email",
                          icon: Icons.email,
                          controller: _controller),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      Center(
                        child: AnimationWidget(
                          time: 1100,
                          offset: const Offset(0, 0.5),
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          const BottomNavigation()));
                            },
                            child: const Text(
                              "Continuer",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: TextButton.styleFrom(
                              elevation: 10,
                              backgroundColor: Color.fromARGB(255, 1, 66, 94),
                              primary: Colors.white,
                              fixedSize: const Size(300, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("J'ai deja un compte",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Lora",
                                  fontSize: 18)),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => const SigninView()));
                            },
                            child: const Text(" SignIn",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 1, 66, 94),
                                    fontFamily: "Lora",
                                    fontSize: 18)),
                          ),
                        ],
                      )
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
      height: MediaQuery.of(context).size.height * 0.49,
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
              time: 600,
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
            const AnimationWidget(
              time: 700,
              offset: Offset(0, -0.5),
              child: Text(
                "Faculté des Sciences de Monastir",
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 1, 66, 94),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const AnimationWidget(
              time: 800,
              offset: Offset(0, -0.5),
              child: Text(
                "كلية العلوم بالمنستير",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5,
                    color: Color.fromARGB(255, 1, 66, 94),
                    wordSpacing: 3),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textInput({controller, hint, icon}) {
    return AnimationWidget(
      time: 900,
      offset: const Offset(0, 0.5),
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
}
