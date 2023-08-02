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
import 'daily_reminders_model.dart';
export 'daily_reminders_model.dart';

class DailyRemindersWidget extends StatefulWidget {
  const DailyRemindersWidget({Key? key}) : super(key: key);

  @override
  _DailyRemindersWidgetState createState() => _DailyRemindersWidgetState();
}

class _DailyRemindersWidgetState extends State<DailyRemindersWidget>
    with TickerProviderStateMixin {
  late DailyRemindersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'switchOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 600.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DailyRemindersModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<SettingsRecord>>(
      stream: querySettingsRecord(
        queryBuilder: (settingsRecord) =>
            settingsRecord.where('user_id', isEqualTo: currentUserReference),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitCircle(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<SettingsRecord> dailyRemindersSettingsRecordList = snapshot.data!;
        final dailyRemindersSettingsRecord =
            dailyRemindersSettingsRecordList.isNotEmpty
                ? dailyRemindersSettingsRecordList.first
                : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.chevron_left_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 30.0,
              ),
              onPressed: () async {
                context.safePop();
              },
            ),
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 18.0, 0.0),
                child: FlutterFlowIconButton(
                  borderColor: Color(0x00FF023F),
                  borderRadius: 20.0,
                  buttonSize: 40.0,
                  fillColor: Color(0x004B39EF),
                  icon: Icon(
                    Icons.add,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    final _datePickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(getCurrentTimestamp),
                    );
                    if (_datePickedTime != null) {
                      setState(() {
                        _model.datePicked = DateTime(
                          getCurrentTimestamp.year,
                          getCurrentTimestamp.month,
                          getCurrentTimestamp.day,
                          _datePickedTime.hour,
                          _datePickedTime.minute,
                        );
                      });
                    }

                    await RemindersRecord.collection
                        .doc()
                        .set(createRemindersRecordData(
                          time: _model.datePicked,
                          userId: currentUserReference,
                          createdAt: getCurrentTimestamp,
                        ));
                  },
                ),
              ),
            ],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x00F1F4F8),
                          offset: Offset(0.0, 0.0),
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'k9tfyt34' /* Daily Reminders */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'Poppins',
                                fontSize: 20.0,
                              ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'jx7i1mpb' /* By creating repetition with yo... */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFFAAAAAA),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 12.0, 0.0, 12.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'rs9eiz66' /* Daily Reminders */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 18.0,
                                ),
                          ),
                        ),
                        Switch.adaptive(
                          value: _model.switchValue ??= false,
                          onChanged: (newValue) async {
                            setState(() => _model.switchValue = newValue!);
                            if (newValue!) {
                              await dailyRemindersSettingsRecord!.reference
                                  .update(createSettingsRecordData(
                                reminders: true,
                                updatedAt: getCurrentTimestamp,
                              ));
                            } else {
                              await dailyRemindersSettingsRecord!.reference
                                  .update(createSettingsRecordData(
                                reminders: false,
                                updatedAt: getCurrentTimestamp,
                              ));
                            }
                          },
                          activeColor: FlutterFlowTheme.of(context).primary,
                          activeTrackColor: Color(0xFF011930),
                          inactiveTrackColor: Color(0xFFCECECE),
                          inactiveThumbColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ).animateOnActionTrigger(
                          animationsMap['switchOnActionTriggerAnimation']!,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: FlutterFlowTheme.of(context).accent4,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: StreamBuilder<List<RemindersRecord>>(
                    stream: queryRemindersRecord(
                      queryBuilder: (remindersRecord) => remindersRecord
                          .where('user_id', isEqualTo: currentUserReference)
                          .orderBy('createdAt', descending: true),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: SpinKitCircle(
                              color: FlutterFlowTheme.of(context).primary,
                              size: 50.0,
                            ),
                          ),
                        );
                      }
                      List<RemindersRecord> columnRemindersRecordList =
                          snapshot.data!;
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(
                            columnRemindersRecordList.length, (columnIndex) {
                          final columnRemindersRecord =
                              columnRemindersRecordList[columnIndex];
                          return wrapWithModel(
                            model: _model.reminderWidgetModels.getModel(
                              columnRemindersRecord.reference.id,
                              columnIndex,
                            ),
                            updateCallback: () => setState(() {}),
                            child: ReminderWidgetWidget(
                              key: Key(
                                'Keyf38_${columnRemindersRecord.reference.id}',
                              ),
                              time: columnRemindersRecord.time!,
                            ),
                          );
                        }),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
