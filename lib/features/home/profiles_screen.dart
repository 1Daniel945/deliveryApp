import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_1/features/presentation/widgets/button_widget.dart';
import 'package:flutter_application_1/features/presentation/widgets/profile_banner_widget.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfileScreen();
}

class _ProfileScreen extends State<Profilescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primary,
        title: Row(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Perfil',
                  style: TextStyle(
                    fontSize: 18, 
                    fontWeight: .bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            spacing: 2,
            children: [
              ProfileBanner(),
              Divider(),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.border
                  ),
                  gradient: LinearGradient(
                  colors: List.of([
                    AppColors.surface,
                    AppColors.border,
                  ]),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      'Configuración',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: .bold,
                      ),
                    ),
                    SizedBox(height: 4,),
                    ButtonWidget.withoutcol(
                      title: 'Editar perfil', 
                      ico: Icons.settings_outlined,
                      onTap: () {
                        
                      },
                    ),
                    SizedBox(height: 2,),
                    ButtonWidget.withoutcol(
                      title: 'Método de pago', 
                      ico: Icons.payment,
                      onTap: () {
                        context.push('/payment');
                      }
                    ),
                    SizedBox(height: 2,),
                    ButtonWidget.withoutcol(
                      title: 'Historial', 
                      ico: Icons.history,
                      onTap: () {
                        
                      },
                    ),
                    SizedBox(height: 2,),
                    ButtonWidget.withoutcol(
                      title: 'Favoritos', 
                      ico: Icons.favorite_outline,
                      onTap: () {
                        
                      },
                    ),
                    SizedBox(height: 2,),
                    ButtonWidget(
                      title: 'Cerrar sesión', 
                      ico: Icons.logout_outlined, 
                      col: Colors.red,
                      onTap: () {
                        context.pop();
                        context.push('/');
                      },
                    ),
                  ],
                ),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.border
                  ),
                  gradient: LinearGradient(
                    colors: List.of([
                      AppColors.surface,
                      AppColors.border,
                    ]),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      'Acerca de la app',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: .bold,
                      ),
                    ),
                    SizedBox(height: 4,),
                    ButtonWidget.withoutcol(
                      title: 'Quienes somos', 
                      ico: Icons.help_outline,
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: .min,
                                children: [
                                  Text(
                                    'Hola somos MIW',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: .bold,
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(
                                    'Somos una plataforma enfocada en conectar a nuestros usuarios con soluciones rápidas, transparentes y confiables, simplificando la gestión de entregas y envíos del día a día. Nuestro compromiso es ofrecerte una experiencia águil, segura y adaptada a tus necesidades con la mejor tecnología.',
                                    textAlign: .left,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ), 
                            );
                          },
                        );
                      },
                    ),
                    ButtonWidget.withoutcol(
                      title: 'Necesitas ayuda', 
                      ico: Icons.support_agent_outlined,
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: .min,
                                children: [
                                  Text(
                                    'Preguntas Frecuentes',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: .bold,
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(
                                    'Somos una plataforma enfocada en conectar a nuestros usuarios con soluciones rápidas, transparentes y confiables, simplificando la gestión de entregas y envíos del día a día. Nuestro compromiso es ofrecerte una experiencia águil, segura y adaptada a tus necesidades con la mejor tecnología.',
                                    textAlign: .left,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ), 
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

