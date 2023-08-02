import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/reminder_widget_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DailyRemindersModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Switch widget.
  bool? switchValue;
  // Models for ReminderWidget dynamic component.
  late FlutterFlowDynamicModels<ReminderWidgetModel> reminderWidgetModels;
  DateTime? datePicked;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    reminderWidgetModels =
        FlutterFlowDynamicModels(() => ReminderWidgetModel());
  }

  void dispose() {
    reminderWidgetModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
