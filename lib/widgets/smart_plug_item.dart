import 'package:flutter/material.dart';
import 'package:smart_plug/screens/plug_screen.dart';

Widget SmartPlugItem(
    {required BuildContext context,
    required String plugName,
    required String plugImage}) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PlugScreen(
                  plugName: plugName,
                  plugImage: plugImage,
                )),
      );
    },
    splashFactory: InkSparkle.splashFactory,
    child: Container(
      height: 225,
      padding: const EdgeInsets.all(8),
      width: 175,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 10, color: Colors.black, spreadRadius: 0.1),
          ],
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            plugName,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 140,
            child: Image(
              image: NetworkImage(plugImage),
              // fit: BoxFit.contain,
              alignment: Alignment.center,
            ),
          )
        ],
      ),
    ),
  );
}
