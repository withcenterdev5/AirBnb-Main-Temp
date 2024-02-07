import '/components/user_avatar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_popup_menu_widget.dart' show HomePopupMenuWidget;
import 'package:flutter/material.dart';

class HomePopupMenuModel extends FlutterFlowModel<HomePopupMenuWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for UserAvatar component.
  late UserAvatarModel userAvatarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    userAvatarModel = createModel(context, () => UserAvatarModel());
  }

  @override
  void dispose() {
    userAvatarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
