import 'package:flutter/material.dart';

class titleWidget extends StatelessWidget {
  const titleWidget({
    Key? key,
    required this.width,
    required this.title,
  }) : super(key: key);

  final double width;
  final String title;

  @override
  Widget build(BuildContext context) {
    final color_Theme = Color.fromARGB(27, 24, 43, 255);
    final color_Transparent = Colors.transparent;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: LayoutBuilder(
        builder: (context, constraint) => Container(
          width: constraint.maxWidth,
          // color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi, Vanessa",
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                    color: Colors.grey.shade500, fontWeight: FontWeight.w200),
              ),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ),
    );
  }
}
