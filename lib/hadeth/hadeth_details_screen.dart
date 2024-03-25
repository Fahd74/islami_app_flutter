import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app_flutter/my_theme.dart';
import 'package:islami_app_flutter/hadeth/item_hadeth_details.dart';
import 'package:provider/provider.dart';
import 'package:islami_app_flutter/providers/app_config_provider.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = 'hadeth_details';

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as HadethDetailsArgs;
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
            style: Theme.of(context).textTheme.titleMedium,
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
              return ItemHadethDetails(content: verses[index],index: index,);
            },
            itemCount: verses.length,
          ),
        ),
      ),
    ]);
  }

  void loadFile(int index)async{
    String content = await rootBundle.loadString('assets/hadeth/h${index+1}.txt');
    List<String>lines = content.split('\n');
    verses = lines;
    setState(() {

    });
  }
}
class HadethDetailsArgs{
  String name ;
  int index ;
  HadethDetailsArgs({required this.name,required this.index});
}