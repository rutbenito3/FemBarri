import '/flutter_flow/flutter_flow_util.dart';
import 'registre_widget.dart' show RegistreWidget;
import 'package:flutter/material.dart';


class RegistreModel extends FlutterFlowModel<RegistreWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for txb_nomUsuari widget.
  FocusNode? txbNomUsuariFocusNode;
  TextEditingController? txbNomUsuariController;
  String? Function(BuildContext, String?)? txbNomUsuariControllerValidator;
  // State field(s) for txb_cognomUsuari widget.
  FocusNode? txbCognomUsuariFocusNode;
  TextEditingController? txbCognomUsuariController;
  String? Function(BuildContext, String?)? txbCognomUsuariControllerValidator;
  // State field(s) for txb_email widget.
  FocusNode? txbEmailFocusNode;
  TextEditingController? txbEmailController;
  String? Function(BuildContext, String?)? txbEmailControllerValidator;
  // State field(s) for txb_password widget.
  FocusNode? txbPasswordFocusNode;
  TextEditingController? txbPasswordController;
  late bool txbPasswordVisibility;
  String? Function(BuildContext, String?)? txbPasswordControllerValidator;
  // State field(s) for txb_passwordConfirm widget.
  FocusNode? txbPasswordConfirmFocusNode;
  TextEditingController? txbPasswordConfirmController;
  late bool txbPasswordConfirmVisibility;
  String? Function(BuildContext, String?)?
      txbPasswordConfirmControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txbPasswordVisibility = false;
    txbPasswordConfirmVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    txbNomUsuariFocusNode?.dispose();
    txbNomUsuariController?.dispose();

    txbCognomUsuariFocusNode?.dispose();
    txbCognomUsuariController?.dispose();

    txbEmailFocusNode?.dispose();
    txbEmailController?.dispose();

    txbPasswordFocusNode?.dispose();
    txbPasswordController?.dispose();

    txbPasswordConfirmFocusNode?.dispose();
    txbPasswordConfirmController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
