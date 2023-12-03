import '/flutter_flow/flutter_flow_util.dart';
import 'profile_picture_widget.dart' show ProfilePictureWidget;
import 'package:flutter/material.dart';

class ProfilePictureModel extends FlutterFlowModel<ProfilePictureWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

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
