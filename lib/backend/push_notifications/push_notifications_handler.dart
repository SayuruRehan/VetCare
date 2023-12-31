import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).primaryDark,
          child: Image.asset(
            'assets/images/logo_bg_remove.png',
            fit: BoxFit.contain,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'login': ParameterData.none(),
  'createAccount': ParameterData.none(),
  'createYourProfile': ParameterData.none(),
  'forgotPassword': ParameterData.none(),
  'editSettings': ParameterData.none(),
  'editUserProfile': ParameterData.none(),
  'changePassword': ParameterData.none(),
  'chatPage': (data) async => ParameterData(
        allParams: {
          'chatUser': await getDocumentParameter<UsersRecord>(
              data, 'chatUser', UsersRecord.fromSnapshot),
          'chatRef': getParameter<DocumentReference>(data, 'chatRef'),
        },
      ),
  'allChatsPage': ParameterData.none(),
  'addChatUsers': (data) async => ParameterData(
        allParams: {
          'chat': await getDocumentParameter<ChatsRecord>(
              data, 'chat', ChatsRecord.fromSnapshot),
        },
      ),
  'createGroupChat': ParameterData.none(),
  'vetdashboard': ParameterData.none(),
  'VetSinglePet': (data) async => ParameterData(
        allParams: {
          'petRef': getParameter<DocumentReference>(data, 'petRef'),
        },
      ),
  'ViewAllAppointements': ParameterData.none(),
  'VetAddAppointment': (data) async => ParameterData(
        allParams: {
          'vetDoc': await getDocumentParameter<VetRecord>(
              data, 'vetDoc', VetRecord.fromSnapshot),
          'specialityDoc': await getDocumentParameter<VetRecord>(
              data, 'specialityDoc', VetRecord.fromSnapshot),
        },
      ),
  'AddPet': ParameterData.none(),
  'owner-ViewAppointments': ParameterData.none(),
  'ViewPrec': ParameterData.none(),
  'EditPet': (data) async => ParameterData(
        allParams: {
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
        },
      ),
  'VetUpdateAppointmen': (data) async => ParameterData(
        allParams: {
          'vetAppointmentRef':
              getParameter<DocumentReference>(data, 'vetAppointmentRef'),
        },
      ),
  'CreatePres': ParameterData.none(),
  'EditPres': (data) async => ParameterData(
        allParams: {
          'presRef': getParameter<DocumentReference>(data, 'presRef'),
        },
      ),
  'InviteUsers': ParameterData.none(),
  'EditAppoint': (data) async => ParameterData(
        allParams: {
          'editAppointRef':
              getParameter<DocumentReference>(data, 'editAppointRef'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
