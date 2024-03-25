import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app_flutter/my_theme.dart';
import 'package:islami_app_flutter/quran/item_sura_details.dart';
import 'package:provider/provider.dart';
import 'package:islami_app_flutter/providers/app_config_provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura_details';
  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if(verses.isEmpty){
      loadFile(args.index);
    }
    return Stack(children: [
      provider.isDarkMode()?
      Image.asset('assets/images/main_background_dark.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      )
          :
      Image.asset('assets/images/main_background.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
        appBar: AppBar(
          title: Text(
            '${args.name}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: verses.length == 0 ?
        Center(child: CircularProgressIndicator(
          color: Theme.of(context).primaryColor,
        )):
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width*0.05,
            vertical: MediaQuery.of(context).size.height*0.05,
          ),
          decoration: provider.isDarkMode()?
            BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: MyTheme.primaryDark,
          ) :
            BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: MyTheme.whiteColor,
            ),
          child: ListView.builder(
              itemBuilder: (context,index){
                return ItemSuraDetails(content: verses[index],index: index,);
              },
            itemCount: verses.length,
          ),
        ),
      ),
    ]);
  }

  void loadFile(int index)async{
    String content = await rootBundle.loadString('assets/sura/${index+1}.txt');
    List<String>lines = content.split('\n');
    verses = lines;
    setState(() {

    });
  }
}
class SuraDetailsArgs{
  String name ;
  int index ;
  SuraDetailsArgs({required this.name,required this.index});
}