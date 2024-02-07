import '/flutter_flow/flutter_flow_util.dart';
import 'house_edit_widget.dart' show HouseEditWidget;
import 'package:flutter/material.dart';

class HouseEditModel extends FlutterFlowModel<HouseEditWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for price widget.
  FocusNode? priceFocusNode;
  TextEditingController? priceController;
  String? Function(BuildContext, String?)? priceControllerValidator;
  // State field(s) for maxUsers widget.
  FocusNode? maxUsersFocusNode;
  TextEditingController? maxUsersController;
  String? Function(BuildContext, String?)? maxUsersControllerValidator;
  // State field(s) for noOfRooms widget.
  FocusNode? noOfRoomsFocusNode;
  TextEditingController? noOfRoomsController;
  String? Function(BuildContext, String?)? noOfRoomsControllerValidator;
  // State field(s) for noOfBeds widget.
  FocusNode? noOfBedsFocusNode;
  TextEditingController? noOfBedsController;
  String? Function(BuildContext, String?)? noOfBedsControllerValidator;
  // State field(s) for noOfBathrooms widget.
  FocusNode? noOfBathroomsFocusNode;
  TextEditingController? noOfBathroomsController;
  String? Function(BuildContext, String?)? noOfBathroomsControllerValidator;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  // State field(s) for subject widget.
  FocusNode? subjectFocusNode;
  TextEditingController? subjectController;
  String? Function(BuildContext, String?)? subjectControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    priceFocusNode?.dispose();
    priceController?.dispose();

    maxUsersFocusNode?.dispose();
    maxUsersController?.dispose();

    noOfRoomsFocusNode?.dispose();
    noOfRoomsController?.dispose();

    noOfBedsFocusNode?.dispose();
    noOfBedsController?.dispose();

    noOfBathroomsFocusNode?.dispose();
    noOfBathroomsController?.dispose();

    nameFocusNode?.dispose();
    nameController?.dispose();

    subjectFocusNode?.dispose();
    subjectController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
