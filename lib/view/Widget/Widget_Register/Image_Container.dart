import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../shared/Bloc/Cubit/Bloc_Cubit.dart';
import '../../../shared/Bloc/Cubit/States.dart';

class ContaionerImage extends StatelessWidget {
  const ContaionerImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<cubitBottom>(context);
    return  Container(
      alignment: Alignment.center,
      child: Stack(children: [
        Positioned(
          child: BlocBuilder<cubitBottom , bottomNavgator>(
            builder:(context, state) {
              return Container(
                width: MediaQuery.of(context).size.width * .5,
                height: MediaQuery.of(context).size.height * .25,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/user (1).png'))),
                child: bloc.imgXfile == null
                    ? Image.asset('assets/user (1).png')
                    : CircleAvatar(
                    radius: 120,
                    backgroundColor: Colors.white,
                    backgroundImage: bloc.imgXfile == null
                        ? null
                        : FileImage(File(bloc.imgXfile!.path)),
                    child: null),
              ) ;
            },
          ),
        ),
        Positioned(
            bottom: MediaQuery.of(context).size.height * .0,
            right: MediaQuery.of(context).size.width * .0,
            child: Container(
              alignment: Alignment.center,
              width: 55,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30))),
                      context: context,
                      builder: (context) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context)
                                .size
                                .height *
                                .03,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context)
                                    .size
                                    .width *
                                    .04),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    bloc.getImageFromCamera() ;
                                  },
                                  icon: Image.asset(
                                    'assets/camera (1).png',
                                    height:
                                    MediaQuery.of(context)
                                        .size
                                        .height *
                                        .5,
                                  ),
                                  iconSize: 50,
                                ),
                                SizedBox(
                                  width:
                                  MediaQuery.of(context)
                                      .size
                                      .width *
                                      .03,
                                ),
                                IconButton(
                                  onPressed: () async {
                                    bloc.getImageFromGallery() ;
                                  },
                                  icon: Image.asset(
                                    'assets/photo.png',
                                    height:
                                    MediaQuery.of(context)
                                        .size
                                        .height *
                                        .5,
                                  ),
                                  iconSize: 50,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context)
                                .size
                                .height *
                                .02,
                          ),
                          Container(
                            width: MediaQuery.of(context)
                                .size
                                .width *
                                .9,
                            height: MediaQuery.of(context)
                                .size
                                .height *
                                .07,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty
                                      .all(
                                      Colors.black26),
                                  shape: MaterialStateProperty
                                      .all(RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                          15)))),
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'poppins'),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ));
                },
                icon: const Icon(
                  Icons.photo_camera_outlined,
                  color: Colors.white,
                  size: 40,
                ),
                iconSize: 50,
              ),
            )),
      ]),
    );
  }
}




