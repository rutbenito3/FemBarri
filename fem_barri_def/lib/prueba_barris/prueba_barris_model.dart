import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'prueba_barris_widget.dart' show PruebaBarrisWidget;
import 'package:flutter/material.dart';

class PruebaBarrisModel extends FlutterFlowModel<PruebaBarrisWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for CheckboxListTile widget.

  Map<BarrisRow, bool> checkboxListTileValueMap = {};
  List<BarrisRow> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
