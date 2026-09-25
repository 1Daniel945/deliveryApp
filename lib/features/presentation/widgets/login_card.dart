import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:go_router/go_router.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({
    super.key,
    required this.textControllerUser,
    required this.textControllerPass,
  });

  final TextEditingController textControllerUser;
  final TextEditingController textControllerPass;

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard>{
  bool hidePass = true;
  Icon ico = Icon(Icons.visibility);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: .maxFinite,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: .min,
        children: [
          TextField(
            controller: widget.textControllerUser,
            decoration: InputDecoration(
              hintText: 'Ingresa tu usuario',
              prefixIcon: Icon(Icons.person, color: AppColors.primary),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            controller: widget.textControllerPass,
            decoration: InputDecoration(
              hintText: 'Ingresa tu contraseña',
              prefixIcon: Icon(Icons.lock, color: AppColors.primary),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    hidePass = !hidePass;
                    ico = Icon(Icons.visibility_off);
                  });
                },
                icon: ico,
                color: AppColors.primary,
              ),
            ),
            obscureText: hidePass,
          ),
          SizedBox(height: 16),
          InkWell(
            onTap: () {
              context.push('/home');
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
          InkWell(
            onTap: () {},
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
          ),
          SizedBox(height: 4),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Text('Olvidaste tu contraseña'),
              ),
              Spacer(),
              IconButton(
                onPressed: () {}, 
                icon: Text('Registrarse')
              ),
            ],
          ),
        ],
      ),
    );
  }
}
