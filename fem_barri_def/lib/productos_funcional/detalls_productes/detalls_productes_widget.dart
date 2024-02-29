import 'package:fem_barri_def/xat/chat.dart';

import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'detalls_productes_model.dart';
export 'detalls_productes_model.dart';

class DetallsProductesWidget extends StatefulWidget {
  const DetallsProductesWidget({
    super.key,
    required this.nomProducte,
    this.aportatPer,
    this.nomUsuari,
  });

  final String? nomProducte;
  final String? aportatPer;
  final String? nomUsuari;

  @override
  State<DetallsProductesWidget> createState() => _DetallsProductesWidgetState();
}

class _DetallsProductesWidgetState extends State<DetallsProductesWidget> {
  late DetallsProductesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetallsProductesModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: Color(0xFF6B1168),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          buttonSize: 48,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            context.safePop();
          },
        ),
        title: Text(
          'Detalls',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 20,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: FutureBuilder<List<ProductesRow>>(
          future: ProductesTable().querySingleRow(
            queryFn: (q) => q.eq(
              'nomProducte',
              widget.nomProducte,
            ),
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              );
            }
            List<ProductesRow> columnProductesRowList = snapshot.data!;
            final columnProductesRow = columnProductesRowList.isNotEmpty
                ? columnProductesRowList.first
                : null;
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, -1),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                      child: Text(
                        valueOrDefault<String>(
                          widget.nomProducte,
                          'NomProducte',
                        ),
                        style: FlutterFlowTheme.of(context).titleLarge,
                      ),
                    ),
                  ),
                  FutureBuilder<List<ProductesRow>>(
                    future: ProductesTable().queryRows(
                      queryFn: (q) => q.eq(
                        'nomProducte',
                        widget.nomProducte,
                      ),
                      limit: 1,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<ProductesRow> imageProductesRowList = snapshot.data!;
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          valueOrDefault<String>(
                            columnProductesRow?.fotoProducte,
                            'https://www.tea-tron.com/antorodriguez/blog/wp-content/uploads/2016/04/image-not-found-4a963b95bf081c3ea02923dceaeb3f8085e1a654fc54840aac61a57a60903fef.png',
                          ),
                          width: 300,
                          height: 200,
                          fit: BoxFit.contain,
                        ),
                      );
                    },
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 25, 0, 0),
                      child: Text(
                        'Descripció  del producte:',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Container(
                      width: 337,
                      height: 154,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: FutureBuilder<List<ProductesRow>>(
                        future: ProductesTable().queryRows(
                          queryFn: (q) => q.eq(
                            'nomProducte',
                            widget.nomProducte,
                          ),
                          limit: 1,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<ProductesRow> textProductesRowList =
                              snapshot.data!;
                          return AutoSizeText(
                            valueOrDefault<String>(
                              columnProductesRow?.descProducte,
                              'error en la desc',
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: FutureBuilder<List<UsuarisRow>>(
                      future: UsuarisTable().querySingleRow(
                        queryFn: (q) => q.eq(
                          'idUsuari',
                          columnProductesRow?.fKidUs,
                        ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<UsuarisRow> buttonUsuarisRowList = snapshot.data!;
                        final buttonUsuarisRow = buttonUsuarisRowList.isNotEmpty
                            ? buttonUsuarisRowList.first
                            : null;
                        return FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: buttonUsuarisRow!.email!,
                          options: FFButtonOptions(
                            height: 40,
                            padding:
                                EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                            iconPadding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Poppins',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                            elevation: 0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        );
                      },
                    ),
                  ),
                            Padding(

	

                    padding: EdgeInsets.symmetric(vertical: 20.0),

	

                    child: ElevatedButton.icon(

	

                      onPressed: () {

	

                        Navigator.of(context).push(

	

                          MaterialPageRoute(

	

                            builder: (context) => ChatPage(

	

                              otherUserId: columnProductesRow!.fKidUs!,

	

                            ),

	

                          ),

	

                        );

	

                      },

	

                      icon: Icon(Icons.message),

	

                      label: Text('Enviar missatge'),

	

                    ),

	

                   ), 
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
                              child: FutureBuilder<List<UsuarisRow>>(
                                future: UsuarisTable().querySingleRow(
                                  queryFn: (q) => q.eq(
                                    'idUsuari',
                                    columnProductesRow?.fKidUs,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<UsuarisRow> textUsuarisRowList =
                                      snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final textUsuarisRow =
                                      textUsuarisRowList.isNotEmpty
                                          ? textUsuarisRowList.first
                                          : null;
                                  return Text(
                                    valueOrDefault<String>(
                                      textUsuarisRow?.nomPersona,
                                      'Enric Garcia',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
                              child: RatingBar.builder(
                                onRatingUpdate: (newValue) => setState(
                                    () => _model.ratingBarValue = newValue),
                                itemBuilder: (context, index) => Icon(
                                  Icons.star_rounded,
                                  color: FlutterFlowTheme.of(context).warning,
                                ),
                                direction: Axis.horizontal,
                                initialRating: _model.ratingBarValue ??=
                                    columnProductesRow!.raiting!.toDouble(),
                                unratedColor: Color(0xFF6B1168),
                                itemCount: 5,
                                itemSize: 22,
                                glowColor: FlutterFlowTheme.of(context).warning,
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: AlignmentDirectional(1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(80, 0, 0, 0),
                            child: FutureBuilder<List<UsuarisRow>>(
                              future: UsuarisTable().querySingleRow(
                                queryFn: (q) => q.eq(
                                  'idUsuari',
                                  columnProductesRow?.fKidUs,
                                ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                 List<UsuarisRow> circleImageUsuarisRowList =
                                    snapshot.data!;
                                final circleImageUsuarisRow =
                                    circleImageUsuarisRowList.isNotEmpty
                                        ? circleImageUsuarisRowList.first
                                        : null;
                                return Container(
                                  width: 60,
                                  height: 60,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      circleImageUsuarisRow?.fotoUsuari,
                                      'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed(
                                'ReviewsUsuarios',
                                queryParameters: {
                                  'nomProducte': serializeParam(
                                    '',
                                    ParamType.String,
                                  ),
                                  'nomUsuario': serializeParam(
                                    widget.nomUsuari,
                                    ParamType.String,
                                  ),
                                  'idUsuario': serializeParam(
                                    columnProductesRow?.fKidUs,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            text: 'Veure opinions',
                            options: FFButtonOptions(
                              height: 40,
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                              iconPadding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                              elevation: 3,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed(
                                'AfegirRessenya',
                                queryParameters: {
                                  'usuariRessenya': serializeParam(
                                    columnProductesRow?.fKidUs,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            text: 'Afegir ressenya',
                            options: FFButtonOptions(
                              height: 40,
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                              iconPadding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                              elevation: 3,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
