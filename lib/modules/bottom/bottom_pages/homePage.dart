import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';
import 'package:untitled73/modules/Pages/currentitemoffer.dart';
import '../../../shared/Bloc/Cubit/Bloc_Cubit.dart';
import '../../Pages/current_Item.dart';
import '../../search/Search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<cubitBottom>(context);

    return Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          backgroundColor: Colors.indigo.shade700,
          title: Text('Home'),
          actions: [
            IconButton(onPressed: ()=>Navigator.push(context, PageTransition(
                child: const search(),
                type: PageTransitionType.rightToLeft
            )),
                icon: Icon(Icons.search))
          ],

        ),
        body: SafeArea(
            child: ListView(children: [
          Container(
            width: 800,
            height: 1000,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '• Mercedes',
                        style:
                            TextStyle(fontFamily: 'fredokaOne', fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: FutureBuilder(
                      future: FirebaseFirestore.instance
                          .collection('Mercedes')
                          .get(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData == false) {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Shimmer.fromColors(
                                baseColor: Colors.grey.shade500,
                                highlightColor: Colors.grey.shade100,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              .01),
                                  child: Row(children: [
                                    Column(children: [
                                      GestureDetector(
                                        onTap: () {
                                          // Navigator.push(context, PageTransition(child: products(doxShopping :doxShopping  ,dox:dox, value: data[index]["id"].toString()) , type: PageTransitionType.topToBottom)) ;
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .345,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .105,
                                          decoration: BoxDecoration(
                                            color: Colors.black38,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10)),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .344,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .04,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(12),
                                                bottomLeft:
                                                    Radius.circular(12)),
                                            color: Colors.grey.shade400),
                                        child: Text(
                                          '',
                                        ),
                                      )
                                    ]),
                                  ]),
                                ),
                              );
                            },
                          );
                        } else {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * .02),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.docs.length,
                              itemBuilder: (context, index) {
                                dynamic image =
                                    snapshot.data.docs[index]['photo'];
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              .01),
                                  child: Row(children: [
                                    Column(children: [
                                      GestureDetector(
                                        onTap: () async {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      currentItem(
                                                        Brand: snapshot.data
                                                                .docs[index]
                                                            ['Brand'],
                                                        descraption: snapshot
                                                                .data
                                                                .docs[index]
                                                            ['descraption'],
                                                        model: snapshot.data
                                                                .docs[index]
                                                            ['model'],
                                                        image: snapshot.data
                                                                .docs[index]
                                                            ['photo'],
                                                        price: snapshot.data
                                                                .docs[index]
                                                            ['price'],
                                                      )));
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .345,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .105,
                                              decoration: BoxDecoration(
                                                // color: Colors.redAccent,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(50),
                                                    topRight:
                                                        Radius.circular(10)),
                                              ),
                                              child: Hero(
                                                  tag: NetworkImage(
                                                      image.toString()),
                                                  child: Image.network(snapshot
                                                      .data
                                                      .docs[index]['photo'])),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .344,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .04,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomRight:
                                                              Radius.circular(
                                                                  12),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  12)),
                                                  color: Colors.grey),
                                              child: Text(
                                                '${snapshot.data.docs[index]['Brand']}',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white,
                                                    fontFamily: 'Poppins'),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ]),
                                  ]),
                                );
                              },
                            ),
                          );
                        }
                      }),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '• MG',
                        style:
                            TextStyle(fontFamily: 'fredokaOne', fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: FutureBuilder(
                      future: FirebaseFirestore.instance.collection('MG').get(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData == false) {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Shimmer.fromColors(
                                baseColor: Colors.grey.shade500,
                                highlightColor: Colors.grey.shade100,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              .01),
                                  child: Row(children: [
                                    Column(children: [
                                      GestureDetector(
                                        onTap: () {
                                          // Navigator.push(context, PageTransition(child: products(doxShopping :doxShopping  ,dox:dox, value: data[index]["id"].toString()) , type: PageTransitionType.topToBottom)) ;
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .345,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .105,
                                          decoration: BoxDecoration(
                                            color: Colors.black38,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10)),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .344,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .04,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(12),
                                                bottomLeft:
                                                    Radius.circular(12)),
                                            color: Colors.grey.shade400),
                                        child: Text(
                                          '',
                                        ),
                                      )
                                    ]),
                                  ]),
                                ),
                              );
                            },
                          );
                        } else {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * .02),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.docs.length,
                              itemBuilder: (context, index) {
                                dynamic image =
                                    snapshot.data.docs[index]['photo'];
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              .01),
                                  child: Row(children: [
                                    Column(children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              PageTransition(
                                                  child: currentItem(
                                                    Brand: snapshot.data
                                                        .docs[index]['Brand'],
                                                    descraption: snapshot
                                                            .data.docs[index]
                                                        ['descraption'],
                                                    model: snapshot.data
                                                        .docs[index]['model'],
                                                    image: snapshot.data
                                                        .docs[index]['photo'],
                                                    price: snapshot.data
                                                        .docs[index]['price'],
                                                  ),
                                                  type: PageTransitionType
                                                      .topToBottom));
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .345,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .105,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20)),
                                              ),
                                              child: Hero(
                                                  tag: NetworkImage(
                                                      image.toString()),
                                                  child: Image.network(snapshot
                                                      .data
                                                      .docs[index]['photo'])),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .335,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .04,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomRight:
                                                              Radius.circular(
                                                                  12),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  12)),
                                                  color: Colors.grey),
                                              child: Text(
                                                '${snapshot.data.docs[index]['Brand']}',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white,
                                                    fontFamily: 'Poppins'),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ]),
                                  ]),
                                );
                              },
                            ),
                          );
                        }
                      }),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '• BMW',
                        style:
                            TextStyle(fontFamily: 'fredokaOne', fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: FutureBuilder(
                      future:
                          FirebaseFirestore.instance.collection('BMW').get(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData == false) {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Shimmer.fromColors(
                                baseColor: Colors.grey.shade500,
                                highlightColor: Colors.grey.shade100,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              .01),
                                  child: Row(children: [
                                    Column(children: [
                                      GestureDetector(
                                        onTap: () {
                                          // Navigator.push(context, PageTransition(child: products(doxShopping :doxShopping  ,dox:dox, value: data[index]["id"].toString()) , type: PageTransitionType.topToBottom)) ;
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .345,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .105,
                                          decoration: BoxDecoration(
                                            color: Colors.black38,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10)),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .344,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .04,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(12),
                                                bottomLeft:
                                                    Radius.circular(12)),
                                            color: Colors.grey.shade400),
                                        child: Text(
                                          '',
                                        ),
                                      )
                                    ]),
                                  ]),
                                ),
                              );
                            },
                          );
                        } else {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * .02),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.docs.length,
                              itemBuilder: (context, index) {
                                dynamic image =
                                    snapshot.data.docs[index]['photo'];
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              .01),
                                  child: Row(children: [
                                    Column(children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              PageTransition(
                                                  child: currentItem(
                                                    Brand: snapshot.data
                                                        .docs[index]['Brand'],
                                                    descraption: snapshot
                                                            .data.docs[index]
                                                        ['descraption'],
                                                    model: snapshot.data
                                                        .docs[index]['model'],
                                                    image: snapshot.data
                                                        .docs[index]['photo'],
                                                    price: snapshot.data
                                                        .docs[index]['price'],
                                                  ),
                                                  type: PageTransitionType
                                                      .topToBottom));
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .345,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .105,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          topRight:
                                                              Radius.circular(
                                                                  10)),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          image.toString()))),
                                              // child:
                                              // Hero(tag: NetworkImage(snapshot.data.docs[index]['photo']), child: Image.network(snapshot.data.docs[index]['photo'])) ,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .3313,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .04,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomRight:
                                                              Radius.circular(
                                                                  12),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  12)),
                                                  color: Colors.grey),
                                              child: Text(
                                                '${snapshot.data.docs[index]['Brand']}',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white,
                                                    fontFamily: 'Poppins'),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ]),
                                  ]),
                                );
                              },
                            ),
                          );
                        }
                      }),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '• Offers',
                        style:
                            TextStyle(fontFamily: 'fredokaOne', fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: FutureBuilder(
                      future:
                          FirebaseFirestore.instance.collection('Offer').get(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData == false) {
                          return ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Shimmer.fromColors(
                                baseColor: Colors.grey.shade500,
                                highlightColor: Colors.grey.shade100,
                                child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                .05,
                                        vertical:
                                            MediaQuery.of(context).size.height *
                                                .01),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .95,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .20,
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade500,
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .95,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .20,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: Colors.redAccent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25)),
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              .10),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: Colors.redAccent,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )),
                              );
                            },
                          );
                        } else {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * .02,
                                vertical:
                                    MediaQuery.of(context).size.height * .01),
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: snapshot.data.docs.length,
                              itemBuilder: (context, index) {
                                dynamic image =
                                    snapshot.data.docs[index]['photo'];
                                return snapshot.data.docs[index]['offer'] == ''
                                    ? Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .01),
                                        child: Column(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .95,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .20,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          snapshot.data
                                                                  .docs[index]
                                                              ['photo']))),
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .95,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            .20,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        color: Colors.black38,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25)),
                                                    child: Container(
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal:
                                                                MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    .10),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color: Colors.white,
                                                        ),
                                                        child: Text(
                                                          'Offer have been Opt Out',
                                                          style: TextStyle(
                                                              fontSize: 25),
                                                        )),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ))
                                    : Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .01,
                                            vertical: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .02),
                                        child: Column(
                                          children: [
                                            Stack(children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      PageTransition(
                                                          child:
                                                              currentItemoffer(
                                                            Brand: snapshot.data
                                                                    .docs[index]
                                                                ['Brand'],
                                                            descraption: snapshot
                                                                    .data
                                                                    .docs[index]
                                                                ['descraption'],
                                                            model: snapshot.data
                                                                    .docs[index]
                                                                ['model'],
                                                            image: snapshot.data
                                                                    .docs[index]
                                                                ['photo'],
                                                            price: snapshot.data
                                                                    .docs[index]
                                                                ['price'],
                                                            offer: snapshot.data
                                                                    .docs[index]
                                                                ['offer'],
                                                          ),
                                                          type:
                                                              PageTransitionType
                                                                  .topToBottom));
                                                },
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .95,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .20,
                                                  alignment: Alignment.topLeft,
                                                  child: Hero(
                                                      tag: Image.network(
                                                          image.toString()),
                                                      child: Image.network(
                                                          snapshot.data
                                                                  .docs[index]
                                                              ['photo'])),
                                                ),
                                              ),
                                              Positioned(
                                                left: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .35,
                                                child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .95,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            .07,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        color: Colors
                                                            .redAccent.shade700,
                                                        shape: BoxShape.circle),
                                                    child: Text(
                                                      snapshot.data.docs[index]
                                                          ['offer'],
                                                      style: TextStyle(
                                                          fontSize: 25,
                                                          color: Colors.white),
                                                    )),
                                              ),
                                            ])
                                          ],
                                        ));
                              },
                            ),
                          );
                        }
                      }),
                ),
              ],
            ),
          )
        ])));
  }
}
