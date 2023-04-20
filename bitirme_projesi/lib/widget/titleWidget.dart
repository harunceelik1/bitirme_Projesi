import 'package:flutter/material.dart';

class titleWidget extends StatelessWidget {
  const titleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = "Where do you want to be ?";

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
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey.shade500, fontWeight: FontWeight.w200),
              ),
              Wrap(children: [
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(fontWeight: FontWeight.w400),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
