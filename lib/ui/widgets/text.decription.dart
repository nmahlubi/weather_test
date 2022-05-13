// @dart=2.9


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../shared/text.styles.dart';

class TextDescription extends StatelessWidget {
  String name;
  TextDescription({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      name ?? '',
      maxLines: 5,
      overflow: TextOverflow.ellipsis,
      style: detailsSubStyle,
    );
  }
}
