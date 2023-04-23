import 'package:bitirme_projesi/model/Colors.dart';
import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  final String text;
  final IconData icon;
  final bool obscureText;
  final bool showImage;
  final TextEditingController textEdit;
  final Function(String)? onChanged;

  const InputWidget({
    Key? key,
    required this.text,
    required this.icon,
    this.obscureText = false,
    required this.showImage,
    required this.textEdit,
    this.onChanged,
  }) : super(key: key);

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  bool _gorunurluk = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
      padding: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey.shade800.withOpacity(0.5),
      ),
      alignment: Alignment.center,
      child: TextField(
        controller: widget.textEdit,
        onChanged: widget.onChanged,
        cursorColor: screenColor.grey,
        obscureText: widget.obscureText && !_gorunurluk,
        decoration: InputDecoration(
          icon: Icon(
            widget.icon,
            color: screenColor.loginIcon,
          ),
          hintText: widget.text,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          suffixIcon: widget.obscureText
              ? _gorunurluk
                  ? InkWell(
                      splashColor: screenColor.transparent,
                      onTap: () {
                        setState(() {
                          _gorunurluk = false;
                        });
                      },
                      child: Icon(
                        Icons.visibility,
                        color: screenColor.loginIcon,
                      ),
                    )
                  : InkWell(
                      splashColor: screenColor.transparent,
                      onTap: () {
                        setState(() {
                          _gorunurluk = true;
                        });
                      },
                      child: Icon(
                        Icons.visibility_off,
                        color: screenColor.loginIcon,
                      ),
                    )
              : null,
        ),
      ),
    );
  }
}
