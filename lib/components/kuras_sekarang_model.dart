import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'kuras_sekarang_widget.dart' show KurasSekarangWidget;
import 'package:flutter/material.dart';

class KurasSekarangModel extends FlutterFlowModel<KurasSekarangWidget> {
  ///  Local state fields for this component.

  int state = 0;

  int isi = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (MQTT)] action in Button widget.
  ApiCallResponse? kuras;
  // Stores action output result for [Backend Call - API (MQTT)] action in Button widget.
  ApiCallResponse? isiAir;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
