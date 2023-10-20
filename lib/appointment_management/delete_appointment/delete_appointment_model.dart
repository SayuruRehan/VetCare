import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'delete_appointment_widget.dart' show DeleteAppointmentWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeleteAppointmentModel extends FlutterFlowModel<DeleteAppointmentWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for vetName widget.
  FocusNode? vetNameFocusNode1;
  TextEditingController? vetNameController1;
  String? Function(BuildContext, String?)? vetNameController1Validator;
  // State field(s) for vetName widget.
  FocusNode? vetNameFocusNode2;
  TextEditingController? vetNameController2;
  String? Function(BuildContext, String?)? vetNameController2Validator;
  // State field(s) for vetName widget.
  FocusNode? vetNameFocusNode3;
  TextEditingController? vetNameController3;
  String? Function(BuildContext, String?)? vetNameController3Validator;
  DateTime? datePicked;
  // State field(s) for date widget.
  FocusNode? dateFocusNode;
  TextEditingController? dateController;
  String? Function(BuildContext, String?)? dateControllerValidator;
  // State field(s) for time widget.
  FocusNode? timeFocusNode;
  TextEditingController? timeController;
  String? Function(BuildContext, String?)? timeControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    vetNameFocusNode1?.dispose();
    vetNameController1?.dispose();

    vetNameFocusNode2?.dispose();
    vetNameController2?.dispose();

    vetNameFocusNode3?.dispose();
    vetNameController3?.dispose();

    dateFocusNode?.dispose();
    dateController?.dispose();

    timeFocusNode?.dispose();
    timeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
