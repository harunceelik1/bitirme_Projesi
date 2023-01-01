import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: (Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Column(
            children: [
              Text("Media Query Boyut : \n\n ${size.width} X ${size.height}"),
              // Media Query'de uygulama boyutu alınıyor.
              Text("Media Query Boyut : \n\n ${orientation.name}"),
              //Layout Builder ise widgetların boyutunu.
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Expanded(
                      child: LayoutBuilder(
                    builder: (context, constraints) => Text(
                        "${constraints.maxWidth} x ${constraints.maxHeight}"),
                  )),
                  Expanded(
                      child: OrientationBuilder(
                    builder: (context, constraints) =>
                        Text("${orientation.name} "),
                  )),
                ],
              ),
              SizedBox(
                height: 50,
              ),

              Container(
                color: Colors.grey,
                height: 30,
                child: Row(
                  children: [
                    Expanded(
                        child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor:
                          0.5, //Expanded ile container ikiye bölündü o bölünen kısımlardanda oran ile bölüm yapıldı fractional sayesidne
                      child: Container(color: Colors.red),
                    )),
                    Expanded(
                        child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: 0.4,
                      child: GestureDetector(
                        onTap: () => {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Tıklandı"),
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.only(
                                left: 15, right: 15, bottom: size.height - 50),
                          ))
                        },
                        child: Container(
                          child: Text("Tıklayınız."),
                          color: Colors.orange,
                          height: double.infinity,
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
