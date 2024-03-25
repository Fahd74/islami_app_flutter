import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app_flutter/radio/radio_item.dart';
import 'package:http/http.dart' as http;
import 'package:audioplayers/audioplayers.dart';
import '../Radios.dart';

class RadioTab extends StatelessWidget {
  final player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getRadios(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var radios = snapshot.data?.radios??[];
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Image.asset('assets/images/radio_logo.png'),
                SizedBox(height: 10),
                Text(AppLocalizations.of(context)!.quran_radio,
                  style: Theme.of(context).textTheme.titleMedium,),
                SizedBox(height: 10),
                SizedBox(
                  height: MediaQuery.of(context).size.height*.2,
                  child: ListView.builder(
                    physics: PageScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index)=>RadioItem(radioModel:radios[index],
                        audioPlayer: player),
                    itemCount: radios.length,
                  ),
                ),

              ],
            );
          }
          else if(snapshot.hasError){
            Center(child: Text(snapshot.error.toString()));
          }
          return Center(child: CircularProgressIndicator());
        }
    );
  }
  Future<Radios> getRadios() async {
    var url = Uri.parse("https://mp3quran.net/api/v3/radios");
    var response = await http.get(url);
    if(response.statusCode == 200){
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return Radios.fromJson(json);
    }
    else{
      throw Exception("failed to load radios");
    }
  }
}

