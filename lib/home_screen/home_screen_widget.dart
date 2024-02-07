import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/category_icon_widget.dart';
import '/components/empty_house_list_on_home_widget.dart';
import '/components/home_popup_menu_widget.dart';
import '/components/home_search_dialog_widget.dart';
import '/components/house_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'home_screen_model.dart';
export 'home_screen_model.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  late HomeScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeScreenModel());

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
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  // 웹(PWA)에서 상단 여백.
                  // 어차피, 앱으로 배포 하지 않을 것. 그래서 웹 여백만 줌.
                  Container(
                    width: 100.0,
                    height: 24.0,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 16.0, 0.0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22.0),
                              ),
                              child: Container(
                                width: double.infinity,
                                height: 54.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 8.0,
                                      color: Color(0x28000000),
                                      offset: Offset(0.0, 0.0),
                                      spreadRadius: 0.0,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(22.0),
                                  border: Border.all(
                                    color: Colors.transparent,
                                    width: 0.0,
                                  ),
                                ),
                                child: Builder(
                                  builder: (context) => Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          FFAppState().siDoCode = '';
                                        });
                                        _model.getSiDo =
                                            await GetSiDoCall.call();
                                        _model.getSiGunGu =
                                            await GetSiGunGuCall.call();
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  const AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: GestureDetector(
                                                onTap: () => _model.unfocusNode
                                                        .canRequestFocus
                                                    ? FocusScope.of(context)
                                                        .requestFocus(
                                                            _model.unfocusNode)
                                                    : FocusScope.of(context)
                                                        .unfocus(),
                                                child: HomeSearchDialogWidget(
                                                  siDo: (_model
                                                          .getSiDo?.jsonBody ??
                                                      ''),
                                                  siGunGu: (_model.getSiGunGu
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => setState(() {}));

                                        setState(() {});
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.search_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '여행지 검색',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 13.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 2.0, 0.0, 0.0),
                                                  child: Text(
                                                    '가시고 싶은 곳을 검색해 보세요.',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 11.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Builder(
                          builder: (context) => FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).secondary,
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            fillColor: Colors.transparent,
                            icon: Icon(
                              Icons.tune_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: const AlignmentDirectional(1.0, -1.0)
                                        .resolve(Directionality.of(context)),
                                    child: GestureDetector(
                                      onTap: () => _model
                                              .unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: HomePopupMenuWidget(
                                        onAllCategoryList: () async {
                                          Navigator.pop(context);
                                          await action_blocks
                                              .resetHomeSearchOptions(context);
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 60.0,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: FutureBuilder<List<CategoriesRecord>>(
                        future: FFAppState().categories(
                          requestFn: () => queryCategoriesRecordOnce(
                            queryBuilder: (categoriesRecord) =>
                                categoriesRecord.orderBy('order'),
                          ),
                        ),
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
                          List<CategoriesRecord> listViewCategoriesRecordList =
                              snapshot.data!;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: listViewCategoriesRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewCategoriesRecord =
                                  listViewCategoriesRecordList[listViewIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  setState(() {
                                    FFAppState().category =
                                        listViewCategoriesRecord.id;
                                  });
                                },
                                child: Container(
                                  width: 80.0,
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        CategoryIconWidget(
                                          key: Key(
                                              'Keygt3_${listViewIndex}_of_${listViewCategoriesRecordList.length}'),
                                          category: listViewCategoriesRecord.id,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 0.0),
                                          child: Text(
                                            listViewCategoriesRecord.name,
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FFAppState()
                                                              .category ==
                                                          listViewCategoriesRecord
                                                              .id
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: PagedListView<DocumentSnapshot<Object?>?,
                            HouseRecord>(
                          pagingController: _model.setListViewController2(
                            HouseRecord.collection
                                .where(
                                  'hasPhoto',
                                  isEqualTo: true,
                                )
                                .where(
                                  'category',
                                  isEqualTo: FFAppState().category != ''
                                      ? FFAppState().category
                                      : null,
                                )
                                .where(
                                  'noOfRooms',
                                  isEqualTo: FFAppState().noOfRooms > 0
                                      ? FFAppState().noOfRooms
                                      : null,
                                )
                                .where(
                                  'name',
                                  isEqualTo: FFAppState().name != ''
                                      ? FFAppState().name
                                      : null,
                                )
                                .where(
                                  'siNmSggNm',
                                  isEqualTo: FFAppState().sggNm != ''
                                      ? FFAppState().sggNm
                                      : null,
                                )
                                .orderBy('created_time', descending: true),
                          ),
                          padding: EdgeInsets.zero,
                          reverse: false,
                          scrollDirection: Axis.vertical,
                          builderDelegate:
                              PagedChildBuilderDelegate<HouseRecord>(
                            // Customize what your widget looks like when it's loading the first page.
                            firstPageProgressIndicatorBuilder: (_) => Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            ),
                            // Customize what your widget looks like when it's loading another page.
                            newPageProgressIndicatorBuilder: (_) => Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            ),
                            noItemsFoundIndicatorBuilder: (_) =>
                                const EmptyHouseListOnHomeWidget(),
                            itemBuilder: (context, _, listViewIndex) {
                              final listViewHouseRecord = _model
                                  .listViewPagingController2!
                                  .itemList![listViewIndex];
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 32.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'HouseView',
                                      queryParameters: {
                                        'houseDocument': serializeParam(
                                          listViewHouseRecord,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'houseDocument': listViewHouseRecord,
                                      },
                                    );
                                  },
                                  child: HouseCardWidget(
                                    key: Key(
                                        'Keyb1e_${listViewIndex}_of_${_model.listViewPagingController2!.itemList!.length}'),
                                    houseDocument: listViewHouseRecord,
                                    displayActivityMeta: false,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
