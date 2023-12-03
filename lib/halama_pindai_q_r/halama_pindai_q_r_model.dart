import '/flutter_flow/flutter_flow_util.dart';
import 'halama_pindai_q_r_widget.dart' show HalamaPindaiQRWidget;
import 'package:flutter/material.dart';

class HalamaPindaiQRModel extends FlutterFlowModel<HalamaPindaiQRWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  var drumQR = '';

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
