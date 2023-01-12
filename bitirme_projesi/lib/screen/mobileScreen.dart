import 'package:bitirme_projesi/widget/category.dart';
import 'package:bitirme_projesi/widget/inputSearch.dart';
import 'package:bitirme_projesi/widget/list.dart';
import 'package:bitirme_projesi/widget/titleWidget.dart';
import 'package:flutter/material.dart';

class mobileScreen extends StatelessWidget {
  const mobileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Başlık Yazı Kısmı
        titleWidget(),
        SizedBox(
          height: 35,
        ),
        inputSearch(),
        SizedBox(
          height: 15,
        ),
        // Kategoriler kısmı. Listview ile yapıldı
        Categories(),
        SizedBox(
          height: 15,
        ),
        Listeleme(),
      ],
    );
  }
}
