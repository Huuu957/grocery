import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationAccessScreen extends StatefulWidget {
  @override
  _NotificationAccessScreenState createState() =>
      _NotificationAccessScreenState();
}

class _NotificationAccessScreenState extends State<NotificationAccessScreen> {
  PermissionStatus _notificationStatus = PermissionStatus.undecided;

  @override
  void initState() {
    super.initState();
    _checkNotificationStatus();
  }

  Future<void> _checkNotificationStatus() async {
    final status = await Permission.notification.status;
    setState(() {
      _notificationStatus = status;
    });
  }

  Future<void> _requestNotificationAccess() async {
    final status = await Permission.notification.request();
    setState(() {
      _notificationStatus = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Access'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Notification access is required.',
              style: TextStyle(fontSize: 18.0),
            ),
            ElevatedButton(
              onPressed: _requestNotificationAccess,
              child: Text('Request Access'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Current status: $_notificationStatus',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
