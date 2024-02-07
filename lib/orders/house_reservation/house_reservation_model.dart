import '/components/emphasized_container_widget.dart';
import '/components/house_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'house_reservation_widget.dart' show HouseReservationWidget;
import 'package:flutter/material.dart';

class HouseReservationModel extends FlutterFlowModel<HouseReservationWidget> {
  ///  Local state fields for this page.

  DateTime? checkInDate;

  DateTime? checkOutDate;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for HouseCard component.
  late HouseCardModel houseCardModel;
  DateTime? datePicked1;
  // Model for EmphasizedContainer component.
  late EmphasizedContainerModel emphasizedContainerModel1;
  DateTime? datePicked2;
  // Model for EmphasizedContainer component.
  late EmphasizedContainerModel emphasizedContainerModel2;
  // State field(s) for noOfUsers widget.
  FocusNode? noOfUsersFocusNode;
  TextEditingController? noOfUsersController;
  String? Function(BuildContext, String?)? noOfUsersControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    houseCardModel = createModel(context, () => HouseCardModel());
    emphasizedContainerModel1 =
        createModel(context, () => EmphasizedContainerModel());
    emphasizedContainerModel2 =
        createModel(context, () => EmphasizedContainerModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    houseCardModel.dispose();
    emphasizedContainerModel1.dispose();
    emphasizedContainerModel2.dispose();
    noOfUsersFocusNode?.dispose();
    noOfUsersController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
