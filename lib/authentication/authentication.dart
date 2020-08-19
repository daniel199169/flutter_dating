import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future logUserIn(String email,String password) async {
  try{
    var response = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    return response.user;

  }
  catch(er){
    print(er);
    return false;
  }
}

Future signUp(String email, String password,String username,int age,bool maleGender, String race, String country,String city) async {
  try{
    var user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    await Firestore.instance.collection("Users").document(user.user.uid).setData({
      "age": age,
      "userName": username,
      "male": maleGender,
      "race": race,
      "country": country,
      "city": city
    });
    return user.user;
  }
  catch(er){
    print(er);
    return false;

  }
}