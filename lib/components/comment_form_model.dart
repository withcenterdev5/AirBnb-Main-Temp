import '/flutter_flow/flutter_flow_util.dart';
import 'comment_form_widget.dart' show CommentFormWidget;
import 'package:flutter/material.dart';

class CommentFormModel extends FlutterFlowModel<CommentFormWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for content widget.
  FocusNode? contentFocusNode;
  TextEditingController? contentController;
  String? Function(BuildContext, String?)? contentControllerValidator;
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Firestore Query - Query a collection] action in Button_House_Live widget.
  int? countComments;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    contentFocusNode?.dispose();
    contentController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
