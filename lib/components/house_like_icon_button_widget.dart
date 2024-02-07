import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'house_like_icon_button_model.dart';
export 'house_like_icon_button_model.dart';

class HouseLikeIconButtonWidget extends StatefulWidget {
  const HouseLikeIconButtonWidget({
    super.key,
    required this.houseDocument,
  });

  final HouseRecord? houseDocument;

  @override
  State<HouseLikeIconButtonWidget> createState() =>
      _HouseLikeIconButtonWidgetState();
}

class _HouseLikeIconButtonWidgetState extends State<HouseLikeIconButtonWidget> {
  late HouseLikeIconButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HouseLikeIconButtonModel());

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
        final iconButtonUsersRecord = snapshot.data!;
        return FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 20.0,
          borderWidth: 0.0,
          buttonSize: 56.0,
          fillColor: Colors.transparent,
          icon: Icon(
            Icons.favorite_sharp,
            color: iconButtonUsersRecord.houseLikes
                    .contains(widget.houseDocument?.reference)
                ? FlutterFlowTheme.of(context).error
                : FlutterFlowTheme.of(context).secondary,
            size: 28.0,
          ),
          onPressed: () async {
            if (iconButtonUsersRecord.houseLikes
                .contains(widget.houseDocument?.reference)) {
              await currentUserReference!.update({
                ...mapToFirestore(
                  {
                    'houseLikes': FieldValue.arrayRemove(
                        [widget.houseDocument?.reference]),
                  },
                ),
              });
            } else {
              await currentUserReference!.update({
                ...mapToFirestore(
                  {
                    'houseLikes': FieldValue.arrayUnion(
                        [widget.houseDocument?.reference]),
                  },
                ),
              });
            }
          },
        );
      },
    );
  }
}
