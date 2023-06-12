import 'package:flutter/material.dart';
import 'package:bitirme_projesi/model/Colors.dart';
import 'package:iconsax/iconsax.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

import '../db/user.dart';
import '../model/travel.dart';

import 'package:flutter/material.dart';
import 'package:bitirme_projesi/model/Colors.dart';
import 'package:provider/provider.dart';

import '../model/travel.dart';
import '../widget/bottomNav.dart';

class Favories extends StatefulWidget {
  Favories({Key? key});

  @override
  State<Favories> createState() => _FavoriesState();
}

class TravelProvider extends ChangeNotifier {
  List<Travel> favoriler = []; // Favori konumları tutan liste
  int index = 0;

  void indexAl(int index1) {
    print("indexAl");
    print(index1);

    setState(() {
      index = index1;
    });
  }

  void addFavorite(Travel travel) {
    if (!favoriler.contains(travel)) {
      favoriler.add(travel);
      notifyListeners();
    }
  }

  void removeFavorite(Travel travel) {
    favoriler.remove(travel);
    notifyListeners();
  }

  bool isFavorite(Travel travel) {
    return favoriler.contains(travel);
  }
}

class _FavoriesState extends State<Favories> {
  @override
  Widget build(BuildContext context) {
    final travelProvider = Provider.of<TravelProvider>(context);
    final favoriler = travelProvider.favoriler;

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorilere Ekle'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: favoriler.length,
          itemBuilder: (context, index) {
            Travel favoriKonum = favoriler[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    favoriKonum.image,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  favoriKonum.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(favoriKonum.rate),
                        SizedBox(width: 5),
                        Icon(
                          Iconsax.star,
                          size: 14,
                          color: screenColor.themeColor,
                        ),
                      ],
                    ),
                    Text(favoriKonum.location),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(
                    Iconsax.trash,
                  ),
                  onPressed: () {
                    travelProvider.removeFavorite(favoriKonum);
                  },
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: bottomNavigation(
        changeIndex: indexAl,
      ),
    );
  }
}
