import 'package:academy_shell/widgets/Theme/themeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ThemeToggleSwitch extends StatelessWidget {
  const ThemeToggleSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    print(themeProvider.themeMode);
    if(themeProvider.themeMode == ThemeMode.dark){
    return IconButton(onPressed: (){
      print("button pressed");
      themeProvider.toggleTheme(false);
    }, icon: Icon(Icons.nightlight_round));
  }else{
      return IconButton(onPressed: (){
        print("button pressed 2");
        themeProvider.toggleTheme(true);
      }, icon: Icon(Icons.sunny));
    }
}

}