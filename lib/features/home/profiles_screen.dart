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
          margin: EdgeInsets.all(5),
          width: .maxFinite,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.border
            ),
          ),
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
                    ),
                    ButtonWidget.withoutcol(
                      title: 'Método de pago', 
                      ico: Icons.payment,
                    ),
                    ButtonWidget.withoutcol(
                      title: 'Historial', 
                      ico: Icons.history,
                    ),
                    ButtonWidget.withoutcol(
                      title: 'Favoritos', 
                      ico: Icons.favorite_outline,
                    ),
                    ButtonWidget(
                      title: 'Cerrar sesión', 
                      ico: Icons.logout_outlined, 
                      col: Colors.red,
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
                    ),
                    ButtonWidget.withoutcol(
                      title: 'Necesitas ayuda', 
                      ico: Icons.support_agent_outlined,
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

