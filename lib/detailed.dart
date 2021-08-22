import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mogano/controller.dart';
import 'package:mogano/main.dart';
import 'package:mogano/pictures.dart';
import 'package:share/share.dart';
import 'package:wallpaper/wallpaper.dart';

class DetailedPage extends StatefulWidget {
  DetailedPage({Key? key}) : super(key: key);

  @override
  _DetailedPageState createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  String home = "Home Screen", lock = "Lock Screen", both = "Both Screen";

  late Stream<String> progressString;
  late String res;
  bool downloading = false;

  var result = "Waiting to set wallpaper";
  void showSnackBar() => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          elevation: 0,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.black38,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          content: Text(
            'Wallpaper set! \😀',
            textAlign: TextAlign.center,
          ),
        ),
      );
  Controller _myController = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 0),
        decoration: BoxDecoration(
            color: Colors.black,
            // gradient:
            //     LinearGradient(colors: [Colors.redAccent, Colors.deepOrange]),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Material(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // set
              IconButton(
                splashColor: Theme.of(context).accentColor,
                splashRadius: 22,
                icon: Icon(
                  Icons.image,
                  color: Colors.white,
                ),
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => SimpleDialog(
                    backgroundColor: Colors.black.withOpacity(0.4),
                    children: [
                      SimpleDialogOption(
                        child: TextButton(
                            onPressed: () {
                              progressString = Wallpaper.ImageDownloadProgress(
                                  Pictures.images[
                                      _myController.selectedIndex.value]);
                              progressString.listen((data) {
                                setState(() {
                                  res = data;
                                  downloading = true;
                                });
                                print("DataReceived: " + data);
                              }, onDone: () async {
                                lock = await Wallpaper.lockScreen();
                                setState(() {
                                  downloading = false;
                                  lock = lock;
                                });
                                print("Task Done");
                                // snackBar
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    elevation: 0,
                                    duration: Duration(seconds: 3),
                                    backgroundColor: Colors.black38,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10))),
                                    content: Text(
                                      'Wallpaper set! \😀',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              }, onError: (error) {
                                setState(() {
                                  downloading = false;
                                });
                                print("Some Error");
                                // snackbar
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    elevation: 0,
                                    duration: Duration(seconds: 3),
                                    backgroundColor: Colors.black38,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10))),
                                    content: Text(
                                      'Error! \☹',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              });
                            },
                            child: Text(
                              'Set Lock screen',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      SimpleDialogOption(
                        child: TextButton(
                            onPressed: () {
                              progressString = Wallpaper.ImageDownloadProgress(
                                  Pictures.images[
                                      _myController.selectedIndex.value]);
                              progressString.listen((data) {
                                setState(() {
                                  res = data;
                                  downloading = true;
                                });
                                print("DataReceived: " + data);
                              }, onDone: () async {
                                var width = MediaQuery.of(context).size.width;
                                var height = MediaQuery.of(context).size.height;
                                home = await Wallpaper.homeScreen();
                                setState(() {
                                  downloading = false;
                                  home = home;
                                });
                                print("Task Done");
                                // snackBar
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    elevation: 0,
                                    duration: Duration(seconds: 3),
                                    backgroundColor: Colors.black38,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10))),
                                    content: Text(
                                      'Wallpaper set! \😀',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              }, onError: (error) {
                                setState(() {
                                  downloading = false;
                                });
                                print("Some Error");
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    elevation: 0,
                                    duration: Duration(seconds: 3),
                                    backgroundColor: Colors.black38,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10))),
                                    content: Text(
                                      'Error! \☹',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              });
                            },
                            child: Text(
                              'Set Home screen',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      SimpleDialogOption(
                        child: TextButton(
                            onPressed: () {
                              progressString = Wallpaper.ImageDownloadProgress(
                                  Pictures.images[
                                      _myController.selectedIndex.value]);
                              progressString.listen((data) {
                                setState(() {
                                  res = data;
                                  downloading = true;
                                });
                                print("DataReceived: " + data);
                              }, onDone: () async {
                                both = await Wallpaper.bothScreen();
                                setState(() {
                                  downloading = false;
                                  both = both;
                                });
                                print("Task Done");
                                // snackBar
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    elevation: 0,
                                    duration: Duration(seconds: 3),
                                    backgroundColor: Colors.black38,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10))),
                                    content: Text(
                                      'Wallpaper set! \😀',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              }, onError: (error) {
                                setState(() {
                                  downloading = false;
                                });
                                print("Some Error");
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    elevation: 0,
                                    duration: Duration(seconds: 3),
                                    backgroundColor: Colors.black38,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10))),
                                    content: Text(
                                      'Error! \☹',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              });
                            },
                            child: Text(
                              'Set Both (beta)',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              // share
              IconButton(
                  icon: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                  splashColor: Theme.of(context).accentColor,
                  splashRadius: 22,
                  onPressed: () {
                    Share.share(
                      'Check out \😋:  ${Pictures.images[_myController.selectedIndex.value]}',
                    );
                  }),
            ],
          ),
        ),
      ),
      extendBody: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black12.withOpacity(0.2),
        title: Text('1080x1920'),
      ),
      body: Container(
        color: Colors.red,
        child: Stack(
          children: [
            Image.network(Pictures.images[_myController.selectedIndex.value]),
          ],
        ),
      ),
    );
  }
}
