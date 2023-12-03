import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'belanja_bahan_widget.dart' show BelanjaBahanWidget;
import 'package:flutter/material.dart';

class BelanjaBahanModel extends FlutterFlowModel<BelanjaBahanWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for ListView widget.
  ScrollController? listViewController1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for ListView widget.
  ScrollController? listViewController2;
  // State field(s) for Column widget.
  ScrollController? columnController3;
  // State field(s) for ListView widget.
  ScrollController? listViewController3;
  // State field(s) for Column widget.
  ScrollController? columnController4;
  // State field(s) for ListView widget.
  ScrollController? listViewController4;
  // State field(s) for ListView widget.
  ScrollController? listViewController5;
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    listViewController1 = ScrollController();
    columnController2 = ScrollController();
    listViewController2 = ScrollController();
    columnController3 = ScrollController();
    listViewController3 = ScrollController();
    columnController4 = ScrollController();
    listViewController4 = ScrollController();
    listViewController5 = ScrollController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    tabBarController?.dispose();
    columnController1?.dispose();
    listViewController1?.dispose();
    columnController2?.dispose();
    listViewController2?.dispose();
    columnController3?.dispose();
    listViewController3?.dispose();
    columnController4?.dispose();
    listViewController4?.dispose();
    listViewController5?.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
