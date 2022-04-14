import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/* Screens */
import 'package:music_player/screens/screens.dart';

/* Model */
import 'package:music_player/models/models.dart';

/* Theme App */
import 'package:music_player/theme/theme.dart';

void main() => runApp(const AppState());

/* Este Es El Primer Widget Que Se va A Crear, Es Decir,
Después De Este Widget En Adelante, En Todos Los Widgets 
Que Yo Quiera Tengo Acceso A Esta Misma Instancia De 
Audio Player Model */
class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AudioPlayerModel()),
        // ChangeNotifierProvider(create: (_) => ActorProvider(), lazy: false),
        // ChangeNotifierProvider(create: (_) => MoviesProvider(), lazy: false),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: miTema,
      title: 'Music Player App',
      home: const MusicPlayerScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
