import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pushnotificationtestapp/second_page.dart';
import 'notification_helper.dart';

class NotificationService extends StatefulWidget {
  @override
  _NotificationServiceState createState() => _NotificationServiceState();
}

class _NotificationServiceState extends State<NotificationService> {
  FlutterLocalNotificationsPlugin notifications =
      FlutterLocalNotificationsPlugin();
  var notificationHelper = NotificationHelper();

  @override
  void initState() {
    // TODO: implement initState
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    var initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
            selectNotification(payload));
    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    notifications.initialize(initializationSettings,
        onSelectNotification: selectNotification);
    super.initState();
  }

  Future selectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondPage(payload)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          Text('Basic'),
          RaisedButton(
            child: Text('Show Notification'),
            onPressed: () {
              notificationHelper.showSilentNotification(notifications,
                  title: 'Mr CK', body: 'poda pulle');
            },
          )
        ],
      ),
    );
  }
}
