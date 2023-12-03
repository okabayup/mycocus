import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'setting_drum_widget.dart' show SettingDrumWidget;
import 'package:flutter/material.dart';

class SettingDrumModel extends FlutterFlowModel<SettingDrumWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for PersenPakan widget.
  int? persenPakanValue;
  // State field(s) for Jam1 widget.
  int? jam1Value;
  // State field(s) for Jam2 widget.
  int? jam2Value;
  // State field(s) for Jam3 widget.
  int? jam3Value;
  // State field(s) for JamGantiAir widget.
  int? jamGantiAirValue;
  // State field(s) for persenGantiAir widget.
  int? persenGantiAirValue;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DrumSettingRecord? dataSetting;

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
