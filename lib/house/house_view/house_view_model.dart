import '/backend/backend.dart';
import '/components/house_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'house_view_widget.dart' show HouseViewWidget;
import 'package:flutter/material.dart';

class HouseViewModel extends FlutterFlowModel<HouseViewWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for HouseCard component.
  late HouseCardModel houseCardModel;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ReservationsRecord? createdReservationDocument;
  // Stores action output result for [Backend Call - Create Document] action in Column_Comment widget.
  CommentsRecord? createdComment;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CommentsRecord? createdCommentReply;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    houseCardModel = createModel(context, () => HouseCardModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    houseCardModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
