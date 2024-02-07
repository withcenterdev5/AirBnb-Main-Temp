import '/components/profile_avatar_widget.dart';
import '/components/user_avatar_widget.dart';
import '/components/user_type_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_screen_widget.dart' show ProfileScreenWidget;
import 'package:flutter/material.dart';

class ProfileScreenModel extends FlutterFlowModel<ProfileScreenWidget> {
  ///  Local state fields for this page.

  bool? hasPaid;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for UserAvatar component.
  late UserAvatarModel userAvatarModel;
  // Model for ProfileAvatar component.
  late ProfileAvatarModel profileAvatarModel;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for displayName widget.
  FocusNode? displayNameFocusNode;
  TextEditingController? displayNameController;
  String? Function(BuildContext, String?)? displayNameControllerValidator;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberController;
  String? Function(BuildContext, String?)? phoneNumberControllerValidator;
  // Model for UserTypeButton component.
  late UserTypeButtonModel userTypeButtonModel1;
  // Model for UserTypeButton component.
  late UserTypeButtonModel userTypeButtonModel2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    userAvatarModel = createModel(context, () => UserAvatarModel());
    profileAvatarModel = createModel(context, () => ProfileAvatarModel());
    userTypeButtonModel1 = createModel(context, () => UserTypeButtonModel());
    userTypeButtonModel2 = createModel(context, () => UserTypeButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    userAvatarModel.dispose();
    profileAvatarModel.dispose();
    emailFocusNode?.dispose();
    emailController?.dispose();

    displayNameFocusNode?.dispose();
    displayNameController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberController?.dispose();

    userTypeButtonModel1.dispose();
    userTypeButtonModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
