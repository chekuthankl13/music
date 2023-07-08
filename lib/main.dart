import 'package:flutter/material.dart';
import 'package:music/logic/bloc_export.dart';
import 'package:music/presentation/spalsh/spalsh_screen.dart';
import 'package:music/repository/api_repository.dart';
import 'package:music/utils/utils.dart';

void main() async{
 WidgetsFlutterBinding.ensureInitialized();

  /// bloc observe state change
  Bloc.observer = MyBlocObserver();
  runApp(const MainApp());



}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(providers: [
  RepositoryProvider(
          create: (context) => ApiRepository(),
        ),
    ], child: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MusicCubit(
            apiRepository: context.read<ApiRepository>() 
          ),
        ),
        // BlocProvider(
        //   create: (context) => SubjectBloc(),
        // ),
      ],
      child: MaterialApp(
              title: 'Music',
              navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
                primaryColor: Colors.black,
                useMaterial3: true,
                
              ),
              home: const SplashScreen(),
              ),
    ),
    );
    
    
  }
}
