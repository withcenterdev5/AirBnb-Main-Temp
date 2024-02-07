import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_house_list_widget.dart';
import '/components/house_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'house_my_list_model.dart';
export 'house_my_list_model.dart';

class HouseMyListWidget extends StatefulWidget {
  const HouseMyListWidget({super.key});

  @override
  State<HouseMyListWidget> createState() => _HouseMyListWidgetState();
}

class _HouseMyListWidgetState extends State<HouseMyListWidget> {
  late HouseMyListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HouseMyListModel());

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
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 20.0,
            borderWidth: 0.0,
            buttonSize: 40.0,
            fillColor: Colors.transparent,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 32.0,
            ),
            onPressed: () async {
              context.goNamed('HomeScreen');
            },
          ),
          title: Text(
            '숙소 관리',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                ),
          ),
          actions: [
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 20.0,
              borderWidth: 0.0,
              buttonSize: 56.0,
              fillColor: Colors.transparent,
              icon: Icon(
                Icons.edit_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 28.0,
              ),
              onPressed: () async {
                await action_blocks.openHouseCreatePage(context);
              },
            ),
          ],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: SafeArea(
          top: true,
          child: StreamBuilder<List<HouseRecord>>(
            stream: queryHouseRecord(
              queryBuilder: (houseRecord) => houseRecord
                  .where(
                    'userDocumentReference',
                    isEqualTo: currentUserReference,
                  )
                  .orderBy('created_time', descending: true),
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
              List<HouseRecord> listViewHouseRecordList = snapshot.data!;
              if (listViewHouseRecordList.isEmpty) {
                return const EmptyHouseListWidget();
              }
              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: listViewHouseRecordList.length,
                itemBuilder: (context, listViewIndex) {
                  final listViewHouseRecord =
                      listViewHouseRecordList[listViewIndex];
                  return Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
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
                            'Keyvns_${listViewIndex}_of_${listViewHouseRecordList.length}'),
                        houseDocument: listViewHouseRecord,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
