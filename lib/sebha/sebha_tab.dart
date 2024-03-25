import 'package:flutter/material.dart';
import 'package:islami_app_flutter/my_theme.dart';
import 'package:provider/provider.dart';
import 'package:islami_app_flutter/providers/app_config_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int tasbehCount = 0;

  List<String> tasbeh = [
    'سبحان الله',
    "الحمدلله",
    "لاحول و لاقوة الا بالله",
    "استغفرالله العظيم",
    "لا اله الا الله",
    "الله اكبر",
  ] ;
  int index = 0;
  double angel = 0;

  ontap(){
    angel+=3;
    tasbehCount++;
    if(tasbehCount%33==0){
      index++;
    }
    if(index == tasbeh.length){
      index = 0;
    }
    setState(()
    {

    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Stack(
              alignment: Alignment.topCenter,
              children: [
                  provider.isDarkMode()?
                      Padding(
                        padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*.040,
                            MediaQuery.of(context).size.height*.00019999,
                            MediaQuery.of(context).size.height*.00019999,
                            MediaQuery.of(context).size.height*.00),
                        child: Image.asset('assets/images/seb7a_head_logo_dark.png'),
                      )
                      :
                      Padding(
                        padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*.040,
                            MediaQuery.of(context).size.height*.00019999,
                            MediaQuery.of(context).size.height*.00019999,
                            MediaQuery.of(context).size.height*.00),
                        child: Image.asset('assets/images/seb7a_head_logo.png'),
                      ),
                  provider.isDarkMode()?
                      GestureDetector(
                        onTap: ontap,
                        child: Padding(
                          padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*.095 ),
                          child: Transform.rotate(
                            angle: angel,
                            child: Image.asset('assets/images/sebha_logo_dark.png'),
                          ),
                        ),
                      )
                      :
                      GestureDetector(
                        onTap: ontap,
                        child: Padding(
                          padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*.095 ),
                          child: Transform.rotate(
                            angle: angel,
                            child: Image.asset('assets/images/sebha_logo.png'),
                          ),
                        ),
                      ),
            ]
          ),
          Text(AppLocalizations.of(context)!.tasbeh,
            style: Theme.of(context).textTheme.titleMedium,),
          SizedBox(height: 1,),
          Container(
            decoration: BoxDecoration(
              color: provider.isDarkMode()?
              MyTheme.secondaryDark : MyTheme.secondaryLight,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            child: Text("${tasbehCount}",style:Theme.of(context).textTheme.titleMedium!.copyWith(color: MyTheme.whiteColor)),
          ),
          SizedBox(height: 1,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
              color: provider.isDarkMode()?
              MyTheme.goldColor : MyTheme.secondaryLight,
            ),
            child: Text(tasbeh[index],
              style: provider.isDarkMode()?
              Theme.of(context).textTheme.titleMedium!.copyWith(color: MyTheme.blackColor)
                  :
              Theme.of(context).textTheme.titleMedium!.copyWith(color: MyTheme.whiteColor),
            ),
          )
        ],
      ),
    );
  }
}