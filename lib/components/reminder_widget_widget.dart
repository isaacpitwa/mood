import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reminder_widget_model.dart';
export 'reminder_widget_model.dart';

class ReminderWidgetWidget extends StatefulWidget {
  const ReminderWidgetWidget({
    Key? key,
    required this.time,
  }) : super(key: key);

  final DateTime? time;

  @override
  _ReminderWidgetWidgetState createState() => _ReminderWidgetWidgetState();
}

class _ReminderWidgetWidgetState extends State<ReminderWidgetWidget> {
  late ReminderWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReminderWidgetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return ListTile(
      title: Text(
        dateTimeFormat(
          'Hm',
          widget.time,
          locale: FFLocalizations.of(context).languageCode,
        ),
        style: FlutterFlowTheme.of(context).labelMedium.override(
              fontFamily: 'Poppins',
              color: FlutterFlowTheme.of(context).primaryText,
            ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: FlutterFlowTheme.of(context).secondaryText,
        size: 20.0,
      ),
      tileColor: FlutterFlowTheme.of(context).accent4,
      dense: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
    );
  }
}
