
import 'package:flutter/material.dart';
import 'package:pantry/configs/colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(50, 60, 50, 0),
          alignment: Alignment.center,
          width: 300,
          height: 100,
          decoration: BoxDecoration(
            color: grey,
          ),
          child: Text('Status'),
        )
      ]
    );
    }
}