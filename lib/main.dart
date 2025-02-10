import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_turkish_words_app/models/word.dart';
import 'screens/main_screen.dart';
import 'package:workmanager/workmanager.dart';
import 'package:uuid/uuid.dart';
import 'services/notification_service.dart';
import 'data/data_words.dart';

void main() {
  // needed if you intend to initialize in the `main` function
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(callbackDispatcher, isInDebugMode: false);

  // Generate a unique identifier for the task
  var uuid = Uuid();
  String uniqueTaskId = uuid.v4();

  // Register the periodic task with a unique ID
  Workmanager().registerPeriodicTask(
    uniqueTaskId,
    "hourlyTask",
    frequency: Duration(hours: 1),
    constraints: Constraints(
      networkType: NetworkType.connected,
    ),
  );

  // Initialize the notification service
  NotificationService.initialize();

  runApp(MultiWindowApp());
}

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    if (task == "hourlyTask") {
      await showNotification();
      return Future.value(true);
    }
    return Future.value(false);
  });
}

Future<void> showNotification() async {
  // Generate a random integer for the notification ID
  final Random random = Random();
  int notificationId = random.nextInt(10000);

  // Select a random conjugation from the list
  List<Word> words = await loadWords();
  final Word randomWord = words[random.nextInt(words.length)];

  // Use the NotificationService to show the notification
  await NotificationService.showNotification(
    id: notificationId,
    title: randomWord.turkish,
    body: randomWord.frenchMeaning,
  );
}

class MultiWindowApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn Turkish App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}
