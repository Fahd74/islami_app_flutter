import 'package:flutter/material.dart';
import 'package:islami_app_flutter/hadeth/hadeth_details_screen.dart';

class ItemHadethNums extends StatelessWidget {
  String name ;
  int index ;
  ItemHadethNums({required this.name,required this.index});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (

          ){
        Navigator.of(context).pushNamed(HadethDetailsScreen.routeName,
            arguments: HadethDetailsArgs(
                name: name,
                index: index
            )
        );
      },
      child: Text(name+'${index+1}',
        style: Theme.of(context).textTheme.titleSmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}