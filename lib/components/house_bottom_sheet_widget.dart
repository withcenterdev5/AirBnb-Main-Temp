import '/backend/backend.dart';
import '/components/house_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'house_bottom_sheet_model.dart';
export 'house_bottom_sheet_model.dart';

class HouseBottomSheetWidget extends StatefulWidget {
  const HouseBottomSheetWidget({
    super.key,
    this.parameter1,
  });

  final HouseRecord? parameter1;

  @override
  State<HouseBottomSheetWidget> createState() => _HouseBottomSheetWidgetState();
}

class _HouseBottomSheetWidgetState extends State<HouseBottomSheetWidget> {
  late HouseBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HouseBottomSheetModel());

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: Container(
              width: 32.0,
              height: 5.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).lineColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
            child: wrapWithModel(
              model: _model.houseCardModel,
              updateCallback: () => setState(() {}),
              child: HouseCardWidget(
                houseDocument: widget.parameter1!,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
