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
import 'insights_model.dart';
export 'insights_model.dart';

class InsightsWidget extends StatefulWidget {
  const InsightsWidget({Key? key}) : super(key: key);

  @override
  _InsightsWidgetState createState() => _InsightsWidgetState();
}

class _InsightsWidgetState extends State<InsightsWidget> {
  late InsightsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InsightsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: StreamBuilder<List<MoodDataRecord>>(
            stream: queryMoodDataRecord(
              queryBuilder: (moodDataRecord) => moodDataRecord
                  .where('user_id', isEqualTo: currentUserReference)
                  .orderBy('date', descending: true),
              singleRecord: true,
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
              List<MoodDataRecord> listViewMoodDataRecordList = snapshot.data!;
              final listViewMoodDataRecord =
                  listViewMoodDataRecordList.isNotEmpty
                      ? listViewMoodDataRecordList.first
                      : null;
              return ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 10.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'x27fod7o' /* Insights */,
                      ),
                      style: FlutterFlowTheme.of(context).titleLarge,
                    ),
                  ),
                  if (listViewMoodDataRecord != null)
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 10.0, 20.0, 20.0),
                          child: Container(
                            width: double.infinity,
                            height: 150.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Material(
                                          color: Colors.transparent,
                                          elevation: 0.0,
                                          child: Container(
                                            width: 36.0,
                                            height: 36.0,
                                            decoration: BoxDecoration(
                                              color: Color(0x00EDF1F3),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.network(
                                                  () {
                                                    if (listViewMoodDataRecord
                                                            ?.mood ==
                                                        1) {
                                                      return 'https://firebasestorage.googleapis.com/v0/b/chilli-mood.appspot.com/o/Assets%2Femoji.png?alt=media&token=d800c1cf-a413-4388-8ab7-885bc6c9e839';
                                                    } else if (listViewMoodDataRecord
                                                            ?.mood ==
                                                        2) {
                                                      return 'https://firebasestorage.googleapis.com/v0/b/chilli-mood.appspot.com/o/Assets%2Femoji%20(2).png?alt=media&token=b3e42614-a71d-490b-8d8e-71858bee4f23';
                                                    } else if (listViewMoodDataRecord
                                                            ?.mood ==
                                                        3) {
                                                      return 'https://firebasestorage.googleapis.com/v0/b/chilli-mood.appspot.com/o/Assets%2Femoji%20(1).png?alt=media&token=3f9e2dbc-112b-438b-b2a4-dde4fe50b401';
                                                    } else if (listViewMoodDataRecord
                                                            ?.mood ==
                                                        4) {
                                                      return 'https://firebasestorage.googleapis.com/v0/b/chilli-mood.appspot.com/o/Assets%2Fangry.png?alt=media&token=e925c638-e8d6-4ffe-addb-69c75ec6df40';
                                                    } else {
                                                      return 'https://firebasestorage.googleapis.com/v0/b/chilli-mood.appspot.com/o/Assets%2Fstar%201.png?alt=media&token=92083418-b4a8-47b1-9478-75571918ef04';
                                                    }
                                                  }(),
                                                ).image,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          dateTimeFormat(
                                            'relative',
                                            listViewMoodDataRecord!.date!,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    () {
                                      if (listViewMoodDataRecord?.mood == 4) {
                                        return 'Super Lovely';
                                      } else if (listViewMoodDataRecord?.mood ==
                                          3) {
                                        return 'Sad';
                                      } else if (listViewMoodDataRecord?.mood ==
                                          2) {
                                        return 'Frustrated';
                                      } else if (listViewMoodDataRecord?.mood ==
                                          1) {
                                        return 'Super Furious';
                                      } else {
                                        return 'Super Excited';
                                      }
                                    }(),
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                  ),
                                  Text(
                                    listViewMoodDataRecord!.description,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 10.0, 20.0, 20.0),
                          child: StreamBuilder<List<MoodDataRecord>>(
                            stream: queryMoodDataRecord(
                              queryBuilder: (moodDataRecord) => moodDataRecord
                                  .where('user_id',
                                      isEqualTo: currentUserReference)
                                  .where('date',
                                      isGreaterThanOrEqualTo:
                                          functions.sevenDaysBack()),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: SpinKitCircle(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }
                              List<MoodDataRecord> containerMoodDataRecordList =
                                  snapshot.data!;
                              return Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 16.0, 16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '85jgqsry' /* Mood analysis */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownValueController ??=
                                                FormFieldController<String>(
                                              _model.dropDownValue ??=
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                't8566tgl' /* Last Week */,
                                              ),
                                            ),
                                            options: [
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '59qtsdtp' /* Last Week */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'rmna9zr3' /* Last Month */,
                                              )
                                            ],
                                            onChanged: (val) => setState(() =>
                                                _model.dropDownValue = val),
                                            width: 103.0,
                                            height: 30.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'd5clr4bd' /* Please select... */,
                                            ),
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor: Color(0x00EDF1F3),
                                            elevation: 0.0,
                                            borderColor: Color(0x00AAAAAA),
                                            borderWidth: 0.0,
                                            borderRadius: 4.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 4.0),
                                            hidesUnderline: true,
                                            isSearchable: false,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'f9nmfwan' /* How your mood changes over tim... */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 14.0,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 28.0, 0.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 350.0,
                                          child: FlutterFlowLineChart(
                                            data: [
                                              FFLineChartData(
                                                xData:
                                                    containerMoodDataRecordList
                                                        .map((d) => d.day)
                                                        .toList(),
                                                yData:
                                                    containerMoodDataRecordList
                                                        .map((d) => d.mood)
                                                        .toList(),
                                                settings: LineChartBarData(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  barWidth: 1.0,
                                                ),
                                              )
                                            ],
                                            chartStylingInfo: ChartStylingInfo(
                                              backgroundColor:
                                                  Color(0x00EDF1F3),
                                              showBorder: false,
                                            ),
                                            axisBounds: AxisBounds(),
                                            xAxisLabelInfo: AxisLabelInfo(
                                              title: FFLocalizations.of(context)
                                                  .getText(
                                                'd5pu64da' /* Date */,
                                              ),
                                              titleTextStyle: TextStyle(
                                                fontSize: 14.0,
                                              ),
                                            ),
                                            yAxisLabelInfo: AxisLabelInfo(
                                              title: FFLocalizations.of(context)
                                                  .getText(
                                                'bmj0i6w0' /* Mood */,
                                              ),
                                              titleTextStyle: TextStyle(
                                                fontSize: 14.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  if (!(listViewMoodDataRecord != null))
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      child: wrapWithModel(
                        model: _model.emptyMoodRecordModel,
                        updateCallback: () => setState(() {}),
                        child: EmptyMoodRecordWidget(),
                      ),
                    ),
                  wrapWithModel(
                    model: _model.socialContactsModel,
                    updateCallback: () => setState(() {}),
                    child: SocialContactsWidget(),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
