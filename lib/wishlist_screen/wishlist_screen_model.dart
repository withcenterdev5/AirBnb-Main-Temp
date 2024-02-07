import '/components/user_avatar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'wishlist_screen_widget.dart' show WishlistScreenWidget;
import 'package:flutter/material.dart';

class WishlistScreenModel extends FlutterFlowModel<WishlistScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for UserAvatar component.
  late UserAvatarModel userAvatarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    userAvatarModel = createModel(context, () => UserAvatarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    userAvatarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
