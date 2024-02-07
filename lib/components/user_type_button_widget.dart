import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_type_button_model.dart';
export 'user_type_button_model.dart';

class UserTypeButtonWidget extends StatefulWidget {
  const UserTypeButtonWidget({
    super.key,
    required this.type,
  });

  final String? type;

  @override
  State<UserTypeButtonWidget> createState() => _UserTypeButtonWidgetState();
}

class _UserTypeButtonWidgetState extends State<UserTypeButtonWidget> {
  late UserTypeButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserTypeButtonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        final buttonUsersRecord = snapshot.data!;
        return FFButtonWidget(
          onPressed: () async {
            await currentUserReference!.update(createUsersRecordData(
              type: widget.type,
            ));
          },
          text: widget.type!,
          options: FFButtonOptions(
            width: 100.0,
            height: 40.0,
            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
            iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            color: buttonUsersRecord.type == widget.type
                ? FlutterFlowTheme.of(context).tertiary
                : const Color(0x00000000),
            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: 'Readex Pro',
                  color: buttonUsersRecord.type == widget.type
                      ? FlutterFlowTheme.of(context).onPrimary
                      : FlutterFlowTheme.of(context).secondary,
                ),
            elevation: 0.0,
            borderSide: BorderSide(
              color: buttonUsersRecord.type == widget.type
                  ? FlutterFlowTheme.of(context).tertiary
                  : FlutterFlowTheme.of(context).secondary,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(24.0),
          ),
        );
      },
    );
  }
}
