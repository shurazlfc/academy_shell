import 'package:academy_shell/widgets/Theme/themeprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../models/Academy_card_model.dart';
import '../../models/transporation_modelcard.dart';

class TransportScreen extends StatelessWidget {
  const TransportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        body: Padding(
          padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/images/transporationmanagement.svg',
                  height: 250,
                  width: MediaQuery.of(context).size.width - 20,
                  fit: BoxFit.contain,
                ),
                Container(
                  child: GridView.count(
                      primary: false,
                      physics: NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      shrinkWrap: true,
                      childAspectRatio: 8 / 6,
                      crossAxisCount: 2,
                      children: TransportationElements.map((e) => InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, e.navigationRoute);
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
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        e.icon,
                                        size: 40,
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
                          )).toList()),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
