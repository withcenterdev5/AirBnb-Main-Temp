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

Future computeRating(DocumentReference houseDocumentReference) async {
  // Add your function code here!
  final snapshot =
      await FirebaseFirestore.instance.collection('comments').get();
  if (snapshot.size == 0) {
    return;
  }

  int sum = 0;
  for (final doc in snapshot.docs) {
    final data = doc.data();

    /// original code
    /// sum += (data['rating'] as int?) ?? 0;
    /// changed into below
    sum += int.tryParse(data['rating'].toString()) ?? 0;
  }

  final rating = sum / snapshot.size;
  await houseDocumentReference.update({
    'rating': rating,
  });
}
