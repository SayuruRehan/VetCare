import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'add_pet_widget.dart' show AddPetWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddPetModel extends FlutterFlowModel<AddPetWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for petName widget.
  FocusNode? petNameFocusNode;
  TextEditingController? petNameController;
  String? Function(BuildContext, String?)? petNameControllerValidator;
  String? _petNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'i1p98glj' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for breed widget.
  FocusNode? breedFocusNode;
  TextEditingController? breedController;
  String? Function(BuildContext, String?)? breedControllerValidator;
  String? _breedControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '9p9ts8a5' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for age widget.
  FocusNode? ageFocusNode;
  TextEditingController? ageController;
  String? Function(BuildContext, String?)? ageControllerValidator;
  String? _ageControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'p1b8c2fl' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for weight widget.
  FocusNode? weightFocusNode;
  TextEditingController? weightController;
  String? Function(BuildContext, String?)? weightControllerValidator;
  String? _weightControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'oqxl9d8r' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for gender widget.
  FocusNode? genderFocusNode;
  TextEditingController? genderController;
  String? Function(BuildContext, String?)? genderControllerValidator;
  String? _genderControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'w6lny30l' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for ownerName widget.
  FocusNode? ownerNameFocusNode;
  TextEditingController? ownerNameController;
  String? Function(BuildContext, String?)? ownerNameControllerValidator;
  String? _ownerNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '2uv93xf4' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for ownerPhone widget.
  FocusNode? ownerPhoneFocusNode;
  TextEditingController? ownerPhoneController;
  String? Function(BuildContext, String?)? ownerPhoneControllerValidator;
  String? _ownerPhoneControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'cgls1ur5' /* Field is required */,
      );
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    petNameControllerValidator = _petNameControllerValidator;
    breedControllerValidator = _breedControllerValidator;
    ageControllerValidator = _ageControllerValidator;
    weightControllerValidator = _weightControllerValidator;
    genderControllerValidator = _genderControllerValidator;
    ownerNameControllerValidator = _ownerNameControllerValidator;
    ownerPhoneControllerValidator = _ownerPhoneControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    petNameFocusNode?.dispose();
    petNameController?.dispose();

    breedFocusNode?.dispose();
    breedController?.dispose();

    ageFocusNode?.dispose();
    ageController?.dispose();

    weightFocusNode?.dispose();
    weightController?.dispose();

    genderFocusNode?.dispose();
    genderController?.dispose();

    ownerNameFocusNode?.dispose();
    ownerNameController?.dispose();

    ownerPhoneFocusNode?.dispose();
    ownerPhoneController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
