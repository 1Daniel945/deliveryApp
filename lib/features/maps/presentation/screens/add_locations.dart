import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/features/maps/presentation/widgets/map_viewer.dart';
import 'package:flutter_application_1/features/presentation/widgets/button_widget1.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddLocationsScreen extends ConsumerStatefulWidget {
  const AddLocationsScreen({super.key});

  @override
  ConsumerState<AddLocationsScreen> createState() => _AddLocationsState();
}

class _AddLocationsState extends ConsumerState<AddLocationsScreen> {
  final formKey = GlobalKey<FormState>();
  final aliasController = TextEditingController();
  final referenceController = TextEditingController();

  @override
  void dispose() {
    aliasController.dispose();
    referenceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Añadir nueva dirección',
          style: TextStyle(
            fontWeight: .bold,
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child:Stack(
          children: [
            const Positioned.fill(
              child: Mapviewer(),
            ),
            IgnorePointer(
              child: Align(
                alignment: const Alignment(0, -0.35),
                child: Icon(
                  Icons.location_pin,
                  size: 46,
                  color: AppColors.primary,
                ),
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.47,
              minChildSize: 0.25,
              maxChildSize: 0.47,
              builder: (context, scrollController) {
                return Container(
                  padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                  decoration: BoxDecoration(
                    color: Color(0xFF121212),
                    borderRadius: .vertical(
                      top: .circular(28),
                    )
                  ),
                  child: Form(
                    key: formKey,
                    child: ListView(
                      controller: scrollController,
                      children: [
                        Center(
                          child: Container(
                            width: 40,
                            height: 5,
                            margin: const EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade500,
                              borderRadius: .circular(10),
                            ),
                          ),
                        ),
                        Text(
                          'Detalles de la dirección',
                          style: TextStyle(
                            fontWeight: .bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 16,),
                        TextFormField(
                          controller: aliasController,
                          decoration: InputDecoration(
                            labelText: 'Nombre de tu domicilio (opcional)',
                            prefixIcon: Icon(Icons.home, color: AppColors.primary,),
                          ),
                        ),
                        const SizedBox(height: 16,),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'C. Plata #76 Moroleon Guanajuato',
                            prefixIcon: Icon(Icons.location_on, color: AppColors.primary,),
                          ),
                        ),
                        const SizedBox(height: 16,),
                        TextFormField(
                          controller: referenceController,
                          decoration: InputDecoration(
                            labelText: 'Referencias (opcional)',
                            hintText: 'Ej. Cerca del parque...',
                            prefixIcon: Icon(Icons.description, color: AppColors.primary,),
                          ),
                        ),
                        const SizedBox(height: 16,),
                        ButtonWidget1(
                          title: 'Guardar dirección', 
                          icon: Icon(Icons.location_on), 
                          color: AppColors.primary, 
                          colorIcon: Colors.black, 
                          onTap: () {
                            
                          }
                        ),
                      ],
                    ) 
                  ),
                ); 
              },
            ),
          ],
        ), 
      ),
    );
  }
}