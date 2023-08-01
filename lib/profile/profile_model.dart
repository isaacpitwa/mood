import '/auth/firebase_auth/auth_util.dart';
import '/components/social_contacts_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for SocialContacts component.
  late SocialContactsModel socialContactsModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    socialContactsModel = createModel(context, () => SocialContactsModel());
  }

  void dispose() {
    socialContactsModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
