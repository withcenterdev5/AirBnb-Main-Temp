import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

Future openHouseCreatePage(BuildContext context) async {
  HouseRecord? createdHouseDocument;

  var houseRecordReference = HouseRecord.collection.doc();
  await houseRecordReference.set(createHouseRecordData(
    userDocumentReference: currentUserReference,
  ));
  createdHouseDocument = HouseRecord.getDocumentFromData(
      createHouseRecordData(
        userDocumentReference: currentUserReference,
      ),
      houseRecordReference);

  context.pushNamed(
    'HouseEdit',
    queryParameters: {
      'houseDocument': serializeParam(
        createdHouseDocument,
        ParamType.Document,
      ),
    }.withoutNulls,
    extra: <String, dynamic>{
      'houseDocument': createdHouseDocument,
    },
  );
}

Future resetHomeSearchOptions(BuildContext context) async {
  FFAppState().update(() {
    FFAppState().siDoCode = '';
    FFAppState().category = '';
    FFAppState().noOfRooms = 0;
    FFAppState().name = '';
    FFAppState().sggNm = '';
  });
}
