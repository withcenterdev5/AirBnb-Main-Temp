// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart';

Future<String> getPayPalUrl1(
  String totalPrice,
  String reservationUid,
) async {
  String domain = "";
  if (kIsWeb) {
    domain = "https://nodev-khomes.flutterflow.app";
  } else {
    domain = "airbnbmaintemplate://airbnbmaintemplate.com";
  }
  String emailAddress = "sb-ozknr29076923@business.example.com";
  return "https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_xclick&business=$emailAddress&currency_code=USD&item_name=Products&amount=$totalPrice&&return=$domain/paymentSuccess/$reservationUid&cancel_return=$domain/paymentCancel";
}
