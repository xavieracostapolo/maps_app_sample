import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_app_sample/blocs/blocs.dart';
import 'package:maps_app_sample/screens/screens.dart';

import 'config/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: ((context) => GpsBloc())),
      BlocProvider(
        create: (context) => UserBloc(),
      )
    ],
    child: const MapsApp(),
  ));
}

class MapsApp extends StatelessWidget {
  const MapsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Maps App...',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoadingScreen(),
        '/map': (context) => const MapScreen()
      },
    );
  }
}
