import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'emphasized_container_model.dart';
export 'emphasized_container_model.dart';

class EmphasizedContainerWidget extends StatefulWidget {
  const EmphasizedContainerWidget({
    super.key,
    required this.icon,
    String? text,
  }) : text = text ?? 'Emphasized Container';

  final Widget? icon;
  final String text;

  @override
  State<EmphasizedContainerWidget> createState() =>
      _EmphasizedContainerWidgetState();
}

class _EmphasizedContainerWidgetState extends State<EmphasizedContainerWidget> {
  late EmphasizedContainerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmphasizedContainerModel());

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

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
      child: Container(
        height: 100.0,
        constraints: const BoxConstraints(
          minWidth: 80.0,
          minHeight: 40.0,
          maxWidth: double.infinity,
          maxHeight: 40.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).accent3,
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Align(
          alignment: const AlignmentDirectional(-1.0, 0.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 0.0, 4.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                widget.icon!,
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                  child: Text(
                    widget.text,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
