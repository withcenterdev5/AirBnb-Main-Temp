import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_search_dialog_model.dart';
export 'home_search_dialog_model.dart';

class HomeSearchDialogWidget extends StatefulWidget {
  const HomeSearchDialogWidget({
    super.key,
    required this.siDo,
    required this.siGunGu,
  });

  final dynamic siDo;
  final dynamic siGunGu;

  @override
  State<HomeSearchDialogWidget> createState() => _HomeSearchDialogWidgetState();
}

class _HomeSearchDialogWidgetState extends State<HomeSearchDialogWidget> {
  late HomeSearchDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeSearchDialogModel());

    _model.nameController ??= TextEditingController(text: FFAppState().name);
    _model.nameFocusNode ??= FocusNode();

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
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: 300.0,
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                      child: Text(
                        '케이홈즈 숙소 검색',
                        style: FlutterFlowTheme.of(context).labelLarge,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: Text(
                        '카테고리',
                        style: FlutterFlowTheme.of(context).labelSmall,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: StreamBuilder<List<CategoriesRecord>>(
                        stream: FFAppState().searchCategories(
                          requestFn: () => queryCategoriesRecord(
                            queryBuilder: (categoriesRecord) =>
                                categoriesRecord.orderBy('order'),
                          ),
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
                          List<CategoriesRecord> categoryCategoriesRecordList =
                              snapshot.data!;
                          return FlutterFlowDropDown<String>(
                            controller: _model.categoryValueController ??=
                                FormFieldController<String>(
                              _model.categoryValue ??= '',
                            ),
                            options: List<String>.from(
                                categoryCategoriesRecordList
                                    .map((e) => e.id)
                                    .toList()),
                            optionLabels: categoryCategoriesRecordList
                                .map((e) => e.name)
                                .toList(),
                            onChanged: (val) =>
                                setState(() => _model.categoryValue = val),
                            width: 300.0,
                            height: 50.0,
                            textStyle: FlutterFlowTheme.of(context).bodyMedium,
                            hintText: '카테고리',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 2.0,
                            borderColor: FlutterFlowTheme.of(context).alternate,
                            borderWidth: 1.0,
                            borderRadius: 8.0,
                            margin: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 16.0, 4.0),
                            hidesUnderline: true,
                            isSearchable: false,
                            isMultiSelect: false,
                          );
                        },
                      ),
                    ),
                    Divider(
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).lineColor,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: FutureBuilder<ApiCallResponse>(
                        future: GetSiDoCall.call(),
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
                          final siDoDropDownGetSiDoResponse = snapshot.data!;
                          return FlutterFlowDropDown<String>(
                            controller: _model.siDoDropDownValueController ??=
                                FormFieldController<String>(
                              _model.siDoDropDownValue ??= '',
                            ),
                            options: List<String>.from((getJsonField(
                              widget.siDo,
                              r'''$.regcodes[:].code''',
                              true,
                            ) as List)
                                .map<String>((s) => s.toString())
                                .toList()),
                            optionLabels: (getJsonField(
                              widget.siDo,
                              r'''$.regcodes[:].name''',
                              true,
                            ) as List)
                                .map<String>((s) => s.toString())
                                .toList(),
                            onChanged: (val) async {
                              setState(() => _model.siDoDropDownValue = val);
                              setState(() {
                                FFAppState().siDoCode =
                                    _model.siDoDropDownValue!;
                              });
                            },
                            width: 300.0,
                            height: 50.0,
                            textStyle: FlutterFlowTheme.of(context).bodyMedium,
                            hintText: '시/군 선택',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 2.0,
                            borderColor: FlutterFlowTheme.of(context).alternate,
                            borderWidth: 1.0,
                            borderRadius: 8.0,
                            margin: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 16.0, 4.0),
                            hidesUnderline: true,
                            isSearchable: false,
                            isMultiSelect: false,
                          );
                        },
                      ),
                    ),
                    if (FFAppState().siDoCode != '')
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: FutureBuilder<ApiCallResponse>(
                          future: GetSiGunGuCall.call(
                            code: (String code) {
                              return '${code.substring(0, 2)}*00000';
                            }(FFAppState().siDoCode),
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
                            final siGunGuDropDownGetSiGunGuResponse =
                                snapshot.data!;
                            return FlutterFlowDropDown<String>(
                              controller:
                                  _model.siGunGuDropDownValueController ??=
                                      FormFieldController<String>(null),
                              options: (getJsonField(
                                widget.siDo,
                                r'''$.regcodes[:].name''',
                                true,
                              ) as List)
                                  .map<String>((s) => s.toString())
                                  .toList(),
                              onChanged: (val) => setState(
                                  () => _model.siGunGuDropDownValue = val),
                              width: 300.0,
                              height: 50.0,
                              textStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              hintText: '구 선택',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderWidth: 1.0,
                              borderRadius: 8.0,
                              margin: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 4.0),
                              hidesUnderline: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            );
                          },
                        ),
                      ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: FlutterFlowDropDown<int>(
                        controller: _model.noOfRoomsValueController ??=
                            FormFieldController<int>(
                          _model.noOfRoomsValue ??= FFAppState().noOfRooms,
                        ),
                        options: List<int>.from([1, 2, 3, 4, 5, 6, 7, 8, 9]),
                        optionLabels: const [
                          '1 개',
                          '2  개',
                          '3 개',
                          '4 개',
                          '5 개',
                          '6 개',
                          '7 개',
                          '8 개',
                          '9 개'
                        ],
                        onChanged: (val) =>
                            setState(() => _model.noOfRoomsValue = val),
                        width: 300.0,
                        height: 50.0,
                        textStyle: FlutterFlowTheme.of(context).bodyMedium,
                        hintText: '침실',
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 2.0,
                        borderColor: FlutterFlowTheme.of(context).alternate,
                        borderWidth: 1.0,
                        borderRadius: 8.0,
                        margin: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 4.0, 16.0, 4.0),
                        hidesUnderline: true,
                        isSearchable: false,
                        isMultiSelect: false,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: TextFormField(
                        controller: _model.nameController,
                        focusNode: _model.nameFocusNode,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: '숙소 이름',
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 14.0,
                                  ),
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
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 14.0,
                            ),
                        validator:
                            _model.nameControllerValidator.asValidator(context),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () async {
                                await action_blocks
                                    .resetHomeSearchOptions(context);
                                setState(() {});
                                Navigator.pop(context);
                              },
                              text: '초기화',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Colors.transparent,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                elevation: 0.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 0.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                            text: '취소',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Colors.transparent,
                              textStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              elevation: 0.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 0.0,
                              ),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              FFAppState().update(() {
                                FFAppState().category = _model.categoryValue!;
                                FFAppState().noOfRooms = _model.noOfRoomsValue!;
                                FFAppState().name = _model.nameController.text;
                                FFAppState().sggNm =
                                    _model.siGunGuDropDownValue != null &&
                                            _model.siGunGuDropDownValue != ''
                                        ? _model.siGunGuDropDownValue!
                                        : '';
                              });
                              Navigator.pop(context);
                            },
                            text: '검색',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).accent1,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontWeight: FontWeight.w300,
                                  ),
                              elevation: 0.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 0.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
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
    );
  }
}
