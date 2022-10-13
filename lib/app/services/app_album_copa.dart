import 'package:appalbumcopa/app/core/rest/custom_dio.dart';
import 'package:appalbumcopa/app/core/ui/theme/theme_config.dart';
import 'package:appalbumcopa/app/pages/auth/login/login_page.dart';
import 'package:appalbumcopa/app/pages/auth/register/register_page.dart';
import 'package:appalbumcopa/app/pages/home/home_page.dart';
import 'package:appalbumcopa/app/pages/splash/splash_page.dart';
import 'package:appalbumcopa/app/pages/splash/splash_route.dart';
import 'package:appalbumcopa/app/repository/auth/auth_repository.dart';
import 'package:appalbumcopa/app/repository/auth/auth_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class AppAlbumCopa extends StatelessWidget {
  const AppAlbumCopa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterGetItApplicationBinding(
      bindingsBuilder: () => [
        Bind.lazySingleton<CustomDio>((i) => CustomDio()),
        Bind.lazySingleton<AuthRepository>((i) => AuthRepositoryImpl(dio: i())) // o que é isso???
      ],
      child: MaterialApp(
        title: 'Fifa World Cup Album',
        debugShowCheckedModeBanner: false,
        theme: ThemeConfig.theme,
        routes: {
          '/': (_) => const SplashRoute(),
          '/auth/login': (_) => const LoginPage(),
          '/auth/register': (_) => const RegisterPage(),
          '/home': (_) => const HomePage(),
        }
      ),
    );
  }
}
