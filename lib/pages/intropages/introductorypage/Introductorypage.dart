// ignore_for_file: prefer_const_constructors

import 'package:academy_shell/pages/intropages/introductorypage/carouselmodel.dart';
import 'package:academy_shell/pages/intropages/introductorypage/noticeboard.dart';
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
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ignore: prefer_const_constructors
              Text(
                'NoticeBoard',
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
              Expanded(
                child: Container(
                  height: 150,
                  child: ListView.builder(itemBuilder: (context,(context, index) {
                    return Column(
                      children: 
                    );
                  })),
                  width: MediaQuery.of(context).size.width,
                  // child: ListView.builder(
                    
                  //   itemCount: 3,
                  //   itemBuilder: (context, index) {
                  //     return const NoticeBoardWidget(
                  //       heading: 'Heading',
                  //       body:
                  //           'body of the notice jakhfskjdhaskfaskdhjaksh asfdjhasjk hakshf  sdfasfasfasfasfsffffffffffffffffffffffffffffffffffffffffffffffffffffffff',
                  //       imageUrl:
                  //           'https://images.freeimages.com/images/large-previews/d8a/perfect-blue-buildings-2-1235862.jpg',
                  //     );
                  //   },
                  // ),
                ),
              ),
            ],
          ),
        ),
      ])),
    );
  }
}





 // return Scaffold(
    //   // appBar: AppBar(actions: const [  ThemeSwitchWidget()]),
    //     body: SafeArea(
    //   child: SizedBox(
    //     height: MediaQuery.of(context).size.height,
    //     child: Padding(
    //       padding: const EdgeInsets.only(top: 10,right: 10,left: 10),
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [

    //           // CarouselSlider(
    //           //   options: CarouselOptions(height: 250,autoPlay: true),
    //           //   items: imageNameList.map((i) {
    //           //     return Builder(
    //           //       builder: (BuildContext context) {
    //           //         return Card(
    //           //           elevation: 10,
    //           //           child: Container(
    //           //             decoration: BoxDecoration(borderRadius: BorderRadius.circular(55)),
    //           //               width: MediaQuery.of(context).size.width,
    //           //               child: Column(
    //           //                 children: [
    //           //                   Image.network(i.image??''),
    //           //                   Text(i.name??''),
    //           //                 ],
    //           //               ),
    //           //           ),
    //           //         );
    //           //       },
    //           //     );
    //           //   }).toList(),

    //           // ),
    //           // CarouselSlider.builder(
    //           //   itemCount: topImage.length,
    //           //   itemBuilder: (context, index, pageIndex) {
    //           //     final urlImage = topImage[index];
    //           //     return buildImage(urlImage, index);
    //           //   },
    //           //   options: CarouselOptions(height: 250, autoPlay: true),
    //           // ),
    //           const SizedBox(height: 25),
    //           Padding(
    //             padding: const EdgeInsets.only(left: 15.0),
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                  Text('NoticeBoard',),
    //                 IconButton(onPressed: (){}, icon: Icon(Icons.more_vert) )
    //               ],
    //             ),
    //           ),
    //           Expanded(
    //             child: Container(
    //              height: 150,
    //               width: MediaQuery.of(context).size.width,
    //               child: ListView.builder(itemCount: 3,
    //               itemBuilder: (context, index) {
    //               return const NoticeBoardWidget(
    //                 heading: 'Heading',
    //                 body: 'body of the notice jakhfskjdhaskfaskdhjaksh asfdjhasjk hakshf  sdfasfasfasfasfsffffffffffffffffffffffffffffffffffffffffffffffffffffffff',
    //                 imageUrl: 'https://images.freeimages.com/images/large-previews/d8a/perfect-blue-buildings-2-1235862.jpg',
    //               );

    //             },),),
    //           ),

    //           ],),
    //     ),
    //   ),)
    // );
