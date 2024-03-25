import 'package:flutter/material.dart';
import 'package:islami_app_flutter/hadeth/hadeth_tab.dart';
import 'package:islami_app_flutter/providers/app_config_provider.dart';
import 'package:islami_app_flutter/quran/quran_tab.dart';
import 'package:islami_app_flutter/radio/radio_tab.dart';
import 'package:islami_app_flutter/sebha/sebha_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app_flutter/settings/settings_tab.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0 ;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
        children: [
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
            title: Text(AppLocalizations.of(context)!.app_title,
            style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Theme.of(context).primaryColor
            ),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index){
                selectedIndex = index ;
                setState(() {

                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/icon_quran.png')
                    ),
                  label: AppLocalizations.of(context)!.quran_icon,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                      AssetImage('assets/images/icon_hadeth.png')
                  ),
                  label: AppLocalizations.of(context)!.hadeth_icon,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                      AssetImage('assets/images/icon_sebha.png')
                  ),
                  label: AppLocalizations.of(context)!.sebha_icon,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                      AssetImage('assets/images/icon_radio.png')
                  ),
                  label: AppLocalizations.of(context)!.radio_icon,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                      AssetImage('assets/images/icon_settings.png')
                  ),
                  label: AppLocalizations.of(context)!.setting_icon,
                ),
              ],
            ),
          ),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }
  List<Widget> tabs = [
    QuranTab(),HadethTab(),SebhaTab(),RadioTab(),SettingsTab()
  ];
}