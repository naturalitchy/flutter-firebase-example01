
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class RootScreen extends StatelessWidget {
//   const RootScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           child: Column(
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   createDataInFirestore();
//                 },
//                 child: const Text(' Click me '),
//               )
//             ],
//           )
//         ),
//       ),
//     );
//   }
//
//   void createDataInFirestore() {
//     final userCol = FirebaseFirestore.instance.collection("users").doc("userkey1");
//     userCol.set({
//       "username" : "abc",
//       "age"      : 124
//     });
//   }
//
// }