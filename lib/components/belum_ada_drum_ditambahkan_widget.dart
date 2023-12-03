import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'belum_ada_drum_ditambahkan_model.dart';
export 'belum_ada_drum_ditambahkan_model.dart';

class BelumAdaDrumDitambahkanWidget extends StatefulWidget {
  const BelumAdaDrumDitambahkanWidget({super.key});

  @override
  _BelumAdaDrumDitambahkanWidgetState createState() =>
      _BelumAdaDrumDitambahkanWidgetState();
}

class _BelumAdaDrumDitambahkanWidgetState
    extends State<BelumAdaDrumDitambahkanWidget> {
  late BelumAdaDrumDitambahkanModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BelumAdaDrumDitambahkanModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: const AlignmentDirectional(0.00, 0.00),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: Image.network(
                'https://cdn-icons-png.flaticon.com/128/40/40162.png',
                width: 75.0,
                height: 75.0,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  '15juqk6j' /* Belum Ada
Drum Ditambahkan */
                  ,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).gray600,
                      fontWeight: FontWeight.normal,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
