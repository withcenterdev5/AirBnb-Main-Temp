import '/components/user_avatar_big_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_avatar_widget.dart' show ProfileAvatarWidget;
import 'package:flutter/material.dart';

class ProfileAvatarModel extends FlutterFlowModel<ProfileAvatarWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Model for UserAvatarBig component.
  late UserAvatarBigModel userAvatarBigModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    userAvatarBigModel = createModel(context, () => UserAvatarBigModel());
  }

  @override
  void dispose() {
    userAvatarBigModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
