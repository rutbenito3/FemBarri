import '/flutter_flow/flutter_flow_util.dart';
import 'aportacions_widget.dart' show AportacionsWidget;
import 'package:flutter/material.dart';

class AportacionsModel extends FlutterFlowModel<AportacionsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
