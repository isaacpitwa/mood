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
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 20.0),
                    child: Container(
                      width: double.infinity,
                      height: 150.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                                          image: Image.asset(
                                            'assets/images/angry.png',
                                          ).image,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'f7mgnajd' /* Today, 29th July */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'h63afqia' /* Super Furious */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'dm5il3e5' /* Beacause of work presure, Bike... */,
                              ),
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 20.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '85jgqsry' /* Mood analysis */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                                FlutterFlowDropDown<String>(
                                  controller: _model.dropDownValueController ??=
                                      FormFieldController<String>(
                                    _model.dropDownValue ??=
                                        FFLocalizations.of(context).getText(
                                      't8566tgl' /* Last Week */,
                                    ),
                                  ),
                                  options: [
                                    FFLocalizations.of(context).getText(
                                      '59qtsdtp' /* Last Week */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'rmna9zr3' /* Last Month */,
                                    )
                                  ],
                                  onChanged: (val) => setState(
                                      () => _model.dropDownValue = val),
                                  width: 103.0,
                                  height: 30.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    'd5clr4bd' /* Please select... */,
                                  ),
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: Color(0x00EDF1F3),
                                  elevation: 0.0,
                                  borderColor: Color(0x00AAAAAA),
                                  borderWidth: 0.0,
                                  borderRadius: 4.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
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
                                      xData: List.generate(
                                          random_data.randomInteger(0, 0),
                                          (index) => random_data.randomImageUrl(
                                                0,
                                                0,
                                              )),
                                      yData: List.generate(
                                          random_data.randomInteger(0, 0),
                                          (index) => random_data.randomDate()),
                                      settings: LineChartBarData(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        barWidth: 1.0,
                                      ),
                                    )
                                  ],
                                  chartStylingInfo: ChartStylingInfo(
                                    backgroundColor: Color(0x00EDF1F3),
                                    showBorder: false,
                                  ),
                                  axisBounds: AxisBounds(),
                                  xAxisLabelInfo: AxisLabelInfo(),
                                  yAxisLabelInfo: AxisLabelInfo(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.socialContactsModel,
                    updateCallback: () => setState(() {}),
                    child: SocialContactsWidget(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
