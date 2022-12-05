import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final categoriesList = [
    'Beach',
    'Camp',
    'Mountain',
    'Forest',
  ];
  int selectItem = 0;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final color_Theme = Color.fromARGB(27, 24, 43, 255);
    final color_Transparent = Colors.transparent;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 50,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectItem = index;
                    });
                  },
                  child: Container(
                    child: Card(
                      color: selectItem == index
                          ? Color.fromARGB(255, 52, 112, 161)
                          : color_Theme,
                      // ignore: sort_child_properties_last
                      child: SizedBox(
                        width: 90,
                        child: Center(
                          child: Text(
                            categoriesList[index],
                            style: selectItem == index
                                ? TextStyle(color: Colors.white, fontSize: 15)
                                : TextStyle(color: Colors.grey.shade700),
                          ),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
            separatorBuilder: (_, index) => SizedBox(
                  width: 5,
                ),
            itemCount: categoriesList.length),
      ),
    );
  }
}
// result = list.where((listItem)=>listItem.type == 'Camp')
