import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'reviews_usuarios_model.dart';
export 'reviews_usuarios_model.dart';

class ReviewsUsuariosWidget extends StatefulWidget {
  const ReviewsUsuariosWidget({
    super.key,
    String? nomProducte,
    required this.nomUsuario,
    required this.idUsuario,
  }) : this.nomProducte = nomProducte ?? 'NomProducte';

  final String nomProducte;
  final String? nomUsuario;
  final String? idUsuario;

  @override
  State<ReviewsUsuariosWidget> createState() => _ReviewsUsuariosWidgetState();
}

class _ReviewsUsuariosWidgetState extends State<ReviewsUsuariosWidget>
    with TickerProviderStateMixin {
  late ReviewsUsuariosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 450.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 450.ms,
          begin: Offset(0, 76),
          end: Offset(0, 0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 450.ms,
          begin: Offset(1, 0),
          end: Offset(1, 1),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReviewsUsuariosModel());

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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: Color(0xFF6B1168),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          buttonSize: 46,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).tertiary,
            size: 24,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          'Ressenyes',
          style: FlutterFlowTheme.of(context).headlineSmall.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).tertiary,
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
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                color: Color(0x39000000),
                                offset: Offset(0, 1),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 16, 12, 24),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 12),
                                      child: FutureBuilder<List<UsuarisRow>>(
                                        future: UsuarisTable().querySingleRow(
                                          queryFn: (q) => q.eq(
                                            'idUsuari',
                                            widget.idUsuario,
                                          ),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<UsuarisRow> textUsuarisRowList =
                                              snapshot.data!;
                                          final textUsuarisRow =
                                              textUsuarisRowList.isNotEmpty
                                                  ? textUsuarisRowList.first
                                                  : null;
                                          return Text(
                                            valueOrDefault<String>(
                                              textUsuarisRow?.nomPersona,
                                              'nomPersona',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .displaySmall
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 28,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 12),
                                          child:
                                              FutureBuilder<List<RessenyesRow>>(
                                            future:
                                                RessenyesTable().querySingleRow(
                                              queryFn: (q) => q,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              return Text(
                                                '4.6',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .displaySmall
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 28,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              );
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4, 0, 0, 12),
                                          child: Icon(
                                            Icons.star_rounded,
                                            color: Color(0xFFFFA130),
                                            size: 24,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        FutureBuilder<List<RessenyesRow>>(
                          future: RessenyesTable().queryRows(
                            queryFn: (q) => q.eq(
                              'Receptor',
                              widget.idUsuario,
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
                            List<RessenyesRow> listViewRessenyesRowList =
                                snapshot.data!;
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewRessenyesRowList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewRessenyesRow =
                                    listViewRessenyesRowList[listViewIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 8, 16, 4),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.96,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4,
                                          color: Color(0x33000000),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(2),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(16, 12, 16, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        FutureBuilder<
                                                            List<UsuarisRow>>(
                                                          future: UsuarisTable()
                                                              .querySingleRow(
                                                            queryFn: (q) =>
                                                                q.eq(
                                                              'idUsuari',
                                                              listViewRessenyesRow
                                                                  .hechaPor,
                                                            ),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50,
                                                                  height: 50,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<UsuarisRow>
                                                                textUsuarisRowList =
                                                                snapshot.data!;
                                                            final textUsuarisRow =
                                                                textUsuarisRowList
                                                                        .isNotEmpty
                                                                    ? textUsuarisRowList
                                                                        .first
                                                                    : null;
                                                            return Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                textUsuarisRow
                                                                    ?.nomPersona,
                                                                'Laura Sanchez',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            );
                                                          },
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      4, 0, 4),
                                                          child:
                                                              RatingBarIndicator(
                                                            itemBuilder:
                                                                (context,
                                                                        index) =>
                                                                    Icon(
                                                              Icons
                                                                  .star_rounded,
                                                              color: Color(
                                                                  0xFFFFA130),
                                                            ),
                                                            direction:
                                                                Axis.horizontal,
                                                            rating:
                                                                listViewRessenyesRow
                                                                    .valoracions!
                                                                    .toDouble(),
                                                            unratedColor: Color(
                                                                0xFF95A1AC),
                                                            itemCount: 5,
                                                            itemSize: 24,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Card(
                                                    clipBehavior: Clip
                                                        .antiAliasWithSaveLayer,
                                                    color: Color(0xFFDBE2E7),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(2),
                                                      child: FutureBuilder<
                                                          List<UsuarisRow>>(
                                                        future: UsuarisTable()
                                                            .querySingleRow(
                                                          queryFn: (q) => q.eq(
                                                            'idUsuari',
                                                            listViewRessenyesRow
                                                                .hechaPor,
                                                          ),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50,
                                                                height: 50,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<UsuarisRow>
                                                              circleImageUsuarisRowList =
                                                              snapshot.data!;
                                                          final circleImageUsuarisRow =
                                                              circleImageUsuarisRowList
                                                                      .isNotEmpty
                                                                  ? circleImageUsuarisRowList
                                                                      .first
                                                                  : null;
                                                          return Container(
                                                            width: 50,
                                                            height: 50,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                Image.network(
                                                              circleImageUsuarisRow!
                                                                  .fotoUsuari!,
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(16, 4, 16, 12),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        listViewRessenyesRow
                                                            .comentari,
                                                        'No Comentari',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation']!),
                                );
                              },
                            );
                          },
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
