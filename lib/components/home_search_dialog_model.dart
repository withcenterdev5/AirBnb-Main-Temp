import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'home_search_dialog_widget.dart' show HomeSearchDialogWidget;
import 'package:flutter/material.dart';

class HomeSearchDialogModel extends FlutterFlowModel<HomeSearchDialogWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for category widget.
  String? categoryValue;
  FormFieldController<String>? categoryValueController;
  // State field(s) for siDoDropDown widget.
  String? siDoDropDownValue;
  FormFieldController<String>? siDoDropDownValueController;
  // State field(s) for siGunGuDropDown widget.
  String? siGunGuDropDownValue;
  FormFieldController<String>? siGunGuDropDownValueController;
  // State field(s) for noOfRooms widget.
  int? noOfRoomsValue;
  FormFieldController<int>? noOfRoomsValueController;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
