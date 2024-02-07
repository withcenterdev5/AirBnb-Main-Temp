import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'empty_house_list_on_home_model.dart';
export 'empty_house_list_on_home_model.dart';

class EmptyHouseListOnHomeWidget extends StatefulWidget {
  const EmptyHouseListOnHomeWidget({super.key});

  @override
  State<EmptyHouseListOnHomeWidget> createState() =>
      _EmptyHouseListOnHomeWidgetState();
}

class _EmptyHouseListOnHomeWidgetState
    extends State<EmptyHouseListOnHomeWidget> {
  late EmptyHouseListOnHomeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyHouseListOnHomeModel());

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
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.comments_disabled_outlined,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 80.0,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '아직 등록된 숙소가 없습니다.',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).labelLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
