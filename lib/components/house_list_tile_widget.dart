import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'house_list_tile_model.dart';
export 'house_list_tile_model.dart';

class HouseListTileWidget extends StatefulWidget {
  const HouseListTileWidget({
    super.key,
    required this.houseDocument,
    required this.reservationDocument,
    bool? displayPaymentButton,
  }) : displayPaymentButton = displayPaymentButton ?? true;

  final HouseRecord? houseDocument;
  final ReservationsRecord? reservationDocument;
  final bool displayPaymentButton;

  @override
  State<HouseListTileWidget> createState() => _HouseListTileWidgetState();
}

class _HouseListTileWidgetState extends State<HouseListTileWidget> {
  late HouseListTileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HouseListTileModel());

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

    return Stack(
      children: [
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            context.pushNamed(
              'HouseReservation',
              queryParameters: {
                'houseDocument': serializeParam(
                  widget.houseDocument,
                  ParamType.Document,
                ),
                'reservationDocument': serializeParam(
                  widget.reservationDocument,
                  ParamType.Document,
                ),
              }.withoutNulls,
              extra: <String, dynamic>{
                'houseDocument': widget.houseDocument,
                'reservationDocument': widget.reservationDocument,
              },
            );
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).accent4,
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 8.0, 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      widget.houseDocument!.photoUrls.first,
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.houseDocument!.subject,
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '비용: ${formatNumber(
                                    widget.reservationDocument?.price,
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.automatic,
                                  )}원',
                                  style:
                                      FlutterFlowTheme.of(context).labelSmall,
                                ),
                                Text(
                                  '   /   ${widget.reservationDocument?.noOfUsers.toString()}명',
                                  style:
                                      FlutterFlowTheme.of(context).labelSmall,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Text(
                              '${dateTimeFormat(
                                'yMd',
                                widget.reservationDocument?.checkInDate,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              )} ~ ${dateTimeFormat(
                                'yMd',
                                widget.reservationDocument?.checkOutDate,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              )}',
                              style: FlutterFlowTheme.of(context).labelSmall,
                            ),
                          ),
                          if (widget.displayPaymentButton)
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await launchURL(functions.getPayPalUrl(
                                      widget.reservationDocument!.price
                                          .toString(),
                                      widget
                                          .reservationDocument!.reference.id));
                                },
                                text: '지금 지불하세요',
                                icon: Icon(
                                  Icons.paypal_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 15.0,
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).accent3,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontWeight: FontWeight.w600,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
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
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    child: Icon(
                      Icons.chevron_right_sharp,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(1.0, -1.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 16.0, 0.0),
            child: Container(
              decoration: BoxDecoration(
                color: widget.reservationDocument!.hasPaid
                    ? FlutterFlowTheme.of(context).success
                    : FlutterFlowTheme.of(context).error,
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(
                  color: Colors.transparent,
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                child: Text(
                  widget.reservationDocument!.hasPaid ? '유급의' : '보류 중',
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
