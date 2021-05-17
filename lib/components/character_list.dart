import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CharacterList extends StatelessWidget {
  CharacterList({@required this.image});

  String image;

  @override
  Widget build(BuildContext context) {
    return (
      Container(
        color: Colors.blueAccent,
        child:
      Image(image: AssetImage(image),
      width: 100)

      )
    );
  }


}