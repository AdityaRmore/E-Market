
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market/Widgets/NoInternert_splash.dart';


Future connect(BuildContext context) async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
    // I am connected to a mobile network.
  } else  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> NoInternet()));
    // I am connected to a wifi network.
  }
}



//