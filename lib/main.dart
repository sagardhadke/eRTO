import 'package:rto/Utils/Themes/theme_constants.dart';
import 'package:rto/Utils/Themes/theme_manager.dart';

import 'Exports/myExports.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryController>(
          create: (_) => CategoryController(ApiService()),
        ),
        ChangeNotifierProvider<ThemeManager>(create: (_) => ThemeManager())
      ],
      child: MyApp(),
    ),
  );
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'eRTO',
        // theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: themeManager.themeMode,
        theme: lightTheme,
        // theme: ThemeData(
        //   primaryColor: MyAppColors.primary,
        //   secondaryHeaderColor: MyAppColors.secondary,
        //   scaffoldBackgroundColor: MyAppColors.primaryBackground,
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //   useMaterial3: true,
        // ),
        home: MyDashboard());
  }
}
