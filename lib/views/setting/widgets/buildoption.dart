import 'package:flutter/material.dart';

class BuildOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback ontap;
  const BuildOption(
      {Key? key, required this.title, required this.icon, required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 1),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}


// // showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   title: Text(title),
//                   content: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text("Option 1"),
//                       Text("Option 2"),
//                       Text("Option 3"),
//                     ],
//                   ),
//                   actions: [
//                     FlatButton(
//                         onPressed: () {
//                           Navigator.of(context).pop();
//                         },
//                         child: Text("Close")),
//                   ],
//                 );
//               });


// showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   title: Text(title),
//                   content: SingleChildScrollView(
//                     child: Container(
//                       child: Text(
//                           "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet., comes from a line in section 1.10.32"),
//                     ),
//                   ),
//                   actions: [
//                     FlatButton(
//                         onPressed: () {
//                           Navigator.of(context).pop();
//                         },
//                         child: Text("Close")),
//                   ],
//                 );
//               });