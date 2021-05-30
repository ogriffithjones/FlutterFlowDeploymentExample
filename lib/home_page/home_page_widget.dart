import '../add_note/add_note_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../login/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () async {
            await signOut();
            await Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => LoginWidget(),
              ),
              (r) => false,
            );
          },
          icon: Icon(
            Icons.login_rounded,
            color: Colors.white,
            size: 30,
          ),
          iconSize: 30,
        ),
        title: Text(
          'My Notes',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNoteWidget(),
            ),
          );
        },
        backgroundColor: FlutterFlowTheme.primaryColor,
        elevation: 8,
        child: Icon(
          Icons.note_add_sharp,
          color: Colors.white,
          size: 24,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: StreamBuilder<List<NotesRecord>>(
                stream: queryNotesRecord(
                  queryBuilder: (notesRecord) => notesRecord.where('user',
                      isEqualTo: currentUserReference),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  List<NotesRecord> listViewNotesRecordList = snapshot.data;
                  // Customize what your widget looks like with no query results.
                  if (snapshot.data.isEmpty) {
                    // return Container();
                    // For now, we'll just include some dummy data.
                    listViewNotesRecordList = createDummyNotesRecord(count: 4);
                  }
                  return Padding(
                    padding: EdgeInsets.fromLTRB(12, 12, 12, 0),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewNotesRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewNotesRecord =
                            listViewNotesRecordList[listViewIndex];
                        return Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Hello World',
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Poppins',
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ToggleIcon(
                                    onPressed: () async {
                                      final done = !listViewNotesRecord.done;

                                      final notesRecordData =
                                          createNotesRecordData(
                                        done: done,
                                      );

                                      await listViewNotesRecord.reference
                                          .update(notesRecordData);
                                    },
                                    value: listViewNotesRecord.done,
                                    onIcon: Icon(
                                      Icons.check_box,
                                      color: FlutterFlowTheme.primaryColor,
                                      size: 25,
                                    ),
                                    offIcon: Icon(
                                      Icons.check_box_outline_blank,
                                      color: FlutterFlowTheme.primaryColor,
                                      size: 25,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
