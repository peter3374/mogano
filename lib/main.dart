import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mogano/controller.dart';
import 'package:mogano/detailed.dart';
import 'package:mogano/pictures.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:wallpaper/wallpaper.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
      theme: ThemeData(accentColor: Colors.deepOrange),
      title: 'Monago',
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Controller _myController = Get.put(Controller());
  String home = "Home Screen",
      lock = "Lock Screen",
      both = "Both Screen",
      system = "System";

  late Stream<String> progressString;
  late String res;
  bool downloading = false;

  var result = "Waiting to set wallpaper";

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: Colors.black,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
          return true;
        },
        child: GridView.builder(
          itemCount: Pictures.images.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 0.0,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _myController.selectedIndex.value = index;
                print('index : ${_myController.selectedIndex.value}');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailedPage()));
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FadeInImage.memoryNetwork(
                    fit: BoxFit.cover,
                    placeholder: kTransparentImage,
                    image: Pictures.images[index],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget Dialog() {
    return Positioned(
      top: 200,
      left: 70,
      child: downloading
          ? Container(
              height: 70.0,
              width: 200.0,
              child: Card(
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    SizedBox(height: 20.0),
                    Text(
                      "Downloading File : $res",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            )
          : Text(""),
    );
  }
}
// Column(
//                     children: [
//                       Image.network(
//                         images[index],
//                         fit: BoxFit.cover,
//                       ),
//                       Positioned(
//                         bottom: 10,
//                         left: 10,
//                         right: 10,
//                         child: Row(
//                           children: [
//                             // home screen
//                             RaisedButton(
//                               onPressed: () {
//                                 progressString =
//                                     Wallpaper.ImageDownloadProgress(images[0]);
//                                 progressString.listen((data) {
//                                   setState(() {
//                                     res = data;
//                                     downloading = true;
//                                   });
//                                   print("DataReceived: " + data);
//                                 }, onDone: () async {
//                                   var width = MediaQuery.of(context).size.width;
//                                   var height =
//                                       MediaQuery.of(context).size.height;
//                                   home = await Wallpaper.homeScreen();
//                                   setState(() {
//                                     downloading = false;
//                                     home = home;
//                                   });
//                                   print("Task Done");
//                                 }, onError: (error) {
//                                   setState(() {
//                                     downloading = false;
//                                   });
//                                   print("Some Error");
//                                 });
//                               },
//                               textColor: Colors.white,
//                               padding: const EdgeInsets.all(0.0),
//                               child: Center(
//                                 child: Container(
//                                   decoration: const BoxDecoration(
//                                     gradient: LinearGradient(
//                                       colors: <Color>[
//                                         Color(0xFF0D47A1),
//                                         Color(0xFF1976D2),
//                                         Color(0xFF42A5F5),
//                                       ],
//                                     ),
//                                   ),
//                                   padding: const EdgeInsets.all(10.0),
//                                   child: Text(home,
//                                       style: TextStyle(fontSize: 16)),
//                                 ),
//                               ),
//                             ),
//                             // lock screen
//                             RaisedButton(
//                               onPressed: () {
//                                 progressString =
//                                     Wallpaper.ImageDownloadProgress(images[1]);
//                                 progressString.listen((data) {
//                                   setState(() {
//                                     res = data;
//                                     downloading = true;
//                                   });
//                                   print("DataReceived: " + data);
//                                 }, onDone: () async {
//                                   lock = await Wallpaper.lockScreen();
//                                   setState(() {
//                                     downloading = false;
//                                     lock = lock;
//                                   });
//                                   print("Task Done");
//                                 }, onError: (error) {
//                                   setState(() {
//                                     downloading = false;
//                                   });
//                                   print("Some Error");
//                                 });
//                               },
//                               textColor: Colors.white,
//                               padding: const EdgeInsets.all(0.0),
//                               child: Center(
//                                 child: Container(
//                                   decoration: const BoxDecoration(
//                                     gradient: LinearGradient(
//                                       colors: <Color>[
//                                         Color(0xFF0D47A1),
//                                         Color(0xFF1976D2),
//                                         Color(0xFF42A5F5),
//                                       ],
//                                     ),
//                                   ),
//                                   padding: const EdgeInsets.all(10.0),
//                                   child: Text(lock,
//                                       style: TextStyle(fontSize: 14)),
//                                 ),
//                               ),
//                             ),
//                             // both
//                             RaisedButton(
//                               onPressed: () {
//                                 progressString =
//                                     Wallpaper.ImageDownloadProgress(images[2]);
//                                 progressString.listen((data) {
//                                   setState(() {
//                                     res = data;
//                                     downloading = true;
//                                   });
//                                   print("DataReceived: " + data);
//                                 }, onDone: () async {
//                                   both = await Wallpaper.bothScreen();
//                                   setState(() {
//                                     downloading = false;
//                                     both = both;
//                                   });
//                                   print("Task Done");
//                                 }, onError: (error) {
//                                   setState(() {
//                                     downloading = false;
//                                   });
//                                   print("Some Error");
//                                 });
//                               },
//                               textColor: Colors.white,
//                               padding: const EdgeInsets.all(0.0),
//                               child: Center(
//                                 child: Container(
//                                   decoration: const BoxDecoration(
//                                     gradient: LinearGradient(
//                                       colors: <Color>[
//                                         Color(0xFF0D47A1),
//                                         Color(0xFF1976D2),
//                                         Color(0xFF42A5F5),
//                                       ],
//                                     ),
//                                   ),
//                                   padding: const EdgeInsets.all(10.0),
//                                   child: Text(both,
//                                       style: TextStyle(fontSize: 14)),
//                                 ),
//                               ),
//                             ),
//                           
//                           ],
//                         ),
//                       ),
//                       Dialog()
//                     ],
//                   );