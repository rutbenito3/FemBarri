import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'granet_sorra_model.dart';
export 'granet_sorra_model.dart';

class GranetSorraWidget extends StatefulWidget {
  const GranetSorraWidget({super.key});

  @override
  State<GranetSorraWidget> createState() => _GranetSorraWidgetState();
}

class _GranetSorraWidgetState extends State<GranetSorraWidget>
    with TickerProviderStateMixin {
  late GranetSorraModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GranetSorraModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
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
            'El granet de sorra',
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x32000000),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: FutureBuilder<List<ProductesRow>>(
                          future: ProductesTable().queryRows(
                            queryFn: (q) => q.eq(
                              'FKid_Us',
                              currentUserUid,
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
                            List<ProductesRow> listViewProductesRowList =
                                snapshot.data!;
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewProductesRowList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewProductesRow =
                                    listViewProductesRowList[listViewIndex];
                                return Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 16),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            child: Image.network(
                                              valueOrDefault<String>(
                                                listViewProductesRow
                                                    .fotoProducte,
                                                'https://www.tea-tron.com/antorodriguez/blog/wp-content/uploads/2016/04/image-not-found-4a963b95bf081c3ea02923dceaeb3f8085e1a654fc54840aac61a57a60903fef.png',
                                              ),
                                              width: double.infinity,
                                              height: 200,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1, 0),
                                              child: Padding(
                                                padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(16, 8, 0, 8),
                                                child: Text(
                                                  listViewProductesRow
                                                      .nomProducte,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment:
                                                    AlignmentDirectional.centerEnd,
                                                child: Padding(
                                                  padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0, 20, 16, 0),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: IconButton(
                                                      icon: Icon(
                                                        Icons.delete,
                                                        size: 35,
                                                        color: Color.fromARGB(255, 157, 10, 173),
                                                      ),
                                                      onPressed: () async {
                                                        await ProductesTable()
                                                            .delete(
                                                          matchingRows: (rows) =>
                                                              rows
                                                                  .eq(
                                                                    'FKid_Us',
                                                                    currentUserUid,
                                                                  )
                                                                  .eq(
                                                                    'nomProducte',
                                                                    listViewProductesRow
                                                                        .nomProducte,
                                                                  ),
                                                        );
                                                        setState(() {});
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    
                                  ),
                                  
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                    
                  ),
                ),
              ),
                                                  Align(
                    alignment: AlignmentDirectional(0, -1),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0), // MODIFICAR EL PADDING PARA BAJAR MAS EL SCROLL 
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [],
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
