import 'package:bitirme_projesi/model/travel.dart';
import 'package:bitirme_projesi/widget/locations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class Listeleme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.9,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: locationList.travel.length,
        itemBuilder: ((context, index) =>
            Locations(locationList.travel[index])),
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          width: 15,
        ),
      ),
    );
  }
}
