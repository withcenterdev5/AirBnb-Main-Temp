import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'payment_success_widget.dart' show PaymentSuccessWidget;
import 'package:flutter/material.dart';

class PaymentSuccessModel extends FlutterFlowModel<PaymentSuccessWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in PaymentSuccess widget.
  ReservationsRecord? reservationDocument;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
