import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'empty_reservation_list_model.dart';
export 'empty_reservation_list_model.dart';

class EmptyReservationListWidget extends StatefulWidget {
  const EmptyReservationListWidget({super.key});

  @override
  State<EmptyReservationListWidget> createState() =>
      _EmptyReservationListWidgetState();
}

class _EmptyReservationListWidgetState
    extends State<EmptyReservationListWidget> {
  late EmptyReservationListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyReservationListModel());

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
            Icon(
              Icons.home_sharp,
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
                    '예약된 숙소가 없습니다.',
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
