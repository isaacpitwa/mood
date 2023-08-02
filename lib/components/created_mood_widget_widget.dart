import '/backend/backend.dart';
import '/components/activity_widget_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'created_mood_widget_model.dart';
export 'created_mood_widget_model.dart';

class CreatedMoodWidgetWidget extends StatefulWidget {
  const CreatedMoodWidgetWidget({
    Key? key,
    this.mood,
  }) : super(key: key);

  final int? mood;

  @override
  _CreatedMoodWidgetWidgetState createState() =>
      _CreatedMoodWidgetWidgetState();
}

class _CreatedMoodWidgetWidgetState extends State<CreatedMoodWidgetWidget> {
  late CreatedMoodWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreatedMoodWidgetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(18.0, 18.0, 18.0, 18.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(18.0, 18.0, 18.0, 18.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Color(0x00FF023F),
                    borderRadius: 18.0,
                    buttonSize: 40.0,
                    fillColor: Color(0x004B39EF),
                    icon: Icon(
                      FFIcons.kepCloseBold,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.pushNamed(
                        'dashboard',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                          ),
                        },
                      );
                    },
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    () {
                      if (widget.mood == 1) {
                        return 'https://firebasestorage.googleapis.com/v0/b/chilli-mood.appspot.com/o/Assets%2Femoji.png?alt=media&token=d800c1cf-a413-4388-8ab7-885bc6c9e839';
                      } else if (widget.mood == 2) {
                        return 'https://firebasestorage.googleapis.com/v0/b/chilli-mood.appspot.com/o/Assets%2Femoji%20(2).png?alt=media&token=b3e42614-a71d-490b-8d8e-71858bee4f23';
                      } else if (widget.mood == 3) {
                        return 'https://firebasestorage.googleapis.com/v0/b/chilli-mood.appspot.com/o/Assets%2Femoji%20(1).png?alt=media&token=3f9e2dbc-112b-438b-b2a4-dde4fe50b401';
                      } else if (widget.mood == 4) {
                        return 'https://firebasestorage.googleapis.com/v0/b/chilli-mood.appspot.com/o/Assets%2Fangry.png?alt=media&token=e925c638-e8d6-4ffe-addb-69c75ec6df40';
                      } else {
                        return 'https://firebasestorage.googleapis.com/v0/b/chilli-mood.appspot.com/o/Assets%2Fstar%201.png?alt=media&token=92083418-b4a8-47b1-9478-75571918ef04';
                      }
                    }(),
                    width: 100.0,
                    height: 100.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                () {
                  if (widget.mood == 1) {
                    return 'You’re in Grateful Mood Today ';
                  } else if (widget.mood == 2) {
                    return 'You’re in Sad Mood Today ';
                  } else if (widget.mood == 3) {
                    return 'You’re in Frustrated Mood Today ';
                  } else if (widget.mood == 4) {
                    return 'You’re in Angry Mood Today ';
                  } else {
                    return 'You’re in  Excited Mood Today ';
                  }
                }(),
                style: FlutterFlowTheme.of(context).bodyLarge,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 18.0),
                child: Text(
                  () {
                    if (widget.mood == 1) {
                      return 'Be thankful for the blessings in your life, big and small. Gratitude can bring warmth to even the coldest of days.';
                    } else if (widget.mood == 2) {
                      return 'It\'s okay to feel sad sometimes. Remember that this feeling won\'t last forever, and brighter days are ahead. I\'m here for you.';
                    } else if (widget.mood == 3) {
                      return 'It\'s alright to feel frustrated. Take a moment to step back, gather your thoughts, and remember that every challenge is an opportunity for growth.';
                    } else if (widget.mood == 4) {
                      return 'Take a deep breath. Embrace your emotions. Choose a calm response.';
                    } else {
                      return 'Embrace the excitement bubbling inside you! Life is full of adventures waiting to unfold. Enjoy the ride!';
                    }
                  }(),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ),
              Divider(
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).alternate,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'z198tjvu' /*  Activities to do in  this moo... */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 18.0),
                child: Container(
                  width: double.infinity,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Color(0x0014181B),
                  ),
                  child: StreamBuilder<List<ActivitiesRecord>>(
                    stream: queryActivitiesRecord(
                      queryBuilder: (activitiesRecord) => activitiesRecord
                          .where('mood', isEqualTo: widget.mood),
                      limit: 4,
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
                      List<ActivitiesRecord> listViewActivitiesRecordList =
                          snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        itemCount: listViewActivitiesRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewActivitiesRecord =
                              listViewActivitiesRecordList[listViewIndex];
                          return ActivityWidgetWidget(
                            key: Key(
                                'Keyimz_${listViewIndex}_of_${listViewActivitiesRecordList.length}'),
                            activity: listViewActivitiesRecord.activity,
                            icon: listViewActivitiesRecord.icon,
                            url: listViewActivitiesRecord.url,
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
