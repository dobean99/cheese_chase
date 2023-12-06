import 'package:cheese_chase/models/cheese_data.dart';
import 'package:cheese_chase/models/locale_provider.dart';
import 'package:cheese_chase/models/player_data.dart';
import 'package:cheese_chase/models/settings.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:cheese_chase/config/l10n/l10n.dart';
import 'package:cheese_chase/config/theme/app_theme.dart';
import 'package:cheese_chase/screens/loading_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  Flame.device.setPortrait();
  await initHive();
  // Settings settings = await getSettings();
  // AudioManager.instance.init([AudioAssets.bgAudio], settings);
  runApp(
    MultiProvider(
        providers: [
          FutureProvider<PlayerData>(
            create: (BuildContext context) => getPlayerData(),
            initialData: PlayerData.fromMap(PlayerData.defaultData),
          ),
          FutureProvider<Settings>(
              create: (BuildContext context) => getSettings(),
              initialData: Settings(bgm: false)),
        ],
        builder: (context, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<PlayerData>.value(
                value: Provider.of<PlayerData>(context),
              ),
              ChangeNotifierProvider<Settings>.value(
                value: Provider.of<Settings>(context),
              ),
              ChangeNotifierProvider(create: (_) => LocaleProvider()),
            ],
            child: const MyApp(),
          );
        }),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
      builder: (context, provider, snapshot) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Cheese Chase',
          theme: AppTheme.darkTheme,
          home: const LoadingScreen(),
          supportedLocales: AppLocalizations.supportedLocales,
          locale: provider.locale,
          onGenerateTitle: (context) => context.l10n!.appName,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
        );
      },
    );
  }
}

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SettingsAdapter());
  Hive.registerAdapter(PlayerDataAdapter());
  Hive.registerAdapter(CheeseTypeAdapter());
}

/// This function reads the stored [PlayerData] from disk.
Future<PlayerData> getPlayerData() async {
  // Open the player data box and read player data from it.
  final box = await Hive.openBox<PlayerData>(PlayerData.playerDataBox);
  final playerData = box.get(PlayerData.playerDataKey);

  // If player data is null, it means this is a fresh launch
  // of the game. In such case, we first store the default
  // player data in the player data box and then return the same.
  if (playerData == null) {
    box.put(
      PlayerData.playerDataKey,
      PlayerData.fromMap(PlayerData.defaultData),
    );
  }

  return box.get(PlayerData.playerDataKey)!;
}

Future<Settings> getSettings() async {
  final box = await Hive.openBox<Settings>(Settings.settingsBox);
  final settings = box.get(Settings.settingsKey);
  if (settings == null) {
    box.put(Settings.settingsKey, Settings(bgm: true));
  }

  return box.get(Settings.settingsKey)!;
}
