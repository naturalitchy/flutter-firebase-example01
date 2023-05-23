// import 'package:connect_firebase_example01/root_screen.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(
//     const MaterialApp(
//       home: RootScreen(),
//     )
//   );
// }






import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart'; //flutter의 package를 가져오는 코드 반드시 필요
// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget { //MyApp 클래스 선언
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my first app',
      home: MyPage(),
    );
  }
}


class MyPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Set'),
              onPressed: (){
                createData();
              },
            ),
            const SizedBox(height: 100,),
            ElevatedButton(
              child: const Text('Get'),
              onPressed: (){
                getUsers();
              },
            ),
            const SizedBox(height: 100,),
            ElevatedButton(
              child: const Text('Update'),
              onPressed: () {
                updateUsers();
              },
            ),
            const SizedBox(height: 100,),
            ElevatedButton(
              child: const Text('Delete'),
              onPressed: () {
                deleteUsers();
              },
            ),
          ],
        ),
      ),
    );
  }
}

void createData (){

  /// way 1
  final db = FirebaseFirestore.instance;
  // Create a new user with a first and last name
  final user = <String, dynamic>{
    "first": "Ada",
    "last": "Lovelace",
    "born": 1815
  };
  // Add a new document with a generated ID
  db.collection("users").add(user).then((DocumentReference doc) =>
      print('DocumentSnapshot added with ID: ${doc.id}'));

  /// way 2.
  // final usercol=FirebaseFirestore.instance.collection("users").doc("userkey1");
  // usercol.set({
  //   "username" : "abc",
  //   "age" : 5,
  // });

  /// way 3
  // db.collection("userss").doc("userkey2").set(user);

  // await db.collection("users").get().then((event) {
  //   for (var doc in event.docs) {
  //     print("${doc.id} => ${doc.data()}");
  //   }
  // });
}

Future<void> getUsers() async {
  String first;
  final db = FirebaseFirestore.instance;

  await db.collection("users").get().then((event) {
    for (var doc in event.docs) {
      print("${doc.id} => ${doc.data()} = = = > > ");
    }
  });

  // try {
  //   final exam = await db.collection("users").doc("userkey1").get();
  //   print(' >>> age = ${exam}');
  //   print(' >>> age = ${exam['age']}');
  //   String aa = exam['username'].runtimeType.toString();
  //   print(" >>> getVariableType = ${aa}");
  // } catch(e) {
  //   print(' ################ error = ${e}');
  // }

  /**
   *
   *
   *
   * Document Snapshot 이 정확히 무엇인지.
   * 모든 (CRUD) 것에 await 를 해주는지.
   * 모든 (CURD) 에 예외처리를 전부 try 로 해주는지.
   * 접근 보안. (공식 문서 참고).
   * 2번째 Table 못찾을때 에러 발생 법.
   *
   *
   *
   *
   */






  try {
    DocumentSnapshot documentSnapshot;
    documentSnapshot = await db.collection("users").doc("userkey1").get();
  } catch(e) {
    print(' ################ error = ${e}');
  }



}

void updateUsers() {
  final db = FirebaseFirestore.instance;
  db.collection("users").doc("userkey1").set({
    "age" : 50,
    "name" : "modify",
  });
}

void deleteUsers() {
  DocumentSnapshot documentSnapshot;
  final db = FirebaseFirestore.instance;
  // db.collection("users").doc("userkey1").delete();
  // db.collection("users").doc("wasd").delete();

  try {
    // await
    db.collection("users").doc("wasd").delete();
  } catch (e) {
    print(' >>>>>>>> error = ${e}');
  }

}