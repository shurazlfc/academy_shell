// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:academy_shell/models/user_model.dart';
import 'package:academy_shell/widgets/Theme/themeprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class UserManagementScreen extends StatelessWidget {

  const UserManagementScreen() : super();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
    
        body: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/images/management.svg',
                  height: 250,
                  width: MediaQuery.of(context).size.width - 20,
                  fit: BoxFit.contain,
                ),
                Container(
                  child: GridView.count(
                      primary: false,
                      physics: NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      shrinkWrap: true,
                      childAspectRatio: 8 / 6,
                      crossAxisCount: 2,
                      children: userElements
                          .map((e) => InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, e.navigationRoute);
                                },
                                child: Consumer<ThemeProvider>(
                                  builder: (context,themeProvider,_){
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: themeProvider.isDarkMode? MyThemes.darkTheme.primaryColor : MyThemes.lightTheme.primaryColor,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.4),
                                          blurRadius: 2,
                                          spreadRadius: 2,
                                          offset: Offset(2, 2),
                                        ),
                                      ],
                                    ),
                                    padding: EdgeInsets.all(4),
                                    // elevation: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            e.icon,
                                            size: 50,
                                            color: themeProvider.isDarkMode? MyThemes.darkTheme.iconTheme.color : MyThemes.lightTheme.iconTheme.color,
                                          ),
                                          Text(
                                            e.text,
                                            // overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      ),
                                    ),
                                  );}
                                ),
                              ))
                          .toList()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
