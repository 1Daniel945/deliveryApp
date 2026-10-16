import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginCard extends ConsumerStatefulWidget {
  
  final Function(String email, String pass) onLoginPressed;
  
  const  LoginCard({
    super.key, 
    required this.onLoginPressed,
  });

  @override
  ConsumerState<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends ConsumerState<LoginCard>{

  final textControllerUser = TextEditingController();
  final textControllerPass = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    textControllerUser.dispose();
    textControllerPass.dispose();
  }

  bool hidePass = true;

  @override
  Widget build(BuildContext context) {
    //final isLoading = ref.watch(authControllerProvider);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: .min,
        children: [
          Text(
            'Inicio de sesión',
            style: TextStyle(
              fontWeight: .bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 16,),
          TextField(
            controller: textControllerUser,
            decoration: InputDecoration(
              hintText: 'Ingresa tu usuario',
              prefixIcon: Icon(Icons.person, color: AppColors.primary),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: textControllerPass,
            decoration: InputDecoration(
              hintText: 'Ingresa tu contraseña',
              prefixIcon: Icon(Icons.lock, color: AppColors.primary),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    hidePass = !hidePass;
                  });
                },
                icon: Icon(
                  hidePass ? Icons.visibility_off : Icons.visibility,
                ),
                color: AppColors.primary,
              ),
            ),
            obscureText: hidePass,
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: () {
              widget.onLoginPressed(
                textControllerUser.text, 
                textControllerPass.text,
              );
            },
            borderRadius: .circular(12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: .circular(12),
              ),
              child: const Row(
                mainAxisSize: .max,
                mainAxisAlignment: .center,
                children: [
                  Text(
                    'Iniciar sesión',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: .bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          /*InkWell(
            onTap: () {
              isLoading ? null : () => ref.read(authControllerProvider.notifier).signInWithGoogle();
            },
            borderRadius: .circular(12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(205, 241, 240, 240),
                borderRadius: .circular(12),
              ),
              child: const Row(
                spacing: 10,
                mainAxisSize: .max,
                mainAxisAlignment: .center,
                children: [
                  Image(
                    image: NetworkImage(
                      'https://i.ibb.co/b5b6kYmj/google.png',
                      scale: 24,
                    ),
                  ),
                  Text(
                    'Iniciar Sesión con Google',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: .bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),*/
          const SizedBox(height: 4),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Text('Olvidaste tu contraseña'),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  context.push('/register');
                }, 
                icon: const Text('Registrarse')
              ),
            ],
          ),
        ],
      ),
    );
  }
}
