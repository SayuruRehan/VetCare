import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'all_chats_page_model.dart';
export 'all_chats_page_model.dart';

class AllChatsPageWidget extends StatefulWidget {
  const AllChatsPageWidget({Key? key}) : super(key: key);

  @override
  _AllChatsPageWidgetState createState() => _AllChatsPageWidgetState();
}

class _AllChatsPageWidgetState extends State<AllChatsPageWidget> {
  late AllChatsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllChatsPageModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.textController?.text = FFLocalizations.of(context).getText(
            '3zuq67a0' /*      Search */,
          );
        }));
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          FFLocalizations.of(context).getText(
            'l5fw3ryh' /* Chats */,
          ),
          style: FlutterFlowTheme.of(context).headlineMedium,
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed('InviteUsers');
              },
              child: Icon(
                Icons.add,
                color: FlutterFlowTheme.of(context).primaryDark,
                size: 40.0,
              ),
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
              child: TextFormField(
                controller: _model.textController,
                focusNode: _model.textFieldFocusNode,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.textController',
                  Duration(milliseconds: 2000),
                  () async {
                    await queryUsersRecordOnce()
                        .then(
                          (records) => _model.simpleSearchResults = TextSearch(
                            records
                                .map(
                                  (record) => TextSearchItem.fromTerms(
                                      record, [record.displayName!]),
                                )
                                .toList(),
                          )
                              .search(_model.textController.text)
                              .map((r) => r.object)
                              .toList(),
                        )
                        .onError((_, __) => _model.simpleSearchResults = [])
                        .whenComplete(() => setState(() {}));
                  },
                ),
                autofocus: true,
                obscureText: false,
                decoration: InputDecoration(
                  labelStyle: FlutterFlowTheme.of(context).labelMedium,
                  hintStyle: FlutterFlowTheme.of(context).labelMedium,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
                maxLines: null,
                validator: _model.textControllerValidator.asValidator(context),
              ),
            ),
            Builder(
              builder: (context) {
                if (_model.isShowFullList) {
                  return Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                    child: StreamBuilder<List<ChatsRecord>>(
                      stream: queryChatsRecord(
                        queryBuilder: (chatsRecord) => chatsRecord
                            .where(
                              'users',
                              arrayContains: currentUserReference,
                            )
                            .orderBy('last_message_time', descending: true),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xBDF97639),
                                ),
                              ),
                            ),
                          );
                        }
                        List<ChatsRecord> listViewChatsRecordList =
                            snapshot.data!;
                        if (listViewChatsRecordList.isEmpty) {
                          return Center(
                            child: Image.asset(
                              'assets/images/messagesMainEmpty@2x.png',
                              width: MediaQuery.sizeOf(context).width * 0.76,
                            ),
                          );
                        }
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewChatsRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewChatsRecord =
                                listViewChatsRecordList[listViewIndex];
                            return StreamBuilder<FFChatInfo>(
                              stream: FFChatManager.instance
                                  .getChatInfo(chatRecord: listViewChatsRecord),
                              builder: (context, snapshot) {
                                final chatInfo = snapshot.data ??
                                    FFChatInfo(listViewChatsRecord);
                                return FFChatPreview(
                                  onTap: () => context.pushNamed(
                                    'chatPage',
                                    queryParameters: {
                                      'chatUser': serializeParam(
                                        chatInfo.otherUsers.length == 1
                                            ? chatInfo.otherUsersList.first
                                            : null,
                                        ParamType.Document,
                                      ),
                                      'chatRef': serializeParam(
                                        chatInfo.chatRecord.reference,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'chatUser':
                                          chatInfo.otherUsers.length == 1
                                              ? chatInfo.otherUsersList.first
                                              : null,
                                    },
                                  ),
                                  lastChatText: chatInfo.chatPreviewMessage(),
                                  lastChatTime:
                                      listViewChatsRecord.lastMessageTime,
                                  seen: listViewChatsRecord.lastMessageSeenBy!
                                      .contains(currentUserReference),
                                  title: chatInfo.chatPreviewTitle(),
                                  userProfilePic: chatInfo.chatPreviewPic(),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  unreadColor:
                                      FlutterFlowTheme.of(context).primary,
                                  titleTextStyle: GoogleFonts.getFont(
                                    'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                    fontStyle: FontStyle.normal,
                                  ),
                                  dateTextStyle: GoogleFonts.getFont(
                                    'Urbanist',
                                    color:
                                        FlutterFlowTheme.of(context).grayIcon,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.0,
                                  ),
                                  previewTextStyle: GoogleFonts.getFont(
                                    'Urbanist',
                                    color:
                                        FlutterFlowTheme.of(context).grayIcon,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.0,
                                  ),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          12.0, 3.0, 3.0, 3.0),
                                  borderRadius: BorderRadius.circular(0.0),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  );
                } else {
                  return Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final searchResult =
                            _model.simpleSearchResults.toList();
                        if (searchResult.isEmpty) {
                          return Center(
                            child: Image.asset(
                              'assets/images/messagesMainEmpty@2x.png',
                              width: MediaQuery.sizeOf(context).width * 0.76,
                            ),
                          );
                        }
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: searchResult.length,
                          itemBuilder: (context, searchResultIndex) {
                            final searchResultItem =
                                searchResult[searchResultIndex];
                            return StreamBuilder<List<ChatsRecord>>(
                              stream: queryChatsRecord(
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Color(0xBDF97639),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<ChatsRecord> chatPreviewChatsRecordList =
                                    snapshot.data!;
                                // Return an empty Container when the item does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final chatPreviewChatsRecord =
                                    chatPreviewChatsRecordList.isNotEmpty
                                        ? chatPreviewChatsRecordList.first
                                        : null;
                                return StreamBuilder<FFChatInfo>(
                                  stream: FFChatManager.instance.getChatInfo(
                                      chatRecord: chatPreviewChatsRecord!),
                                  builder: (context, snapshot) {
                                    final chatInfo = snapshot.data ??
                                        FFChatInfo(chatPreviewChatsRecord!);
                                    return FFChatPreview(
                                      onTap: () => context.pushNamed(
                                        'chatPage',
                                        queryParameters: {
                                          'chatUser': serializeParam(
                                            chatInfo.otherUsers.length == 1
                                                ? chatInfo.otherUsersList.first
                                                : null,
                                            ParamType.Document,
                                          ),
                                          'chatRef': serializeParam(
                                            chatInfo.chatRecord.reference,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'chatUser':
                                              chatInfo.otherUsers.length == 1
                                                  ? chatInfo
                                                      .otherUsersList.first
                                                  : null,
                                        },
                                      ),
                                      lastChatText:
                                          chatInfo.chatPreviewMessage(),
                                      lastChatTime: chatPreviewChatsRecord!
                                          .lastMessageTime,
                                      seen: chatPreviewChatsRecord!
                                          .lastMessageSeenBy!
                                          .contains(currentUserReference),
                                      title: chatInfo.chatPreviewTitle(),
                                      userProfilePic: chatInfo.chatPreviewPic(),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      unreadColor:
                                          FlutterFlowTheme.of(context).primary,
                                      titleTextStyle: GoogleFonts.getFont(
                                        'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                        fontStyle: FontStyle.normal,
                                      ),
                                      dateTextStyle: GoogleFonts.getFont(
                                        'Urbanist',
                                        color: FlutterFlowTheme.of(context)
                                            .grayIcon,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14.0,
                                      ),
                                      previewTextStyle: GoogleFonts.getFont(
                                        'Urbanist',
                                        color: FlutterFlowTheme.of(context)
                                            .grayIcon,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14.0,
                                      ),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              12.0, 3.0, 3.0, 3.0),
                                      borderRadius: BorderRadius.circular(0.0),
                                    );
                                  },
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
