import 'package:flutter/material.dart';
import 'package:islami_app_flutter/hadeth/item_hadeth_name.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HadethTab extends StatelessWidget {
  List<String> HadethNums = [
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم ',
    'حديث رقم '
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Image.asset('assets/images/ahadeth_logo.png')),
        Divider(
          color: Theme.of(context).primaryColor,
          thickness: 3,
        ),
        Text(
          AppLocalizations.of(context)!.hadeth_title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Divider(
          color: Theme.of(context).primaryColor,
          thickness: 3,
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: ((contex, index) {
              return Divider(
                color: Theme.of(context).primaryColor,
                thickness: 2,
              );
            }),
            itemBuilder: (context, index) {
              return ItemHadethNums(
                name: HadethNums[index],
                index: index,
              );
            },
            itemCount: HadethNums.length,
          ),
        )
      ],
    );
  }
}
