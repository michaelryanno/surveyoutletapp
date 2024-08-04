import 'package:flutter/material.dart';
import 'package:google_repository/google_repository.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:survey_outlet_app/init/init.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:survey_outlet_app/splash/splash.dart';
import 'package:location_repository/location_repository.dart';


void main() async{
  // runApp(const MyApp());
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  
  await SheetsConnection.init();

  //for gps location
  HandleLoc _handleLoc = HandleLoc();
  final hasPermission = await _handleLoc.handleLocationPermission();
  if (!hasPermission) return;
  //for gps location

  // final cron = Cron();
  // cron.schedule(Schedule.parse('59 23 * * *'), () async {
  //   final _profileController = Get.put(ProfileController());
  //   _profileController.onSubmitSignOut();
  // });

  // await Hive.initFlutter();
  // Hive.registerAdapter(PresenceModelAdapter());
  // MyAppGlobalLoaderOverlay();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context,child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Arbitrage Bet',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          brightness: Brightness.light,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoaderOverlay(
          useDefaultLoading: false,
          overlayWidget: Center(
            child: SpinKitCubeGrid(
              color: Colors.red,
              size: 50.0,
            ),
          ),
          overlayColor: Colors.black,
          overlayOpacity: 0.8,
          child: InitView(),
        ),
        getPages: [
          // GetPage(name: "/init", page: () => InitView(), binding: InitBinding()),
          GetPage(name: "/init", page: () => InitView()),
          // GetPage(name: "/report-list", page: () => ReportListView()),
          // GetPage(name: "/change-password", page: () => ChangePasswordView(), binding: ChangePasswordBinding()),
          // GetPage(name: "/change-uuid", page: () => ChangeUuidView())
        ],
        // initialRoute: "/init", //old used
        // debugShowCheckedModeBanner: flavour.getEnvironmentName() == "Production" ? false : true,
        supportedLocales: const [
          Locale('id'),
          Locale('en')
        ],
        navigatorObservers: [],
        onGenerateRoute: (_) => SplashPage.route(),
      ),
    );
  }
}

