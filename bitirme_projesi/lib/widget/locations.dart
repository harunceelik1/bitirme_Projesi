// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bitirme_projesi/db/user.dart';
import 'package:bitirme_projesi/model/Colors.dart';
import 'package:bitirme_projesi/model/travel.dart';
import 'package:bitirme_projesi/screen/favories.dart';
import 'package:bitirme_projesi/screen/heroScreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class Locations extends StatelessWidget {
  final Travel travel;
  final User user;
  Locations(this.travel, this.user);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final double containerHeight = 300;
    final double circleYukseklik = 50;

    final double top = containerHeight - circleYukseklik / 2;

    return LayoutBuilder(
      builder: (context, contraints) => Container(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 310,
              width: width * 0.8,
              decoration: BoxDecoration(
                  color: screenColor.cardsColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => HeroScreen(
                                  travel: travel,
                                  user: user,
                                )),
                          ),
                        );
                      },
                      child: Hero(
                        tag: travel.image,
                        child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: new DecorationImage(
                                  image: AssetImage(travel.image),
                                  fit: BoxFit.cover),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(travel.name),
                            Row(
                              children: [
                                Text(travel.rate),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 14,
                                  color: screenColor.themeColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              travel.icon,
                              size: 14,
                              color: screenColor.themeColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              travel.location,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  ?.copyWith(
                                      color: screenColor.grey,
                                      fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ],
                    )),
                  )
                ],
              ),
            ),
            Positioned(
              top: top,
              right: 20,
              child: Center(
                child: Consumer<TravelProvider>(
                  builder: (context, travelProvider, _) {
                    final isFavorite = travelProvider.isFavorite(travel);
                    return CircleAvatar(
                      backgroundColor: screenColor.themeColor,
                      radius: circleYukseklik / 2,
                      child: IconButton(
                        onPressed: () {
                          if (isFavorite) {
                            travelProvider.removeFavorite(travel);
                          } else {
                            travelProvider.addFavorite(travel);
                          }
                        },
                        icon: Icon(
                          isFavorite ? Iconsax.heart5 : Iconsax.heart,
                        ),
                        color: screenColor.white,
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
