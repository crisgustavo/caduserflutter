import 'package:app_cadastro/provider/users.dart';
import 'package:app_cadastro/routes/app_routes.dart';
import 'package:app_cadastro/views/user_form.dart';
import 'package:app_cadastro/views/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return 
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
          create: (ctx) => UsersProvider(),
          )
        ],

        child: MaterialApp(
          title: 'Cadastro Clientes',
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.dark(
              primary: Colors.grey,
              onPrimary: const Color.fromARGB(255, 68, 68, 68),
              surface: const Color.fromARGB(255, 255, 255, 255),
              onSurface: const Color.fromARGB(255, 8, 8, 8),
              secondary: Color.fromARGB(255, 8, 8, 8),
            ),

            appBarTheme: const AppBarTheme(
              backgroundColor:Color.fromARGB(255, 68, 68, 68),
              foregroundColor: Color.fromARGB(255, 255, 255, 255),
            ),

            floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.grey,
              foregroundColor: Colors.white,
            ),
          ),

          routes: {
            AppRoutes.HOME: (_) => UserList(),
            AppRoutes.USER_FORM: (_) => UserForm(),
          },
        )
      );
  }
}
