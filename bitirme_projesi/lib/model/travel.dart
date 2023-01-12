import 'package:flutter/material.dart';

class Travel {
  String name;
  String location;
  String image;
  IconData icon;
  String rate;
  String type;
  String descp;
  String price;

  Travel(this.image, this.name, this.rate, this.icon, this.location, this.type,
      this.descp, this.price);
}

class locationList {
  static final List<Travel> travel = [
    Travel(
      'images/mosque.jpg',
      'II. Hasan Mosque',
      "4.9",
      Icons.flag,
      'Fas',
      'History',
      'Açıklama gelmesi gerekiyor bu kısıma.Açıklama gelmesi gerekiyor bu kısıma.Açıklama gelmesi gerekiyor bu kısıma.',
      '\$ 410',
    ),
    Travel(
      'images/turk_caicos_ada.jpg',
      'Grace Bay',
      "5",
      Icons.flag,
      'Turks and Caicos Island',
      'Beach',
      'Açıklama gelmesi gerekiyor bu kısıma.',
      '\$ 410',
    ),
    Travel(
      'images/lhasa.jpg',
      'LHasa',
      "4.7",
      Icons.flag,
      'China',
      'History',
      'Açıklama gelmesi gerekiyor bu kısıma.',
      '\$ 510',
    ),
    Travel(
      'images/yerebatan-sarnici2.jpg',
      'Yerebatan Sarnıcı',
      "4.5",
      Icons.flag,
      'Türkiye',
      'History',
      'Açıklama gelmesi gerekiyor bu kısıma.',
      '\$ 560',
    ),
  ];
}
