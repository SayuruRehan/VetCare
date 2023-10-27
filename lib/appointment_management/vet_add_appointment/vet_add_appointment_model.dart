import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
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
  final formKey = GlobalKey<FormState>();
  // State field(s) for vetName widget.
  FocusNode? vetNameFocusNode1;
  TextEditingController? vetNameController1;
  String? Function(BuildContext, String?)? vetNameController1Validator;
  // State field(s) for vetSpeciality widget.
  FocusNode? vetSpecialityFocusNode;
  TextEditingController? vetSpecialityController;
  String? Function(BuildContext, String?)? vetSpecialityControllerValidator;
  String? _vetSpecialityControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'bmhohbx2' /* Pet name is required */,
      );
    }

    return null;
  }

  // State field(s) for vetName widget.
  FocusNode? vetNameFocusNode2;
  TextEditingController? vetNameController2;
  String? Function(BuildContext, String?)? vetNameController2Validator;
  DateTime? datePicked;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    vetSpecialityControllerValidator = _vetSpecialityControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    vetNameFocusNode1?.dispose();
    vetNameController1?.dispose();

    vetSpecialityFocusNode?.dispose();
    vetSpecialityController?.dispose();

    vetNameFocusNode2?.dispose();
    vetNameController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
