// ignore_for_file: unnecessary_null_comparison, unnecessary_question_mark

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:untitled73/modules/bottom/bottom_pages/account/updataAccount/updata.dart';
import 'package:untitled73/modules/bottom/bottom_pages/account/updataAccount/updataphone.dart';

import '../../../../shared/Bloc/Cubit/Bloc_Cubit.dart';
import '../../../login_Regiester/login_screen.dart';

class account extends StatefulWidget {
  @override
  State<account> createState() => _accountState();
}

class _accountState extends State<account> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<cubitBottom>(context);

    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Emails')
            .where('Email', isEqualTo: bloc.currentuser.currentUser?.email)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData == false) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          } else {
            return Scaffold(
                extendBody: true,
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.indigo.shade700,
                  title: Text(
                    'Profile',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 30),
                  ),
                  elevation: 0,
                ),
                body: SafeArea(
                  child: ListView(children: [
                    Column(children: [
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (context, index) {
                            bloc.email.text =
                                snapshot.data.docs[index]['Email'];
                            bloc.Phone.text =
                                snapshot.data.docs[index]['phone'];
                            bloc.password.text =
                                snapshot.data.docs[index]['Password'];
                            bloc.dox = snapshot.data.docs[index]['id'];
                            bloc.imgXfile = snapshot.data.docs[index]['photo'];
                            return Padding(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Stack(children: [
                                            CircleAvatar(
                                              radius: 70,
                                              backgroundImage: NetworkImage(
                                                  snapshot.data.docs[index]
                                                      ['photo']),
                                              child: Stack(children: [
                                                Positioned(
                                                  right: 0,
                                                  bottom: 0,
                                                  child: IconButton(
                                                    onPressed: () {
                                                      showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors.white,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.only(
                                                                  topRight: Radius
                                                                      .circular(
                                                                          30),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          30))),
                                                          context: context,
                                                          builder:
                                                              (context) =>
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      SizedBox(
                                                                        height: MediaQuery.of(context).size.height *
                                                                            .03,
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.only(left: MediaQuery.of(context).size.width * .04),
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            IconButton(
                                                                              onPressed: () async {
                                                                                bloc.imgXfile = await bloc.imagePicker.pickImage(source: ImageSource.camera);
                                                                                showDialog(
                                                                                    context: context,
                                                                                    builder: (context) {
                                                                                      return Center(
                                                                                        child: CircularProgressIndicator(
                                                                                          color: Colors.indigo,
                                                                                        ),
                                                                                      );
                                                                                    });
                                                                                Reference ref = FirebaseStorage.instance.ref().child('users/${Uri.file(bloc.imgXfile!.path).pathSegments.last}');
                                                                                UploadTask upload = ref.putFile(File(bloc.imgXfile!.path));
                                                                                bloc.NewPhoto = await (await upload).ref.getDownloadURL();
                                                                                print(bloc.NewPhoto);
                                                                                await bloc.currentuser.currentUser!.updatePhotoURL(bloc.NewPhoto);
                                                                                FirebaseFirestore.instance.collection('Emails').doc(snapshot.data.docs[index]['id']).update(<String, dynamic>{
                                                                                  'photo': bloc.NewPhoto
                                                                                }).then((value) {
                                                                                  print(bloc.NewPhoto);
                                                                                });
                                                                                Navigator.pop(context);
                                                                              },
                                                                              icon: Image.asset(
                                                                                'assets/camera (1).png',
                                                                                height: MediaQuery.of(context).size.height * .5,
                                                                              ),
                                                                              iconSize: 50,
                                                                            ),
                                                                            SizedBox(
                                                                              width: MediaQuery.of(context).size.width * .03,
                                                                            ),
                                                                            IconButton(
                                                                              onPressed: () async {
                                                                                bloc.imgXfile = await bloc.imagePicker.pickImage(source: ImageSource.gallery);
                                                                                showDialog(
                                                                                    context: context,
                                                                                    builder: (context) {
                                                                                      return Center(
                                                                                        child: CircularProgressIndicator(
                                                                                          color: Colors.indigo,
                                                                                        ),
                                                                                      );
                                                                                    });
                                                                                Reference ref = FirebaseStorage.instance.ref().child('users/${Uri.file(bloc.imgXfile!.path).pathSegments.last}');
                                                                                UploadTask upload = ref.putFile(File(bloc.imgXfile!.path));
                                                                                bloc.NewPhoto = await (await upload).ref.getDownloadURL();
                                                                                print(bloc.NewPhoto);
                                                                                bloc.currentuser.currentUser!.updatePhotoURL(bloc.NewPhoto);
                                                                                FirebaseFirestore.instance.collection('Emails').doc(bloc.dox).update(<String, dynamic>{
                                                                                  'photo': bloc.NewPhoto
                                                                                });
                                                                                Navigator.pop(context);
                                                                              },
                                                                              icon: Image.asset(
                                                                                'assets/photo.png',
                                                                                height: MediaQuery.of(context).size.height * .5,
                                                                              ),
                                                                              iconSize: 50,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height: MediaQuery.of(context).size.height *
                                                                            .02,
                                                                      ),
                                                                      Container(
                                                                        width: MediaQuery.of(context).size.width *
                                                                            .9,
                                                                        height: MediaQuery.of(context).size.height *
                                                                            .07,
                                                                        child:
                                                                            ElevatedButton(
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            'Cancel',
                                                                            style:
                                                                                TextStyle(fontSize: 25, fontFamily: 'poppins'),
                                                                          ),
                                                                          style: ButtonStyle(
                                                                              backgroundColor: MaterialStateProperty.all(Colors.black26),
                                                                              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            20,
                                                                      ),
                                                                    ],
                                                                  ));
                                                    },
                                                    icon: Icon(
                                                      Icons
                                                          .photo_camera_outlined,
                                                      color: Colors.white,
                                                      size: 40,
                                                    ),
                                                    iconSize: 50,
                                                  ),
                                                ),
                                              ]),
                                            ),
                                          ]),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      enabled: false,
                                      decoration: InputDecoration(
                                          labelText: 'Name',
                                          labelStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15))),
                                      controller: bloc.email,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                child: updataphone(
                                                  data: snapshot.data
                                                      .docs[index]['phone'],
                                                  dox: snapshot.data.docs[index]
                                                      ['id'],
                                                ),
                                                type: PageTransitionType
                                                    .rightToLeft));
                                      },
                                      decoration: InputDecoration(
                                          labelText: 'Phone',
                                          labelStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15))),
                                      controller: bloc.Phone,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                child: updata(
                                                  data: snapshot.data
                                                      .docs[index]['Password'],
                                                  dox: snapshot.data.docs[index]
                                                      ['id'],
                                                ),
                                                type: PageTransitionType
                                                    .rightToLeft));
                                      },
                                      decoration: InputDecoration(
                                          labelText: 'Password',
                                          labelStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15))),
                                      controller: bloc.password,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          FirebaseAuth.instance
                                              .signOut()
                                              .then((value) {
                                            Navigator.pushReplacement(
                                                context,
                                                PageTransition(
                                                    child: loginByCustomer(),
                                                    type: PageTransitionType
                                                        .bottomToTop));
                                          });
                                        },
                                        child: Text('Logout',
                                            style: TextStyle(
                                                color: Colors.red.shade700,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          })
                    ]),
                  ]),
                ));
          }
        });
  }
}
