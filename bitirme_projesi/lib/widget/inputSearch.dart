import 'package:bitirme_projesi/model/travel.dart';
import 'package:flutter/material.dart';

class inputSearch extends StatefulWidget {
  const inputSearch({
    Key? key,
  }) : super(key: key);

  @override
  State<inputSearch> createState() => _inputSearchState();
}

class _inputSearchState extends State<inputSearch> {
  @override
  Widget build(BuildContext context) {
    final color_Theme = Color.fromARGB(27, 24, 43, 255);
    final color_Transparent = Colors.transparent;
    final inputText = 'Search';
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    TextEditingController controller = TextEditingController();

    List<Travel> searchList = travel
        .where((element) =>
            element.name.toLowerCase().contains(text.toLowerCase()))
        .toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 6,
            child: Container(
              width: width * 0.8,
              child: TextFormField(
                controller: controller,
                onFieldSubmitted: (covariant) {
                  setState(() {
                    text = covariant;
                  });
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(2),
                    hintText: inputText,
                    hintStyle:
                        TextStyle(color: Colors.grey.shade700, fontSize: 14),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none),
                    fillColor: color_Theme,
                    filled: true,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            // color: Colors.red,
                            border: Border(
                                right:
                                    BorderSide(color: Colors.grey.shade700))),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Image.asset("images/search16.png"),
                        ),
                      ),
                    )),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            flex: 1,
            child: Card(
              color: Color.fromARGB(90, 72, 87, 250),
              child: CircleAvatar(
                backgroundColor: color_Transparent,
                radius: 25,
                child: Icon(
                  Icons.location_pin,
                  color: Colors.white,
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ],
      ),
    );
  }
}
