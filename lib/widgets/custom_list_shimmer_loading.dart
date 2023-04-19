import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_loading_widget.dart';

Widget buildListShimmer(BuildContext context) =>
    InkWell(
      child: Card(
        elevation: 3,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          //<-- SEE HERE
          side: BorderSide(
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child:Container(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //-------------display image,name and address------------
              Row(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      width: double.infinity,
                      //height: 70,
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(15.0),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0xffDDDDDD),
                              //New
                              blurRadius: 6.0,
                              spreadRadius: 2.0,
                              offset: Offset(0.0, 0.0))
                        ],
                      ),
                      child: ClipRRect(
                          borderRadius:
                          BorderRadius.circular(15),
                          child: CustomLoadingWidget.rectangular(height: 60, width: 60)
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Container(
                      margin:
                      const EdgeInsets.only(left: 5),
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
                        children: [
                          CustomLoadingWidget.rectangular(
                            height: 13,
                            width: MediaQuery.of(context).size.width * 0.5,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomLoadingWidget.rectangular(
                            height: 14,
                            width: MediaQuery.of(context).size.width * 0.4,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomLoadingWidget.rectangular(
                            height: 14,
                            width: MediaQuery.of(context).size.width * 0.3,
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
              //----------display status and share option
              Container(
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: CustomLoadingWidget.rectangular(
                          height: 16,
                          width: MediaQuery.of(context).size.width * 0.3,
                        )
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: CustomLoadingWidget.rectangular(
                          height: 14,
                          width: MediaQuery.of(context).size.width * 0.3,
                        )
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );