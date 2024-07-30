import 'package:flutter/material.dart';

mixin class CustumWidgets {
  viewTextFild(String name, TextEditingController controller,
      [IconData? icon, String? level]) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              prefixIcon: Icon(icon),
              hintText: name,
              labelText: level,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              )),
        ));
  }

  viewbutton(String name, {required void Function()? onPressed}) {
    return MaterialButton(
        height: 50,
        minWidth: 340,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.white)),
        color: Color(0xff90873092),
        onPressed: onPressed,
        child: Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ));
  }
}
