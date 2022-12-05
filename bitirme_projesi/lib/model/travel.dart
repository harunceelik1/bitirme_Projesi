import 'package:flutter/material.dart';

class Travel {
  String name;
  String location;
  String image;
  IconData icon;
  String rate;
  String type;

  Travel(this.image, this.name, this.rate, this.icon, this.location, this.type);

  static List<Travel> generateLocation() {
    return [
      Travel(
          'images/mosque.jpg', 'Mosquse', "4.9", Icons.flag, 'Mısırsa', 'Camp'),
      Travel('images/lhasa.jpg', 'Mosquse', "4.9", Icons.flag, 'Türkiya',
          'Mountain'),
      Travel('images/mosque.jpg', 'Mosquse', "4.9", Icons.flag, 'Mısırsa',
          'Beach'),
    ];
  }
}
