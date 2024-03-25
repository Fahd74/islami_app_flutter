import 'package:flutter/material.dart';
import 'package:islami_app_flutter/my_theme.dart';
import 'package:islami_app_flutter/providers/app_config_provider.dart';
import 'package:provider/provider.dart';
import 'package:audioplayers/audioplayers.dart';
import '../Radios.dart';

class RadioItem extends StatelessWidget {
 final AudioPlayer audioPlayer;
 final RadioModel radioModel;
   RadioItem({super.key, required this.radioModel, required this.audioPlayer});


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: () {
                audioPlayer.stop();
              },
                  icon: Icon(Icons.stop,
                      size: 40,
                      color: provider.isDarkMode()? MyTheme.goldColor : MyTheme.primaryLight)
              ),
              IconButton(onPressed: () async {

                await audioPlayer.play(UrlSource(radioModel.url??''));
              },
                  icon: Icon(Icons.play_arrow,
                      size: 40,
                      color: provider.isDarkMode()? MyTheme.goldColor : MyTheme.primaryLight)
              ),
            ],
          ),
          Text(radioModel.name??'',
            style: Theme.of(context).textTheme.titleMedium,),
        ],
      ),
    );
  }
}