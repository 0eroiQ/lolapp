import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHelper {
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static const _channelId = 'downloads_channel';
  static const _channelName = 'Descargas';
  static const _channelDesc = 'Progreso de descargas de video';

  static Future<void> init() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const ios = DarwinInitializationSettings();
    const settings = InitializationSettings(android: android, iOS: ios);

    await _plugin.initialize(settings);

    // Crear canal (Android 8+)
    const channel = AndroidNotificationChannel(
      _channelId,
      _channelName,
      description: _channelDesc,
      importance: Importance.low, // no suena, solo muestra progreso
      showBadge: false,
      playSound: false,
      enableVibration: false,
    );

    final androidPlugin = _plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();

    await androidPlugin?.createNotificationChannel(channel);

    // Android 13+ necesita permiso de notificaciones
    await androidPlugin?.requestNotificationsPermission();
  }

  /// Muestra / actualiza la notificación de progreso
  /// [body] puede incluir: porcentaje, ETA y hora de inicio
  /// Ejemplo: "45% · ~3 min 20s · Inicio 14:32"
  static Future<void> showProgress({
    required int id,
    required String title,
    required int progress, // 0-100
    required String body,
  }) async {
    final androidDetails = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDesc,
      importance: Importance.low,
      priority: Priority.low,
      onlyAlertOnce: true,
      showProgress: true,
      maxProgress: 100,
      progress: progress.clamp(0, 100),
      ongoing: true, // no se puede deslizar mientras descarga
      autoCancel: false,
      playSound: false,
      enableVibration: false,
      category: AndroidNotificationCategory.progress,
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: false,
      presentBadge: false,
      presentSound: false,
    );

    await _plugin.show(
      id,
      title,
      body,
      NotificationDetails(android: androidDetails, iOS: iosDetails),
    );
  }

  /// Notificación de completado
  static Future<void> showCompleted({
    required int id,
    required String title,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDesc,
      importance: Importance.defaultImportance,
      priority: Priority.defaultPriority,
      onlyAlertOnce: true,
      autoCancel: true,
    );

    await _plugin.show(
      id,
      title,
      'Descarga completada',
      const NotificationDetails(android: androidDetails),
    );
  }

  /// Cancelar notificación
  static Future<void> cancel(int id) async {
    await _plugin.cancel(id);
  }
}