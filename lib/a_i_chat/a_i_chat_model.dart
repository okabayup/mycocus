import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'a_i_chat_widget.dart' show AIChatWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class AIChatModel extends FlutterFlowModel<AIChatWidget> {
  ///  Local state fields for this page.

  String jawabanTersimpan = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for chatArea widget.
  ScrollController? chatArea;
  // State field(s) for papanKetik widget.
  FocusNode? papanKetikFocusNode;
  TextEditingController? papanKetikController;
  String? Function(BuildContext, String?)? papanKetikControllerValidator;
  // Stores action output result for [Custom Action - chatGPT] action in IconButton widget.
  String? jawaban;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  AIchatRecord? hasilUpdate;
  // State field(s) for waktuTunggu widget.
  int waktuTungguMilliseconds = 0;
  String waktuTungguValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    minute: false,
    milliSecond: false,
  );
  FlutterFlowTimerController waktuTungguController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    chatArea = ScrollController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    chatArea?.dispose();
    papanKetikFocusNode?.dispose();
    papanKetikController?.dispose();

    waktuTungguController.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
