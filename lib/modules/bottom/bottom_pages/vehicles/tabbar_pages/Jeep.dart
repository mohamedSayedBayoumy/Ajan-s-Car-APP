import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../Pages/current_Item.dart';

class Jeep extends StatefulWidget {
  @override
  State<Jeep> createState() => _JeepState();
}

class _JeepState extends State<Jeep> {
  Color x = Colors.white;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection('Mercedes').get(),
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
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .001,
                          left: MediaQuery.of(context).size.width * .01,
                        ),
                        child: Column(children: [
                          Container(
                              height: MediaQuery.of(context).size.height * .2,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                .001,
                                      ),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.height *
                                                .148,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .150,
                                        decoration: BoxDecoration(
                                            color: Colors.black26,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: null,
                                      )),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        .014,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .034,
                                      ),
                                      CostmContainer(),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .02,
                                      ),
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .57,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .11,
                                          decoration: BoxDecoration(
                                              color: Colors.black26,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Text('')),
                                    ],
                                  ),
                                ],
                              )),
                        ])));
              },
            );
          } else {
            return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .02),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => currentItem(
                                  Brand: snapshot.data.docs[index]['Brand'],
                                  descraption: snapshot.data.docs[index]
                                      ['descraption'],
                                  model: snapshot.data.docs[index]['model'],
                                  image: snapshot.data.docs[index]['photo'],
                                  price: snapshot.data.docs[index]['price'],
                                )));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * .001,
                            left: MediaQuery.of(context).size.width * .01),
                        child: Column(
                          children: [
                            Container(
                                height: MediaQuery.of(context).size.height * .2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.height *
                                              .148,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .5,
                                      child: Hero(
                                        tag: snapshot.data.docs[index]['photo'],
                                        child: Image.network(
                                            snapshot.data.docs[index]['photo']),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .014,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .050,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                                child: Text(
                                              snapshot.data.docs[index]
                                                  ["Brand"],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ],
                                        ),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .60,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .09,
                                            child: Text(
                                              snapshot.data.docs[index]
                                                  ["descraption"],
                                              maxLines: 5,
                                              overflow: TextOverflow.fade,
                                            )),
                                      ],
                                    ),
                                  ],
                                )),
                            Container(
                              width: MediaQuery.of(context).size.width * .80,
                              height:
                                  MediaQuery.of(context).size.height * .0003,
                              color: Colors.grey.shade700,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ));
          }
        });
  }
}

Widget CostmContainer() => Container(
    width: 220,
    height: 10,
    decoration: BoxDecoration(
        color: Colors.black26, borderRadius: BorderRadius.circular(15)),
    child: Text(''));
