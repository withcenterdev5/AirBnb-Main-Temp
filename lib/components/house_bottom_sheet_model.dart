import '/components/house_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'house_bottom_sheet_widget.dart' show HouseBottomSheetWidget;
import 'package:flutter/material.dart';

class HouseBottomSheetModel extends FlutterFlowModel<HouseBottomSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for HouseCard component.
  late HouseCardModel houseCardModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    houseCardModel = createModel(context, () => HouseCardModel());
  }

  @override
  void dispose() {
    houseCardModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
