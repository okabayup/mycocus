import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'ganti_siklus_widget.dart' show GantiSiklusWidget;
import 'package:flutter/material.dart';

class GantiSiklusModel extends FlutterFlowModel<GantiSiklusWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for beratTebar widget.
  int? beratTebarValue;
  // State field(s) for beratPanen widget.
  int? beratPanenValue;
  // State field(s) for ikan widget.
  String? ikanValue;
  FormFieldController<String>? ikanValueController;
  DateTime? datePicked1;
  DateTime? datePicked2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
