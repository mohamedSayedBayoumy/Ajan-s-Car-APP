import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import '../../../main.dart';
import '../../../modules/bottom/bottom.dart';
import '../../snakbar/fun_snakbar.dart';
import 'States.dart';

class cubitBottom extends Cubit<bottomNavgator> {
  cubitBottom() : super(mainBottom());

  static cubitBottom get(context) => BlocProvider.of(context);

  final PageController y = PageController();

  int x = 0;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController Phone = TextEditingController();
  TextEditingController Addrees = TextEditingController();
  TextEditingController Id = TextEditingController();
  TextEditingController descraption = TextEditingController();
  TextEditingController model = TextEditingController();
  TextEditingController defaultt = TextEditingController();
  var fromKey = GlobalKey<FormState>();
  var RegisterKey = GlobalKey<FormState>();
  IconData icon = Icons.remove_red_eye_sharp;
  bool obscureText = true;
  Color? colorPrefixIcon;
  Color colorSuffixIcon = const Color.fromRGBO(131, 131, 131, 1.0);
  final foucesPassword = FocusNode();
  final foucesEmail = FocusNode();
  final foucesPhone = FocusNode();
  final foucesAddress = FocusNode();

  // DataBase -------------------------------------------------------

  dynamic downloadUrlImage;
  final ImagePicker imagePicker = ImagePicker();
  dynamic imgXfile;
  dynamic dox;
  dynamic doxId;
  dynamic ID;
  dynamic last;
  dynamic PhotoUrl;
  dynamic NewPhoto;
  final currentuser = FirebaseAuth.instance;
  Color color = Colors.white;

  Future<void> Buttonlogin(dynamic context) async {
    if (fromKey.currentState!.validate()) {
      if (password.text.length < 6) {
        icon = Icons.visibility_off_outlined;
        obscureText = false;
      }
      if (password.text.length >= 6) {
        icon = Icons.visibility;
        obscureText = true;

        if (email.text != '' && password.text != '') {
          try {
            showDialog(
                context: context,
                builder: (context) {
                  return Center(
                      child: Lottie.asset('assets/lf30_editor_jchf2v7t.json',
                          height: 75, width: 75));
                });
            await login().then((value) {
              Navigator.pushAndRemoveUntil(
                  context,
                  PageTransition(
                      child: const  bottom(),
                      type: PageTransitionType.rightToLeft),
                      (route) => false) ;
            });
          } on FirebaseAuthException catch (e) {
            Navigator.pop(context);
            snack(context, Icons.error_outline, e.message.toString(), true);
            print(e.message);
          }

          // login();
        }
      }
    }
  }

  Future loginDataBaseForcustomer() async {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(imgXfile!.path).pathSegments.last}');
    UploadTask upload = ref.putFile(File(imgXfile!.path));
    downloadUrlImage = await (await upload).ref.getDownloadURL();
    final reff = FirebaseFirestore.instance.collection('Emails').doc();
    dox = reff.id;
    reff.set(<String, dynamic>{
      'id': dox,
      'Email': email.text,
      'Password': password.text,
      'photo': downloadUrlImage,
      'phone': Phone.text,
      'Address': Addrees.text,
    }).whenComplete(() {
      print('Url : $downloadUrlImage');
      print('dox : $dox');
    });
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text, password: password.text);
  }

  Future<void> ButtonRegister(dynamic context) async {
    if (RegisterKey.currentState!.validate()) {}
    if (password.text.length < 6) {
      icon = Icons.visibility_off_outlined;
      obscureText = false;
    }
    if (password.text.length >= 6) {
      icon = Icons.visibility;
      obscureText = true;

      if (email.text != '' && password.text != '') {
        try {
          showDialog(
              context: context,
              builder: (context) {
                return Center(
                    child: Lottie.asset('assets/lf30_editor_jchf2v7t.json',
                        height: 75, width: 75));
              });
          loginDataBaseForcustomer().then((value) {
            Navigator.pushAndRemoveUntil(
                 context,
                PageTransition(
                    child: const  bottom(),
                    type: PageTransitionType.rightToLeft),
                    (route) => false);

          });
        } on FirebaseAuthException catch (e) {
          snack(context, Icons.error_outline, e.message.toString(), true);
        }
      }
    }
  }

  Future login() async {
    return await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.text, password: password.text);
  }

  Future SingOut() async {
    return await FirebaseAuth.instance.signOut();
  }

  Future sqlite(
      {required dynamic image,
      required dynamic Brand,
      required dynamic descraption,
      required dynamic model,
      required dynamic price}) async {
    myfile.insert('item', <String, dynamic>{
      'image': image,
      "Brand": Brand,
      "descraption": descraption,
      "model": model,
      "price": price,
    });
  }

  void delete({required String Brand}) async {
    myfile.rawUpdate('DELETE FROM item WHERE Brand = ?', [Brand]);
  }

  int currentindex = 0;

  bool loading = false;

  // Color color = Colors.white ;
  // TextEditingController model = TextEditingController();
  // TextEditingController descraption = TextEditingController();

  List<BottomNavigationBarItem> Items = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_filled),
      label: 'home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.car_repair_sharp),
      label: 'Vechiles',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.favorite_outlined),
      label: 'Favourite',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.account_circle_outlined),
      label: 'Account',
    ),
  ];

  void ontap(index) {
    y.jumpToPage(index);
    currentindex = index;
    emit(swtich());
  }

  void iconpassword() {
    if (icon == Icons.remove_red_eye_sharp) {
      icon = Icons.visibility_off_outlined;
      obscureText = false;
    } else {
      icon = Icons.remove_red_eye_sharp;
      obscureText = true;
    }
    emit(changeicon());
  }
  //
  //
  // List <Widget> ListOfTabBar =[
  //   Container(height : MediaQuery.of(context).size.height*.04, alignment: Alignment.center,child: Text('Mercedes' , style: TextStyle(color: Colors.black , fontSize: 15 ,fontFamily: 'Poppins'),)) ,
  //   Container(height : MediaQuery.of(context).size.height*.04, alignment: Alignment.center,child: Text('BMW' , style: TextStyle(color: Colors.black , fontSize: 15 ,fontFamily: 'Poppins'),)) ,
  //   Container(height : MediaQuery.of(context).size.height*.04, alignment: Alignment.center,child: Text('MG' , style: TextStyle(color: Colors.black , fontSize: 15 ,fontFamily: 'Poppins'),)) ,
  //   Container(height : MediaQuery.of(context).size.height*.04, alignment: Alignment.center,child: Text('Jeep' , style: TextStyle(color: Colors.black , fontSize: 15 ,fontFamily: 'Poppins'),)) ,
  //   Container(height : MediaQuery.of(context).size.height*.04, alignment: Alignment.center,child: Text('Rang Rover' , style: TextStyle(color: Colors.black , fontSize: 15 ,fontFamily: 'Poppins'),)) ,
  // ] ;

  Future<void> getImageFromCamera() async {
    imgXfile = await imagePicker.pickImage(source: ImageSource.camera);

    imgXfile;
    emit(changeImageCamera());
  }
  Future<void> getImageFromGallery() async {
    imgXfile = await
         imagePicker
        .pickImage(
        source:
        ImageSource
            .gallery);

     imgXfile;
    emit(changeImageGallery());
  }
}
