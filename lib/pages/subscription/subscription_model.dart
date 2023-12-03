import '/components/paywall_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'subscription_widget.dart' show SubscriptionWidget;
import 'package:flutter/material.dart';

class SubscriptionModel extends FlutterFlowModel<SubscriptionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for paywall component.
  late PaywallModel paywallModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    paywallModel = createModel(context, () => PaywallModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    paywallModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
