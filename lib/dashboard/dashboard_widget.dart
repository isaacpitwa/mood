import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/activity_widget_widget.dart';
import '/components/empty_mood_record_widget.dart';
import '/components/social_contacts_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'dashboard_model.dart';
export 'dashboard_model.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({Key? key}) : super(key: key);

  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  late DashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardModel());
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
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
                List<MoodDataRecord> listViewMoodDataRecordList =
                    snapshot.data!;
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
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'mlqp11g0' /* Dashboard */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderRadius: 20.0,
                                      borderWidth: 0.0,
                                      buttonSize: 40.0,
                                      fillColor: Color(0x004B39EF),
                                      icon: Icon(
                                        Icons.settings_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        context.pushNamed(
                                          'profile',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType
                                                  .rightToLeft,
                                              duration:
                                                  Duration(milliseconds: 200),
                                            ),
                                          },
                                        );
                                      },
                                    ),
                                    if (Theme.of(context).brightness ==
                                        Brightness.dark)
                                      FlutterFlowIconButton(
                                        borderColor: Color(0x00FF023F),
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        fillColor: Color(0x004B39EF),
                                        icon: Icon(
                                          Icons.sunny,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          setDarkModeSetting(
                                              context, ThemeMode.light);
                                        },
                                      ),
                                    if (Theme.of(context).brightness ==
                                        Brightness.light)
                                      FlutterFlowIconButton(
                                        borderColor: Color(0x00FF023F),
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        fillColor: Color(0x004B39EF),
                                        icon: FaIcon(
                                          FontAwesomeIcons.solidMoon,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          setDarkModeSetting(
                                              context, ThemeMode.dark);
                                        },
                                      ),
                                  ].divide(SizedBox(width: 2.0)),
                                ),
                              ],
                            ),
                          ),
                          if (listViewMoodDataRecord != null)
                            Container(
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
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.emoji_emotions_outlined,
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? FlutterFlowTheme.of(context)
                                                      .info
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 28.0,
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '3d7onptp' /* MOOD CHECK */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .info
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                  ),
                                            ),
                                          ].divide(SizedBox(width: 4.0)),
                                        ),
                                        Text(
                                          dateTimeFormat(
                                            'relative',
                                            listViewMoodDataRecord!.date!,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .info
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 8.0, 8.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 1.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x96CECECE),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 32.0, 0.0, 28.0),
                                      child: Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            () {
                                              if (listViewMoodDataRecord
                                                      ?.mood ==
                                                  4) {
                                                return 'https://firebasestorage.googleapis.com/v0/b/chilli-mood.appspot.com/o/Assets%2Femoji.png?alt=media&token=d800c1cf-a413-4388-8ab7-885bc6c9e839';
                                              } else if (listViewMoodDataRecord
                                                      ?.mood ==
                                                  3) {
                                                return 'https://firebasestorage.googleapis.com/v0/b/chilli-mood.appspot.com/o/Assets%2Femoji%20(2).png?alt=media&token=b3e42614-a71d-490b-8d8e-71858bee4f23';
                                              } else if (listViewMoodDataRecord
                                                      ?.mood ==
                                                  2) {
                                                return 'https://firebasestorage.googleapis.com/v0/b/chilli-mood.appspot.com/o/Assets%2Femoji%20(1).png?alt=media&token=3f9e2dbc-112b-438b-b2a4-dde4fe50b401';
                                              } else if (listViewMoodDataRecord
                                                      ?.mood ==
                                                  1) {
                                                return 'https://firebasestorage.googleapis.com/v0/b/chilli-mood.appspot.com/o/Assets%2Fangry.png?alt=media&token=e925c638-e8d6-4ffe-addb-69c75ec6df40';
                                              } else {
                                                return 'https://firebasestorage.googleapis.com/v0/b/chilli-mood.appspot.com/o/Assets%2Fstar%201.png?alt=media&token=92083418-b4a8-47b1-9478-75571918ef04';
                                              }
                                            }(),
                                            width: 300.0,
                                            height: 200.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 16.0),
                                      child: Text(
                                        () {
                                          if (listViewMoodDataRecord?.mood ==
                                              4) {
                                            return 'You’re in Grateful Mood  ';
                                          } else if (listViewMoodDataRecord
                                                  ?.mood ==
                                              3) {
                                            return 'You’re in  Lonely  Mood  ';
                                          } else if (listViewMoodDataRecord
                                                  ?.mood ==
                                              2) {
                                            return 'You’re in Frustrated  Mood  ';
                                          } else if (listViewMoodDataRecord
                                                  ?.mood ==
                                              1) {
                                            return 'You’re in  Angry  Mood  ';
                                          } else {
                                            return 'You’re in Excited  Mood  ';
                                          }
                                        }(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? FlutterFlowTheme.of(context)
                                                      .info
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: Text(
                                        () {
                                          if (listViewMoodDataRecord?.mood ==
                                              3) {
                                            return 'It\'s alright to feel frustrated. Take a moment to step back, gather your thoughts, and remember that every challenge is an opportunity for growth.';
                                          } else if (listViewMoodDataRecord
                                                  ?.mood ==
                                              4) {
                                            return 'Take a deep breath. Embrace your emotions. Choose a calm response.';
                                          } else if (listViewMoodDataRecord
                                                  ?.mood ==
                                              5) {
                                            return 'Embrace the excitement bubbling inside you! Life is full of adventures waiting to unfold. Enjoy the ride!';
                                          } else if (listViewMoodDataRecord
                                                  ?.mood ==
                                              1) {
                                            return 'Even in moments of solitude, remember that you are never truly alone. Reach out to someone you trust or find comfort in the beauty of self-discovery.';
                                          } else if (listViewMoodDataRecord
                                                  ?.mood ==
                                              2) {
                                            return 'It\'s okay to feel sad sometimes. Remember that this feeling won\'t last forever, and brighter days are ahead. I\'m here for you.';
                                          } else {
                                            return 'It\'s alright to feel frustrated. Take a moment to step back, gather your thoughts, and remember that every challenge is an opportunity for growth.';
                                          }
                                        }(),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? FlutterFlowTheme.of(context)
                                                      .info
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 14.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (!(listViewMoodDataRecord != null))
                      wrapWithModel(
                        model: _model.emptyMoodRecordModel,
                        updateCallback: () => setState(() {}),
                        child: EmptyMoodRecordWidget(),
                      ),
                    if (listViewMoodDataRecord != null)
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'rb1w0poa' /* Recommended Activities */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Container(
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: PagedListView<DocumentSnapshot<Object?>?,
                                  ActivitiesRecord>(
                                pagingController: _model.setListViewController2(
                                  ActivitiesRecord.collection.where('mood',
                                      isEqualTo: listViewMoodDataRecord?.mood),
                                ),
                                padding: EdgeInsets.zero,
                                reverse: false,
                                scrollDirection: Axis.horizontal,
                                builderDelegate:
                                    PagedChildBuilderDelegate<ActivitiesRecord>(
                                  // Customize what your widget looks like when it's loading the first page.
                                  firstPageProgressIndicatorBuilder: (_) =>
                                      Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: SpinKitCircle(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 50.0,
                                      ),
                                    ),
                                  ),
                                  // Customize what your widget looks like when it's loading another page.
                                  newPageProgressIndicatorBuilder: (_) =>
                                      Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: SpinKitCircle(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 50.0,
                                      ),
                                    ),
                                  ),

                                  itemBuilder: (context, _, listViewIndex) {
                                    final listViewActivitiesRecord = _model
                                        .listViewPagingController2!
                                        .itemList![listViewIndex];
                                    return ActivityWidgetWidget(
                                      key: Key(
                                          'Key7ht_${listViewIndex}_of_${_model.listViewPagingController2!.itemList!.length}'),
                                      activity:
                                          listViewActivitiesRecord.activity,
                                      icon: listViewActivitiesRecord.icon,
                                      url: listViewActivitiesRecord.url,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
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
      ),
    );
  }
}
