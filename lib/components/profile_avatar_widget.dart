import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/user_avatar_big_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'profile_avatar_model.dart';
export 'profile_avatar_model.dart';

class ProfileAvatarWidget extends StatefulWidget {
  const ProfileAvatarWidget({super.key});

  @override
  State<ProfileAvatarWidget> createState() => _ProfileAvatarWidgetState();
}

class _ProfileAvatarWidgetState extends State<ProfileAvatarWidget> {
  late ProfileAvatarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileAvatarModel());

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

    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 64.0, 0.0, 0.0),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            final selectedMedia = await selectMediaWithSourceBottomSheet(
              context: context,
              maxWidth: 400.00,
              maxHeight: 400.00,
              imageQuality: 90,
              allowPhoto: true,
            );
            if (selectedMedia != null &&
                selectedMedia
                    .every((m) => validateFileFormat(m.storagePath, context))) {
              setState(() => _model.isDataUploading = true);
              var selectedUploadedFiles = <FFUploadedFile>[];

              var downloadUrls = <String>[];
              try {
                showUploadMessage(
                  context,
                  '업로드 중입니다...',
                  showLoading: true,
                );
                selectedUploadedFiles = selectedMedia
                    .map((m) => FFUploadedFile(
                          name: m.storagePath.split('/').last,
                          bytes: m.bytes,
                          height: m.dimensions?.height,
                          width: m.dimensions?.width,
                          blurHash: m.blurHash,
                        ))
                    .toList();

                downloadUrls = (await Future.wait(
                  selectedMedia.map(
                    (m) async => await uploadData(m.storagePath, m.bytes),
                  ),
                ))
                    .where((u) => u != null)
                    .map((u) => u!)
                    .toList();
              } finally {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                _model.isDataUploading = false;
              }
              if (selectedUploadedFiles.length == selectedMedia.length &&
                  downloadUrls.length == selectedMedia.length) {
                setState(() {
                  _model.uploadedLocalFile = selectedUploadedFiles.first;
                  _model.uploadedFileUrl = downloadUrls.first;
                });
                showUploadMessage(context, '업로드 성공!');
              } else {
                setState(() {});
                showUploadMessage(context, '업로드에 실패하였습니다.');
                return;
              }
            }

            if (_model.uploadedFileUrl != '') {
              await currentUserReference!.update(createUsersRecordData(
                photoUrl: _model.uploadedFileUrl,
              ));
            }
          },
          child: SizedBox(
            width: 160.0,
            height: 160.0,
            child: Stack(
              children: [
                wrapWithModel(
                  model: _model.userAvatarBigModel,
                  updateCallback: () => setState(() {}),
                  child: const UserAvatarBigWidget(),
                ),
                Align(
                  alignment: const AlignmentDirectional(1.0, 1.0),
                  child: Container(
                    width: 48.0,
                    height: 48.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondary,
                      borderRadius: BorderRadius.circular(56.0),
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      color: FlutterFlowTheme.of(context).onPrimary,
                      size: 24.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
