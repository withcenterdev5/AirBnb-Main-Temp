import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/comment_form_widget.dart';
import '/components/empty_comment_list_widget.dart';
import '/components/house_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'house_view_model.dart';
export 'house_view_model.dart';

class HouseViewWidget extends StatefulWidget {
  const HouseViewWidget({
    super.key,
    required this.houseDocument,
  });

  final HouseRecord? houseDocument;

  @override
  State<HouseViewWidget> createState() => _HouseViewWidgetState();
}

class _HouseViewWidgetState extends State<HouseViewWidget> {
  late HouseViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HouseViewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
          automaticallyImplyLeading: true,
          title: Text(
            ' ',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                ),
          ),
          actions: [
            Visibility(
              visible: widget.houseDocument?.userDocumentReference ==
                  currentUserReference,
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 20.0,
                borderWidth: 0.0,
                buttonSize: 56.0,
                fillColor: Colors.transparent,
                icon: Icon(
                  Icons.edit_rounded,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 28.0,
                ),
                onPressed: () async {
                  context.pushNamed(
                    'HouseEdit',
                    queryParameters: {
                      'houseDocument': serializeParam(
                        widget.houseDocument,
                        ParamType.Document,
                      ),
                    }.withoutNulls,
                    extra: <String, dynamic>{
                      'houseDocument': widget.houseDocument,
                    },
                  );
                },
              ),
            ),
          ],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.houseCardModel,
                    updateCallback: () => setState(() {}),
                    child: HouseCardWidget(
                      houseDocument: widget.houseDocument!,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed(
                            'HouseMap',
                            queryParameters: {
                              'houseDocument': serializeParam(
                                widget.houseDocument,
                                ParamType.Document,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'houseDocument': widget.houseDocument,
                            },
                          );
                        },
                        text: '지도에서 보기',
                        icon: const FaIcon(
                          FontAwesomeIcons.mapMarked,
                        ),
                        options: FFButtonOptions(
                          height: 56.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Colors.transparent,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                          elevation: 0.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      FutureBuilder<List<ReservationsRecord>>(
                        future: queryReservationsRecordOnce(
                          queryBuilder: (reservationsRecord) =>
                              reservationsRecord
                                  .where(
                                    'userDocumentReference',
                                    isEqualTo: currentUserReference,
                                  )
                                  .where(
                                    'houseDocumentReference',
                                    isEqualTo: widget.houseDocument?.reference,
                                  )
                                  .orderBy('createdAt'),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return const Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.transparent,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<ReservationsRecord>
                              reservationButtonReservationsRecordList =
                              snapshot.data!;
                          final reservationButtonReservationsRecord =
                              reservationButtonReservationsRecordList.isNotEmpty
                                  ? reservationButtonReservationsRecordList
                                      .first
                                  : null;
                          return Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (reservationButtonReservationsRecord !=
                                      null) {
                                    context.pushNamed(
                                      'HouseReservation',
                                      queryParameters: {
                                        'houseDocument': serializeParam(
                                          widget.houseDocument,
                                          ParamType.Document,
                                        ),
                                        'reservationDocument': serializeParam(
                                          reservationButtonReservationsRecord,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'houseDocument': widget.houseDocument,
                                        'reservationDocument':
                                            reservationButtonReservationsRecord,
                                      },
                                    );
                                  } else {
                                    var reservationsRecordReference =
                                        ReservationsRecord.collection.doc();
                                    await reservationsRecordReference
                                        .set(createReservationsRecordData(
                                      userDocumentReference:
                                          currentUserReference,
                                      ownerDocumentReference: widget
                                          .houseDocument?.userDocumentReference,
                                      houseDocumentReference:
                                          widget.houseDocument?.reference,
                                    ));
                                    _model.createdReservationDocument =
                                        ReservationsRecord.getDocumentFromData(
                                            createReservationsRecordData(
                                              userDocumentReference:
                                                  currentUserReference,
                                              ownerDocumentReference: widget
                                                  .houseDocument
                                                  ?.userDocumentReference,
                                              houseDocumentReference: widget
                                                  .houseDocument?.reference,
                                            ),
                                            reservationsRecordReference);

                                    context.pushNamed(
                                      'HouseReservation',
                                      queryParameters: {
                                        'houseDocument': serializeParam(
                                          widget.houseDocument,
                                          ParamType.Document,
                                        ),
                                        'reservationDocument': serializeParam(
                                          _model.createdReservationDocument,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'houseDocument': widget.houseDocument,
                                        'reservationDocument':
                                            _model.createdReservationDocument,
                                        kTransitionInfoKey: const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  }

                                  setState(() {});
                                },
                                text:
                                    reservationButtonReservationsRecord != null
                                        ? '예약 정보 업데이트'
                                        : '예약하기',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: const Color(0x3E4B39EF),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                  elevation: 0.0,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 0.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            var commentsRecordReference =
                                CommentsRecord.collection.doc();
                            await commentsRecordReference
                                .set(createCommentsRecordData(
                              userDocumentReference: currentUserReference,
                              houseDocumentReference:
                                  widget.houseDocument?.reference,
                            ));
                            _model.createdComment =
                                CommentsRecord.getDocumentFromData(
                                    createCommentsRecordData(
                                      userDocumentReference:
                                          currentUserReference,
                                      houseDocumentReference:
                                          widget.houseDocument?.reference,
                                    ),
                                    commentsRecordReference);
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: CommentFormWidget(
                                      houseDocument: widget.houseDocument!,
                                      commentDocument: _model.createdComment!,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));

                            setState(() {});
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '코멘트',
                                style: FlutterFlowTheme.of(context).labelSmall,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.camera_alt,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                '후기를 입력 해 주세요.',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.send_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '코멘트 목록',
                            style: FlutterFlowTheme.of(context).labelSmall,
                          ),
                          Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: StreamBuilder<List<CommentsRecord>>(
                              stream: queryCommentsRecord(
                                queryBuilder: (commentsRecord) => commentsRecord
                                    .where(
                                      'houseDocumentReference',
                                      isEqualTo:
                                          widget.houseDocument?.reference,
                                    )
                                    .orderBy('sortString'),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<CommentsRecord>
                                    getCommentsCommentsRecordList =
                                    snapshot.data!;
                                if (getCommentsCommentsRecordList.isEmpty) {
                                  return const EmptyCommentListWidget();
                                }
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(
                                      getCommentsCommentsRecordList.length,
                                      (getCommentsIndex) {
                                    final getCommentsCommentsRecord =
                                        getCommentsCommentsRecordList[
                                            getCommentsIndex];
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: functions.indent(
                                              getCommentsCommentsRecord.depth),
                                          height: 20.0,
                                          decoration: const BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: double.infinity,
                                            decoration: const BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: const BoxDecoration(
                                                  color: Colors.transparent,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        16.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: StreamBuilder<
                                                                UsersRecord>(
                                                              stream: UsersRecord
                                                                  .getDocument(
                                                                      getCommentsCommentsRecord
                                                                          .userDocumentReference!),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                final commentMetaAuthorLiveUsersRecord =
                                                                    snapshot
                                                                        .data!;
                                                                return Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          42.0,
                                                                      height:
                                                                          42.0,
                                                                      clipBehavior:
                                                                          Clip.antiAlias,
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child: Image
                                                                          .network(
                                                                        commentMetaAuthorLiveUsersRecord
                                                                            .photoUrl,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            commentMetaAuthorLiveUsersRecord.displayName,
                                                                            style:
                                                                                FlutterFlowTheme.of(context).labelMedium,
                                                                          ),
                                                                          Text(
                                                                            dateTimeFormat(
                                                                              'relative',
                                                                              getCommentsCommentsRecord.createdTime!,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ),
                                                                            style:
                                                                                FlutterFlowTheme.of(context).labelSmall,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    24.0),
                                                            child: Text(
                                                              getCommentsCommentsRecord
                                                                  .content,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  var commentsRecordReference =
                                                                      CommentsRecord
                                                                          .collection
                                                                          .doc();
                                                                  await commentsRecordReference
                                                                      .set(
                                                                          createCommentsRecordData(
                                                                    userDocumentReference:
                                                                        currentUserReference,
                                                                    houseDocumentReference: widget
                                                                        .houseDocument
                                                                        ?.reference,
                                                                  ));
                                                                  _model.createdCommentReply =
                                                                      CommentsRecord.getDocumentFromData(
                                                                          createCommentsRecordData(
                                                                            userDocumentReference:
                                                                                currentUserReference,
                                                                            houseDocumentReference:
                                                                                widget.houseDocument?.reference,
                                                                          ),
                                                                          commentsRecordReference);
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    enableDrag:
                                                                        false,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return GestureDetector(
                                                                        onTap: () => _model.unfocusNode.canRequestFocus
                                                                            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                            : FocusScope.of(context).unfocus(),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              MediaQuery.viewInsetsOf(context),
                                                                          child:
                                                                              CommentFormWidget(
                                                                            houseDocument:
                                                                                widget.houseDocument!,
                                                                            commentDocument:
                                                                                _model.createdCommentReply!,
                                                                            parentDocument:
                                                                                getCommentsCommentsRecord,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      safeSetState(
                                                                          () {}));

                                                                  setState(
                                                                      () {});
                                                                },
                                                                text: '답장',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 40.0,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                  iconPadding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: Colors
                                                                      .transparent,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                  elevation:
                                                                      0.0,
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 0.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                              if (getCommentsCommentsRecord
                                                                      .userDocumentReference ==
                                                                  currentUserReference)
                                                                FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      enableDrag:
                                                                          false,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return GestureDetector(
                                                                          onTap: () => _model.unfocusNode.canRequestFocus
                                                                              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                              : FocusScope.of(context).unfocus(),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                CommentFormWidget(
                                                                              houseDocument: widget.houseDocument!,
                                                                              commentDocument: getCommentsCommentsRecord,
                                                                              parentDocument: getCommentsCommentsRecord,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(
                                                                            () {}));
                                                                  },
                                                                  text: '수정',
                                                                  options:
                                                                      FFButtonOptions(
                                                                    height:
                                                                        40.0,
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            24.0,
                                                                            0.0,
                                                                            24.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: Colors
                                                                        .transparent,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                    elevation:
                                                                        0.0,
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          0.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                  ),
                                                                ),
                                                              if (getCommentsCommentsRecord
                                                                      .userDocumentReference ==
                                                                  currentUserReference)
                                                                FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    await getCommentsCommentsRecord
                                                                        .reference
                                                                        .update({
                                                                      ...createCommentsRecordData(
                                                                        content:
                                                                            '삭제된 코멘트입니다.',
                                                                      ),
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'photoUrls':
                                                                              FieldValue.delete(),
                                                                        },
                                                                      ),
                                                                    });
                                                                  },
                                                                  text: '삭제',
                                                                  options:
                                                                      FFButtonOptions(
                                                                    height:
                                                                        40.0,
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            24.0,
                                                                            0.0,
                                                                            24.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: Colors
                                                                        .transparent,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                    elevation:
                                                                        0.0,
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          0.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  16.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final url =
                                                              getCommentsCommentsRecord
                                                                  .photoUrls
                                                                  .toList();
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children:
                                                                List.generate(
                                                                    url.length,
                                                                    (urlIndex) {
                                                              final urlItem =
                                                                  url[urlIndex];
                                                              return Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .network(
                                                                    urlItem,
                                                                    width: double
                                                                        .infinity,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              );
                                                            }),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
