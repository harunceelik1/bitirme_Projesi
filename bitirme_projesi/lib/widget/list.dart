import 'package:bitirme_projesi/model/travel.dart';
import 'package:bitirme_projesi/widget/inputSearch.dart';
import 'package:bitirme_projesi/widget/locations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

List<Travel> display_list = travel;

class Listeleme extends StatefulWidget {
  @override
  State<Listeleme> createState() => _ListelemeState();
}

class _ListelemeState extends State<Listeleme> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // print(locationList.travel[1].type);

    return Container(
      width: width * 0.9,
      height: 325,
      // color: Colors.red,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: display_list.length,
        itemBuilder: ((context, index) => Locations(display_list[index])),
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          width: 15,
        ),
      ),
    );
  }
}
