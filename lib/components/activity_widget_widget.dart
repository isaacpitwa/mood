import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'activity_widget_model.dart';
export 'activity_widget_model.dart';

class ActivityWidgetWidget extends StatefulWidget {
  const ActivityWidgetWidget({
    Key? key,
    required this.activity,
    required this.icon,
    required this.url,
  }) : super(key: key);

  final String? activity;
  final String? icon;
  final String? url;

  @override
  _ActivityWidgetWidgetState createState() => _ActivityWidgetWidgetState();
}

class _ActivityWidgetWidgetState extends State<ActivityWidgetWidget> {
  late ActivityWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActivityWidgetModel());
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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          await launchURL(widget.url!);
        },
        child: Container(
          width: 100.0,
          height: 120.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).alternate,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    widget.icon!,
                    width: 32.0,
                    height: 32.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.activity,
                      'N/A',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
