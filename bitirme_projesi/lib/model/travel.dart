import 'package:flutter/material.dart';

class Travel {
  String name;
  String location;
  String image;
  IconData icon;
  String rate;
  String type;

  Travel(this.image, this.name, this.rate, this.icon, this.location, this.type);
}

class locationList {
  static final List<Travel> travel = [
    Travel('images/mosque.jpg', 'Mosquse', "4.9", Icons.flag, 'Mısır', 'Camp'),
    Travel('images/yerebatan-sarnici2.jpg', 'Mosquse', "4.9", Icons.flag,
        'Mısır', 'Camp'),
    Travel('images/lhasa.jpg', 'Hasa', "4.9", Icons.flag, 'Mısır', 'Camp'),
  ];
}
