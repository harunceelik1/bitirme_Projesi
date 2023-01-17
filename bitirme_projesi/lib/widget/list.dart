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
        child: searchList.length > 0
            ? ListView.separated(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: searchList.length,
                itemBuilder: ((context, index) => Locations(searchList[index])),
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  width: 15,
                ),
              )
            : Text("Boş"));
  }
}
