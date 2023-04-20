import 'dart:developer';

import 'package:bitirme_projesi/model/Colors.dart';
import 'package:bitirme_projesi/model/travel.dart';
import 'package:bitirme_projesi/widget/list.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class Categories extends StatefulWidget {
  Function filterTravel;
  Categories({Key? mykey, required this.filterTravel}) : super(key: mykey);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> tags = [];
  int tag = -1;
  List<String> options = [
    "Beach",
    "Camp",
    "Mountain",
    "History",
  ];

  List<Map<String, dynamic>> categoriesList = [
    {"id": 'Beach'},
    {"id": 'Camp'},
    {"id": 'Mountain'},
    {"id": 'History'},
  ];
  int selectItem = -1;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Container(
            height: 50,
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectItem = index;
                          var deneme = categoriesList[index]["id"];
                          print(deneme);
                        });
                        widget.filterTravel(categoriesList[index]["id"], false);
                      },
                      child: Container(
                        child: Card(
                          color: selectItem == index
                              ? screenColor.themeColor
                              : screenColor.unselectColor,
                          // ignore: sort_child_properties_last
                          child: SizedBox(
                            width: 90,
                            child: Center(
                              child: Text(
                                categoriesList[index]["id"],
                                style: selectItem == index
                                    ? TextStyle(
                                        color: screenColor.white, fontSize: 15)
                                    : TextStyle(color: Colors.grey.shade700),
                              ),
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                separatorBuilder: (_, index) => SizedBox(
                      width: 5,
                    ),
                itemCount: categoriesList.length),
          ),
          // ChipsChoice<String>.multiple(
          //   value: tags,
          //   onChanged: (val) => setState(() => tags = val),
          //   choiceItems: C2Choice.listFrom(
          //     source: options,
          //     value: (i, v) => v,
          //     label: (i, v) => v,
          //   ),
          // ),
        ],
      ),
    );
  }
}
// result = list.where((listItem)=>listItem.type == 'Camp')
