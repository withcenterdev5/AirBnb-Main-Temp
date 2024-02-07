import '/backend/backend.dart';
import '/components/emphasized_container_widget.dart';
import '/components/house_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'house_reservation_model.dart';
export 'house_reservation_model.dart';

class HouseReservationWidget extends StatefulWidget {
  const HouseReservationWidget({
    super.key,
    required this.houseDocument,
    required this.reservationDocument,
  });

  final HouseRecord? houseDocument;
  final ReservationsRecord? reservationDocument;

  @override
  State<HouseReservationWidget> createState() => _HouseReservationWidgetState();
}

class _HouseReservationWidgetState extends State<HouseReservationWidget> {
  late HouseReservationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HouseReservationModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.checkInDate = widget.reservationDocument!.hasCheckInDate()
            ? widget.reservationDocument?.checkInDate
            : null;
        _model.checkOutDate = widget.reservationDocument!.hasCheckOutDate()
            ? widget.reservationDocument?.checkOutDate
            : null;
      });
    });

    _model.noOfUsersController ??= TextEditingController(
        text: widget.reservationDocument?.noOfUsers.toString());
    _model.noOfUsersFocusNode ??= FocusNode();

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
            '예약',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 16.0),
                  child: wrapWithModel(
                    model: _model.houseCardModel,
                    updateCallback: () => setState(() {}),
                    child: HouseCardWidget(
                      houseDocument: widget.houseDocument!,
                      displayActivityMeta: false,
                    ),
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).lineColor,
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '예약 안내',
                                style: FlutterFlowTheme.of(context).labelSmall,
                              ),
                              Text(
                                '체크인 날짜와 체크아웃 날짜를 선택 후, 인원을 입력해주세요.',
                                style: FlutterFlowTheme.of(context).labelSmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          // CheckInPicker
                          final datePicked1Date = await showDatePicker(
                            context: context,
                            initialDate: ((_model.checkInDate ?? getCurrentTimestamp) ??
                                DateTime.now()),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2050),
                          );

                          if (datePicked1Date != null) {
                            safeSetState(() {
                              _model.datePicked1 = DateTime(
                                datePicked1Date.year,
                                datePicked1Date.month,
                                datePicked1Date.day,
                              );
                            });
                          }
                          if (_model.datePicked1! < getCurrentTimestamp) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '앗, 체크인(도착일)을 오늘 또는 과거 날짜로 선택하시면 안됩니다.',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: const Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                          } else {
                            setState(() {
                              _model.checkInDate = _model.datePicked1;
                              _model.checkOutDate = null;
                            });
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '체크인 날짜',
                                style: FlutterFlowTheme.of(context).labelSmall,
                              ),
                              Builder(
                                builder: (context) {
                                  if (_model.checkInDate != null) {
                                    return Text(
                                      dateTimeFormat(
                                        'yMMMd',
                                        _model.checkInDate,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium,
                                    );
                                  } else {
                                    return wrapWithModel(
                                      model: _model.emphasizedContainerModel1,
                                      updateCallback: () => setState(() {}),
                                      child: const EmphasizedContainerWidget(
                                        icon: Icon(
                                          Icons.date_range_rounded,
                                        ),
                                        text: '체크인 날짜 선택',
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          // CheckOutDate
                          final datePicked2Date = await showDatePicker(
                            context: context,
                            initialDate: ((_model.checkOutDate ?? (_model.checkInDate ?? getCurrentTimestamp)) ??
                                DateTime.now()),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2050),
                          );

                          if (datePicked2Date != null) {
                            safeSetState(() {
                              _model.datePicked2 = DateTime(
                                datePicked2Date.year,
                                datePicked2Date.month,
                                datePicked2Date.day,
                              );
                            });
                          }
                          if (_model.datePicked2 != null) {
                            if (_model.checkInDate != null) {
                              if (_model.datePicked2! > _model.checkInDate!) {
                                setState(() {
                                  _model.checkOutDate = _model.datePicked2;
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      '체크아웃 날짜를 체크인(도착일) 보다 이전 날짜로 할 수 없습니다.',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: const Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                              }
                            } else {
                              if (_model.datePicked2! <= getCurrentTimestamp) {
                                setState(() {
                                  _model.checkOutDate = _model.datePicked2;
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      '체크아웃 날짜를 오늘 또는 과거 날짜로 할 수 없습니다.',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: const Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                              }
                            }
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '체크아웃 날짜',
                                style: FlutterFlowTheme.of(context).labelSmall,
                              ),
                              Builder(
                                builder: (context) {
                                  if (_model.checkOutDate != null) {
                                    return Text(
                                      dateTimeFormat(
                                        'yMMMd',
                                        _model.checkOutDate,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium,
                                    );
                                  } else {
                                    return wrapWithModel(
                                      model: _model.emphasizedContainerModel2,
                                      updateCallback: () => setState(() {}),
                                      child: const EmphasizedContainerWidget(
                                        icon: Icon(
                                          Icons.date_range_rounded,
                                        ),
                                        text: '체크아웃 날짜 선택',
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '인원 선택',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: TextFormField(
                                controller: _model.noOfUsersController,
                                focusNode: _model.noOfUsersFocusNode,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: '인원 수 입력',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 14.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 14.0,
                                    ),
                                validator: _model.noOfUsersControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if ((_model.checkInDate != null) &&
                        (_model.checkOutDate != null))
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '요금',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall,
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            formatNumber(
                                              functions.getPrice(
                                                  widget.houseDocument!.price,
                                                  _model.checkInDate!,
                                                  _model.checkOutDate!),
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.automatic,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              '원',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).lineColor,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 32.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await widget.reservationDocument!.reference
                                        .update(createReservationsRecordData(
                                      noOfUsers: int.tryParse(
                                          _model.noOfUsersController.text),
                                      price: functions.getPrice(
                                          widget.houseDocument!.price,
                                          _model.checkInDate!,
                                          _model.checkOutDate!),
                                      createdAt: widget.reservationDocument!
                                              .hasCreatedAt()
                                          ? widget
                                              .reservationDocument?.createdAt
                                          : getCurrentTimestamp,
                                      checkInDate: _model.checkInDate,
                                      checkOutDate: _model.checkOutDate,
                                      hasPaid: false,
                                      uid: widget
                                          .reservationDocument?.reference.id,
                                    ));
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: const Text('예약 완료!'),
                                          content:
                                              const Text('프로필의 예약 목록 페이지로 이동합니다.'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: const Text('확인'),
                                            ),
                                          ],
                                        );
                                      },
                                    );

                                    context.pushNamed('ProfileScreen');
                                  },
                                  text:
                                      widget.reservationDocument!.hasCreatedAt()
                                          ? '예약 정보 수정'
                                          : '예약',
                                  options: FFButtonOptions(
                                    width: 240.0,
                                    height: 42.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).accent1,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontWeight: FontWeight.w300,
                                        ),
                                    elevation: 0.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 0.0,
                                    ),
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                ),
                              ),
                              if (widget.reservationDocument?.hasCreatedAt() ??
                                  true)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      var confirmDialogResponse =
                                          await showDialog<bool>(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: const Text('예약 취소'),
                                                    content: const Text(
                                                        '앗, 정말 예약을 취소하시겠습니까?'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                false),
                                                        child: const Text('아니오'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                true),
                                                        child: const Text('예'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ) ??
                                              false;
                                      if (confirmDialogResponse) {
                                        await widget
                                            .reservationDocument!.reference
                                            .delete();
                                        context.safePop();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              '예약이 취소되었습니다.',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                const Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                      }
                                    },
                                    text: '예약 취소',
                                    options: FFButtonOptions(
                                      width: 240.0,
                                      height: 40.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).accent3,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontWeight: FontWeight.w300,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 0.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
