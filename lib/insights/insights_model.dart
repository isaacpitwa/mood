import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_mood_record_widget.dart';
import '/components/social_contacts_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InsightsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for EmptyMoodRecord component.
  late EmptyMoodRecordModel emptyMoodRecordModel;
  // Model for SocialContacts component.
  late SocialContactsModel socialContactsModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    emptyMoodRecordModel = createModel(context, () => EmptyMoodRecordModel());
    socialContactsModel = createModel(context, () => SocialContactsModel());
  }

  void dispose() {
    unfocusNode.dispose();
    emptyMoodRecordModel.dispose();
    socialContactsModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
