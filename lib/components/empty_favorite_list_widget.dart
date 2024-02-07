import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'empty_favorite_list_model.dart';
export 'empty_favorite_list_model.dart';

class EmptyFavoriteListWidget extends StatefulWidget {
  const EmptyFavoriteListWidget({super.key});

  @override
  State<EmptyFavoriteListWidget> createState() =>
      _EmptyFavoriteListWidgetState();
}

class _EmptyFavoriteListWidgetState extends State<EmptyFavoriteListWidget> {
  late EmptyFavoriteListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyFavoriteListModel());

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
        width: 280.0,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.heartBroken,
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
                    '마음에 드는 숙소의 하트를 눌러\n위시리스트에 담아 보세요.',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).labelSmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
