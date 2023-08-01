import '/components/social_contacts_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InsightsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for SocialContacts component.
  late SocialContactsModel socialContactsModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    socialContactsModel = createModel(context, () => SocialContactsModel());
  }

  void dispose() {
    unfocusNode.dispose();
    socialContactsModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
