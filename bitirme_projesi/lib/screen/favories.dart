import 'package:flutter/material.dart';
import 'package:bitirme_projesi/model/Colors.dart';
import 'package:iconsax/iconsax.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';
import '../bloc/settings_cubit.dart';
import '../db/user.dart';
import '../localizations/localizations.dart';
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

int index = 0;

class TravelProvider extends ChangeNotifier {
  Map<String, List<Travel>> favorilerMap = {};

  void addFavorite(String userId, Travel travel) {
    if (!favorilerMap.containsKey(userId)) {
      favorilerMap[userId] = [];
    }
    if (!favorilerMap[userId]!.contains(travel)) {
      favorilerMap[userId]!.add(travel);
      notifyListeners();
    }
  }

  void removeFavorite(String userId, Travel travel) {
    if (favorilerMap.containsKey(userId)) {
      favorilerMap[userId]!.remove(travel);
      notifyListeners();
    }
  }

  bool isFavorite(String userId, Travel travel) {
    if (favorilerMap.containsKey(userId)) {
      return favorilerMap[userId]!.contains(travel);
    }
    return false;
  }

  List<Travel> getFavorites(String userId) {
    if (favorilerMap.containsKey(userId)) {
      return favorilerMap[userId]!;
    }
    return [];
  }
}

class _FavoriesState extends State<Favories> {
  late String userId;

  @override
  void initState() {
    super.initState();
    final settings = context.read<SettingsCubit>();
    userId = settings.state.userInfo[4].toString();
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.read<SettingsCubit>();
    final travelProvider = Provider.of<TravelProvider>(context);

    final favoriler = travelProvider.getFavorites(userId);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: settings.state.darkMode
            ? Colors.transparent
            : screenColor.themeColor,
        title: Text(
          AppLocalizations.of(context).getTranslate("favorites"),
        ),
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
              child: Center(
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
                      travelProvider.removeFavorite(userId, favoriKonum);
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
