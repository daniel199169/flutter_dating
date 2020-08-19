import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  

  @override
  void initState() {
    super.initState();

   
  }

  

 
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent, //top bar color
        statusBarBrightness:
            Brightness.dark // Dark == white status bar -- for IOS.
        ));
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

   return new Scaffold(
      // extendBodyBehindAppBar: true,

      backgroundColor: Colors.black,
      body: Container());
  }

}
