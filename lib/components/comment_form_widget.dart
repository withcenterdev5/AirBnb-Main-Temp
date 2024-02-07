import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'comment_form_model.dart';
export 'comment_form_model.dart';

class CommentFormWidget extends StatefulWidget {
  const CommentFormWidget({
    super.key,
    required this.houseDocument,
    required this.commentDocument,
    this.parentDocument,
  });

  final HouseRecord? houseDocument;
  final CommentsRecord? commentDocument;
  final CommentsRecord? parentDocument;

  @override
  State<CommentFormWidget> createState() => _CommentFormWidgetState();
}

class _CommentFormWidgetState extends State<CommentFormWidget> {
  late CommentFormModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommentFormModel());

    _model.contentController ??=
        TextEditingController(text: widget.commentDocument?.content);
    _model.contentFocusNode ??= FocusNode();

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

    return StreamBuilder<CommentsRecord>(
      stream: CommentsRecord.getDocument(widget.commentDocument!.reference),
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
        final commentLiveCommentsRecord = snapshot.data!;
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '코멘트 작성',
                  style: FlutterFlowTheme.of(context).labelSmall,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: TextFormField(
                    controller: _model.contentController,
                    focusNode: _model.contentFocusNode,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: '후기를 입력해 주세요.',
                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                      hintStyle: FlutterFlowTheme.of(context).labelMedium,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    maxLines: 5,
                    minLines: 3,
                    validator:
                        _model.contentControllerValidator.asValidator(context),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: Text(
                        '추전 별점',
                        style: FlutterFlowTheme.of(context).labelSmall,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                      child: RatingBar.builder(
                        onRatingUpdate: (newValue) =>
                            setState(() => _model.ratingBarValue = newValue),
                        itemBuilder: (context, index) => Icon(
                          Icons.star_rounded,
                          color: FlutterFlowTheme.of(context).tertiary,
                        ),
                        direction: Axis.horizontal,
                        initialRating: _model.ratingBarValue ??=
                            widget.commentDocument!.rating.toDouble(),
                        unratedColor: FlutterFlowTheme.of(context).accent3,
                        itemCount: 5,
                        itemSize: 24.0,
                        glowColor: FlutterFlowTheme.of(context).tertiary,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 20.0,
                        borderWidth: 0.0,
                        buttonSize: 56.0,
                        fillColor: Colors.transparent,
                        icon: Icon(
                          Icons.camera_alt,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 32.0,
                        ),
                        onPressed: () async {
                          final selectedMedia = await selectMedia(
                            maxWidth: 1024.00,
                            maxHeight: 1024.00,
                            imageQuality: 90,
                            mediaSource: MediaSource.photoGallery,
                            multiImage: false,
                          );
                          if (selectedMedia != null &&
                              selectedMedia.every((m) =>
                                  validateFileFormat(m.storagePath, context))) {
                            setState(() => _model.isDataUploading = true);
                            var selectedUploadedFiles = <FFUploadedFile>[];

                            var downloadUrls = <String>[];
                            try {
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
                                  (m) async =>
                                      await uploadData(m.storagePath, m.bytes),
                                ),
                              ))
                                  .where((u) => u != null)
                                  .map((u) => u!)
                                  .toList();
                            } finally {
                              _model.isDataUploading = false;
                            }
                            if (selectedUploadedFiles.length ==
                                    selectedMedia.length &&
                                downloadUrls.length == selectedMedia.length) {
                              setState(() {
                                _model.uploadedLocalFile =
                                    selectedUploadedFiles.first;
                                _model.uploadedFileUrl = downloadUrls.first;
                              });
                            } else {
                              setState(() {});
                              return;
                            }
                          }

                          if (_model.uploadedFileUrl != '') {
                            if (!commentLiveCommentsRecord.photoUrls
                                .contains(_model.uploadedFileUrl)) {
                              await widget.commentDocument!.reference.update({
                                ...mapToFirestore(
                                  {
                                    'photoUrls': FieldValue.arrayUnion(
                                        [_model.uploadedFileUrl]),
                                  },
                                ),
                              });
                            }
                          }
                        },
                      ),
                      StreamBuilder<HouseRecord>(
                        stream: HouseRecord.getDocument(
                            widget.houseDocument!.reference),
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
                          final buttonHouseLiveHouseRecord = snapshot.data!;
                          return FFButtonWidget(
                            onPressed: () async {
                              await widget.commentDocument!.reference
                                  .update(createCommentsRecordData(
                                createdTime:
                                    widget.houseDocument!.hasCreatedTime()
                                        ? widget.houseDocument?.createdTime
                                        : getCurrentTimestamp,
                                content: _model.contentController.text,
                                depth: widget.commentDocument?.createdTime !=
                                        null
                                    ? widget.commentDocument?.depth
                                    : (widget.parentDocument != null
                                        ? valueOrDefault<int>(
                                            widget.parentDocument!.depth + 1,
                                            0,
                                          )
                                        : 1),
                                sortString: widget
                                            .commentDocument?.createdTime !=
                                        null
                                    ? widget.commentDocument?.sortString
                                    : functions.getCommentSortString(
                                        widget.parentDocument != null
                                            ? widget.parentDocument!.depth
                                            : 0,
                                        buttonHouseLiveHouseRecord.noOfComments,
                                        widget.parentDocument != null
                                            ? widget.parentDocument?.sortString
                                            : ''),
                                rating: _model.ratingBarValue?.round(),
                              ));
                              _model.countComments =
                                  await queryCommentsRecordCount(
                                queryBuilder: (commentsRecord) => commentsRecord
                                    .where(
                                      'houseDocumentReference',
                                      isEqualTo:
                                          widget.houseDocument?.reference,
                                    )
                                    .orderBy('created_time'),
                              );

                              await widget.houseDocument!.reference
                                  .update(createHouseRecordData(
                                noOfComments: _model.countComments,
                              ));
                              await actions.computeRating(
                                widget.houseDocument!.reference,
                              );
                              Navigator.pop(context);

                              setState(() {});
                            },
                            text: '저장',
                            options: FFButtonOptions(
                              width: 100.0,
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Builder(
                      builder: (context) {
                        final url =
                            commentLiveCommentsRecord.photoUrls.toList();
                        return Wrap(
                          spacing: 16.0,
                          runSpacing: 16.0,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: List.generate(url.length, (urlIndex) {
                            final urlItem = url[urlIndex];
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: CachedNetworkImage(
                                fadeInDuration: const Duration(milliseconds: 500),
                                fadeOutDuration: const Duration(milliseconds: 500),
                                imageUrl: urlItem,
                                width: MediaQuery.sizeOf(context).width * 0.25,
                                fit: BoxFit.cover,
                              ),
                            );
                          }),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 40.0,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
