import 'package:flutter/material.dart';

class ItemHadethDetails extends StatelessWidget {
  String content ;
  int index ;
  ItemHadethDetails({required this.content, required this.index});
  @override
  Widget build(BuildContext context) {
    return Text(
      '$content (${index+1})',
      style: Theme.of(context).textTheme.titleSmall,
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,

    );
  }
}