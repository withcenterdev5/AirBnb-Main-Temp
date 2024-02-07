import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_avatar_big_model.dart';
export 'user_avatar_big_model.dart';

class UserAvatarBigWidget extends StatefulWidget {
  const UserAvatarBigWidget({
    super.key,
    double? size,
  }) : size = size ?? 160.0;

  final double size;

  @override
  State<UserAvatarBigWidget> createState() => _UserAvatarBigWidgetState();
}

class _UserAvatarBigWidgetState extends State<UserAvatarBigWidget> {
  late UserAvatarBigModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserAvatarBigModel());

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
        final containerUsersRecord = snapshot.data!;
        return Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(0.0),
          ),
          child: Stack(
            children: [
              if (containerUsersRecord.photoUrl != '')
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => ClipRRect(
                      borderRadius: BorderRadius.circular(52.0),
                      child: CachedNetworkImage(
                        fadeInDuration: const Duration(milliseconds: 500),
                        fadeOutDuration: const Duration(milliseconds: 500),
                        imageUrl: currentUserPhoto,
                        width: widget.size,
                        height: widget.size,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              if (containerUsersRecord.photoUrl == '')
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    width: widget.size,
                    height: widget.size,
                    decoration: BoxDecoration(
                      color: const Color(0x7C6E6E6E),
                      borderRadius: BorderRadius.circular(52.0),
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        Icons.person_sharp,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 64.0,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
