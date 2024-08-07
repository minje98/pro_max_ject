import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:pro_max_ject/screen/login_screen.dart';
import 'package:pro_max_ject/screen/map.dart';
import 'package:pro_max_ject/screen/signup.dart';
import 'package:pro_max_ject/screen/widget/Bottom_navi_widget.dart';
import 'package:pro_max_ject/screen/widget/IndexProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // Flutter 엔진을 초기화
  WidgetsFlutterBinding.ensureInitialized();

  // 카카오맵 테스트
  // await dotenv.load(fileName: '.env');

  // Kakao SDK 초기화
  KakaoSdk.init(
    nativeAppKey: 'c16c44bd57bcaf0c1b866cb6bd1ce937',
    javaScriptAppKey: '8bc1ee40ec3a8a422d71fb1956f0ebf7',
  );

  // Firebase 초기화
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 로그인 상태 확인
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  // runApp(MapPage());
  runApp(
  ChangeNotifierProvider(
  create: (context) => IndexProvider(),
  child: MyApp(isLoggedIn: isLoggedIn),
  ));
}
  // runApp(MyApp());


class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: isLoggedIn ?  '/main' : '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUp(),
        '/main': (context) => MainScreen(),
      },
    );
  }
}
