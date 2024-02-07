import '/backend/backend.dart';
import '/components/house_like_icon_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'house_card_model.dart';
export 'house_card_model.dart';

class HouseCardWidget extends StatefulWidget {
  const HouseCardWidget({
    super.key,
    required this.houseDocument,
    bool? displayActivityMeta,
  }) : displayActivityMeta = displayActivityMeta ?? true;

  final HouseRecord? houseDocument;
  final bool displayActivityMeta;

  @override
  State<HouseCardWidget> createState() => _HouseCardWidgetState();
}

class _HouseCardWidgetState extends State<HouseCardWidget> {
  late HouseCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HouseCardModel());

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

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Builder(
            builder: (context) {
              if (widget.houseDocument!.photoUrls.isNotEmpty) {
                return Stack(
                  children: [
                    Builder(
                      builder: (context) {
                        final url =
                            widget.houseDocument?.photoUrls.toList() ?? [];
                        return SizedBox(
                          width: double.infinity,
                          height: 280.0,
                          child: CarouselSlider.builder(
                            itemCount: url.length,
                            itemBuilder: (context, urlIndex, _) {
                              final urlItem = url[urlIndex];
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  urlItem,
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                            carouselController: _model.carouselController ??=
                                CarouselController(),
                            options: CarouselOptions(
                              initialPage: min(1, url.length - 1),
                              viewportFraction: 0.8,
                              disableCenter: true,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.25,
                              enableInfiniteScroll: true,
                              scrollDirection: Axis.horizontal,
                              autoPlay: false,
                              onPageChanged: (index, _) =>
                                  _model.carouselCurrentIndex = index,
                            ),
                          ),
                        );
                      },
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.8, -1.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: wrapWithModel(
                          model: _model.houseLikeIconButtonModel,
                          updateCallback: () => setState(() {}),
                          child: HouseLikeIconButtonWidget(
                            houseDocument: widget.houseDocument!,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: Text(
                      '등록된 이미지가 없습니다.',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                );
              }
            },
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Text(
                    widget.houseDocument!.name,
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).accentColor,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget.houseDocument?.roadAddr,
                          '...',
                        ),
                        style: FlutterFlowTheme.of(context).labelSmall,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Text(
                    widget.houseDocument!.subject,
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '최대 인원: ${widget.houseDocument?.maxUsers.toString()}명',
                        style: FlutterFlowTheme.of(context).labelSmall,
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                        child: Text(
                          '침실: ${widget.houseDocument?.noOfRooms.toString()}개',
                          style: FlutterFlowTheme.of(context).labelSmall,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                        child: Text(
                          '침대: ${widget.houseDocument?.noOfBeds.toString()}개',
                          style: FlutterFlowTheme.of(context).labelSmall,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                        child: Text(
                          '욕실: ${widget.houseDocument?.noOfBathrooms.toString()}개',
                          style: FlutterFlowTheme.of(context).labelSmall,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget.houseDocument?.price.toString(),
                          '0',
                        ),
                        style: FlutterFlowTheme.of(context).labelSmall,
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                        child: Text(
                          '원 / 1 박',
                          style: FlutterFlowTheme.of(context).labelSmall,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                        child: StreamBuilder<UsersRecord>(
                          stream: UsersRecord.getDocument(
                              widget.houseDocument!.userDocumentReference!),
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
                            final textAuthorUsersRecord = snapshot.data!;
                            return Text(
                              'by ${textAuthorUsersRecord.displayName}',
                              style: FlutterFlowTheme.of(context).labelMedium,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                if (widget.displayActivityMeta)
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              4.0, 0.0, 0.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              formatNumber(
                                widget.houseDocument?.rating,
                                formatType: FormatType.custom,
                                format: '##0.0#',
                                locale: '',
                              ),
                              '0',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontWeight: FontWeight.w300,
                                ),
                          ),
                        ),
                        if (widget.houseDocument!.noOfComments > 0)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
                            child: Text(
                              '후기 ${widget.houseDocument?.noOfComments.toString()}개',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                          ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
