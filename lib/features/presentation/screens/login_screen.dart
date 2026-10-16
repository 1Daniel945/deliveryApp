import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/features/auth/presentation/auth_controller.dart';
import 'package:flutter_application_1/features/presentation/widgets/login_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {

  String personalErrorMessage(String error) {
    error = error.toLowerCase();
    String message = "";
    if(error.contains('400') || error.contains('invalid login credentials')) message = "Correo electrónico o contraseña incorrectos por favor intentelo nuevamente.";
    if(error.contains('email not confirmed') || error.contains('too many requests')) message = 'El correo electrónico no ha sido verificado por favor verificalo.';
    if(error.contains('429')) message = 'Demasidos intentos. Espera un momento.';
    if(error.contains('socketexception') || error.contains('network')) message = 'Verifica tu conexión a internet.';
    return message;
  }

  Future<void> onLogin(String email, String pass) async {
    try {
      await ref.read(authControllerProvider.notifier).signInWithPassword(
        email: email,
        password: pass,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 3),
          content: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: .all(color: AppColors.border),
              borderRadius: .circular(12),
              color: AppColors.backgroundErrorMessageWarning,
            ),
            child: Text(
              'Iniciando sesión por favor espere.',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
              textAlign: .center,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );
      await Future.delayed(const Duration(seconds: 3));
      context.go('/home');
    } 
    catch(e) {
      if(!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: .all(color: AppColors.border),
              borderRadius: .circular(12),
              color: AppColors.backgroundErrorMessageWarning,
            ),
            child: Text(
              personalErrorMessage(e.toString()),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(10),
              alignment: .bottomStart,
              child: Column(
                crossAxisAlignment: .center,
                children: [
                  Image.asset('assets/Logo.png'),
                  LoginCard(
                    onLoginPressed: (email, pass) {
                      onLogin(email, pass);
                    }
                  ),
                ],
              ),
            ),
          ),
        ), 
      ),
    );
  }
}
