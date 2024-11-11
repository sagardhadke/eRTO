import 'package:rto/Utils/Themes/theme_constants.dart';
import 'package:rto/Utils/Themes/theme_manager.dart';

import 'Exports/myExports.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  final themeManager = ThemeManager();
  await themeManager.loadTheme();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryController>(
          create: (_) => CategoryController(ApiService()),
        ),
        ChangeNotifierProvider<ThemeManager>(create: (_) => themeManager)
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'eRTO',
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
