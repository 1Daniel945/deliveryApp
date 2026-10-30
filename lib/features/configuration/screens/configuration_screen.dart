import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/features/auth/data/auth_repository.dart';
import 'package:flutter_application_1/features/configuration/widgets/configuration_cards.dart';
import 'package:flutter_application_1/features/presentation/widgets/button_widget1.dart';
import 'package:go_router/go_router.dart';

class ConfigurationScreen extends StatefulWidget {
  const ConfigurationScreen({super.key});

  @override
  State<ConfigurationScreen> createState() => _ConfigurationScreenState();
}

class _ConfigurationScreenState extends State<ConfigurationScreen> {

  String? name;
  String? email;
  final authRepository = AuthRepository();

  @override
  void initState() {
    super.initState();
    getCurrentData();
  }

  void getCurrentData() {
    final data = authRepository.getUserProfileData();
    setState(() {
      name = data['name'];
      email = data['email'];
    });
  }

  Future<void> closeSesion() async {
    authRepository.closeSesion();
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
            'Cerrando sesión por favor espere.',
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
    context.go('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              'Cofiguración',
              style: TextStyle(fontSize: 18, fontWeight: .bold),
            ),
            Text(
              'Personaliza tu experiencia en la app.',
              style: TextStyle(fontWeight: .normal, fontSize: 16),
            ),
          ],
        ),
        elevation: 0.5,
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              //Profile screen
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: AppColors.border),
                  borderRadius: .circular(12),
                ),
                child: Row(
                  spacing: 16,
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: Image.network(
                        'https://i.ibb.co/hR46vqKw/1779166947552.jpg',
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(Icons.account_circle);
                        },
                      ).image,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: .circular(50),
                          border: Border.all(color: AppColors.primary),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            name.toString(),
                            style: TextStyle(fontWeight: .bold, fontSize: 16),
                            overflow: .ellipsis,
                            maxLines: 2,
                          ),
                          Text(
                            email.toString(),
                            style: TextStyle(fontWeight: .normal, fontSize: 14),
                            overflow: .ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              ConfigurationCards(
                title: 'Perfil',
                description: 'Edita tu información personal.',
                icon: Icon(Icons.person),
                onTap: () {
                  context.push('/editProfile');
                },
              ),
              const SizedBox(height: 10,),
              ConfigurationCards(
                title: 'Dirección de entrega',
                description: 'Gestiona tus direcciones guardadas.',
                icon: Icon(Icons.location_on),
                onTap: () {
                  
                },
              ),
              const SizedBox(height: 10,),
              ConfigurationCards(
                title: 'Métodos de pago',
                description: 'Tarjetas y métodos de pago.',
                icon: Icon(Icons.credit_card),
                onTap: () {
                  context.push('/paymentMethod');
                },
              ),
              const SizedBox(height: 10,),
              ConfigurationCards(
                title: 'Notificaciones',
                description: 'Gestiona tus notificaciones.',
                icon: Icon(Icons.notifications),
                onTap: () {
                  
                },
              ),
              const SizedBox(height: 10,),
              ConfigurationCards(
                title: 'Ayuda y soporte',
                description: 'Centro de ayuda y preguntas frecuentes.',
                icon: Icon(Icons.help_rounded),
                onTap: () {
                  
                },
              ),
              const SizedBox(height: 10,),
              ConfigurationCards(
                title: 'Acerca de',
                description: 'Términos, politicas y versión de la app.',
                icon: Icon(Icons.info),
                onTap: () {
                  
                },
              ),
              const SizedBox(height: 16,),
              ButtonWidget1(
                title: 'Cerrar sesión', 
                icon: Icon(Icons.logout), 
                color: Colors.redAccent, 
                colorIcon: Colors.black, 
                onTap: () {
                  closeSesion();
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}

