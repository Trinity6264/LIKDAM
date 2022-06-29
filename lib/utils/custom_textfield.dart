import 'package:flutter/material.dart';

import '../constant/color_pallet.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height * .075,
      child: Card(
        color: whiteBgColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 8,
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
            ),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
          ),
        ),
      ),
    );
  }
}
