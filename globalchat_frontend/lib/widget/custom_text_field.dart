import 'package:flutter/material.dart';

import '../util/styles.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final IconData icon;
  final Function(String) callback;

  const CustomTextField(
      {Key? key,
      required this.hint,
      required this.icon,
      required this.callback})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isHide = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: widget.icon == Icons.password && isHide ? true : false,
        onChanged: widget.callback,
        decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: TextStyle(color: Styles.COLOR_HINT_TEXT),
            prefixIcon: Icon(widget.icon),
            suffixIcon: widget.icon == Icons.password
                ? IconButton(
                    onPressed: () => {
                          setState(() {
                            isHide = !isHide;
                          })
                        },
                    icon: isHide
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility))
                : null,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Styles.COLOR_MAIN))));
  }
}
