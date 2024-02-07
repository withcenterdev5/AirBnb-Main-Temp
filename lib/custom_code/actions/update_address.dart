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

import 'package:find_address/find_address.dart' as addr;

Future updateAddress(
  BuildContext context,
  DocumentReference houseDocumentReference,
) async {
  // Add your function code here!
  final re = await addr.findAddress(
    context,
    kakaoApiKey: "7c567f8e9e57ffa08531df5aa9efebb5",
    dataApiKey: "U01TX0FVVEgyMDIzMTExODE5MjMzMDExNDI4ODc=",
    themeData: Theme.of(context).copyWith(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple.shade300),
      textTheme: Theme.of(context).textTheme.copyWith(
            titleMedium: const TextStyle(color: Colors.black),
            labelMedium: const TextStyle(color: Colors.blue),
          ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      useMaterial3: true,
    ),
  );

  if (re == null) return;

  print(re);

  await houseDocumentReference.update({
    'roadAddr': re['roadAddr'],
    'siNm': re['siNm'],
    'sggNm': re['sggNm'],
    'siNmSggNm': '${re['siNm']} ${re['sggNm']}',
    'latLng': GeoPoint(re['lat'] ?? 0, re['lng'] ?? 0),
  });

  return;
}
