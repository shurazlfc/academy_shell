// ignore_for_file: prefer_const_constructors

import 'package:academy_shell/models/carouselmodel.dart';
import 'package:academy_shell/models/noticeboard.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class IntroductoryPage extends StatefulWidget {
  const IntroductoryPage({Key? key}) : super(key: key);

  @override
  State<IntroductoryPage> createState() => _IntroductoryPageState();
}

class _IntroductoryPageState extends State<IntroductoryPage> {
  List<ImageName> imageNameList = [
    const ImageName(
        image: 'assets/images/slideimage1.jpg', name: 'Class One Students'),
    const ImageName(
        image: 'assets/images/slideimage2.jpg', name: 'Our Library'),
    const ImageName(image: 'assets/images/slideimage3.jpg', name: 'Toppers'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(children: [
        CarouselSlider(
          options: CarouselOptions(height: 250, autoPlay: true),
          items: imageNameList.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Card(
                  elevation: 10,
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(55)),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Image.network(i.image ?? ''),
                        Text(i.name ?? ''),
                      ],
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 25),
      ])),
    );
  }
}
