import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'vet_add_appointment_widget.dart' show VetAddAppointmentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VetAddAppointmentModel extends FlutterFlowModel<VetAddAppointmentWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for dropDownVet widget.
  String? dropDownVetValue;
  FormFieldController<String>? dropDownVetValueController;
  // State field(s) for DropDownSpeciality widget.
  String? dropDownSpecialityValue;
  FormFieldController<String>? dropDownSpecialityValueController;
  // State field(s) for vetName widget.
  FocusNode? vetNameFocusNode;
  TextEditingController? vetNameController;
  String? Function(BuildContext, String?)? vetNameControllerValidator;
  // State field(s) for date widget.
  FocusNode? dateFocusNode;
  TextEditingController? dateController;
  String? Function(BuildContext, String?)? dateControllerValidator;
  DateTime? datePicked;
  // State field(s) for time widget.
  FocusNode? timeFocusNode;
  TextEditingController? timeController;
  String? Function(BuildContext, String?)? timeControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    vetNameFocusNode?.dispose();
    vetNameController?.dispose();

    dateFocusNode?.dispose();
    dateController?.dispose();

    timeFocusNode?.dispose();
    timeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
