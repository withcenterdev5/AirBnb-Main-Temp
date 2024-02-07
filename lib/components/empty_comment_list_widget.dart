import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'empty_comment_list_model.dart';
export 'empty_comment_list_model.dart';

class EmptyCommentListWidget extends StatefulWidget {
  const EmptyCommentListWidget({super.key});

  @override
  State<EmptyCommentListWidget> createState() => _EmptyCommentListWidgetState();
}

class _EmptyCommentListWidgetState extends State<EmptyCommentListWidget> {
  late EmptyCommentListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyCommentListModel());

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
      height: 100.0,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Align(
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Text(
          '아직, 후기가 없습니다.',
          style: FlutterFlowTheme.of(context).labelMedium,
        ),
      ),
    );
  }
}
