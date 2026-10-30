import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/features/presentation/widgets/button_widget1.dart';
import 'package:flutter_application_1/features/profile/presentation/controllers/profile_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Formdata extends ConsumerStatefulWidget {
  
  final String name;
  final String email;
  final String phone;

  const Formdata({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
  });

  @override
  ConsumerState<Formdata> createState() => _FormdataState();
}

class _FormdataState extends ConsumerState<Formdata> {

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final directionController = TextEditingController();
  final urlImageController = TextEditingController();
  final bornDateController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    directionController.dispose();
    urlImageController.dispose();
    bornDateController.dispose();
    super.dispose();
  }

  void onEditPressed () async {

    if(formKey.currentState == null || !formKey.currentState!.validate()) {
      return;
    }

    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final phone = phoneController.text.trim();
    final direction = directionController.text.trim();
    final urlImage = urlImageController.text.trim();
    final bornDate = bornDateController.text.trim();
    
    final success = await ref.read(profileControllerProvider.notifier).updateProfile(
      name: name, 
      email: email, 
      phone: phone, 
      direction: direction,
      urlImage: urlImage.isEmpty ? urlImage : null, 
      bornDate: bornDate,
    );

    if(success == true && mounted) {
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
              'Su información fue actualizada.',
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
    }
  }

  @override
  Widget build(BuildContext context) {
    
    nameController.text = widget.name;
    emailController.text = widget.email;
    phoneController.text = widget.phone;
    
    return Container(
      margin: EdgeInsets.all(10),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(height: 16,),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person_outline,
                  color: AppColors.primary,
                ),
                labelText:'Nombre', 
                floatingLabelBehavior: .always,
              ),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: AppColors.primary,
                ),
                labelText:'correo electrónico', 
                floatingLabelBehavior: .always,
              ),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.phone_outlined,
                  color: AppColors.primary,
                ),
                labelText:'Número de teléfono', 
                floatingLabelBehavior: .always,
              ),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              controller: directionController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.location_on_outlined,
                  color: AppColors.primary,
                ),
                hintText: 'Calle plata #76 Moroleón Guanajuato.',
                hintMaxLines: 1,
                hintStyle: TextStyle(
                  overflow: .ellipsis,
                ),
                labelText:'Dirección de entrega', 
                floatingLabelBehavior: .always,
                suffixIcon: Icon(Icons.chevron_right_rounded),
              ),
              onTap: (){},
              showCursor: false,
              readOnly: true,
            ),
            const SizedBox(height: 20,),
            TextFormField(
              controller: bornDateController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.date_range_outlined,
                  color: AppColors.primary,
                ),
                hintText: '14 de febrero 2002',
                hintMaxLines: 1,
                hintStyle: TextStyle(
                  overflow: .ellipsis,
                ),
                labelText: 'Fecha de nacimiento', 
                floatingLabelBehavior: .always,
                suffixIcon: Icon(Icons.chevron_right_rounded),
              ),
              showCursor: false,
              readOnly: true,
            ),
            const SizedBox(height: 20,),
            ButtonWidget1(
              title: 'Guardar cambios', 
              icon: Icon(Icons.save), 
              color: AppColors.primary, 
              colorIcon: Colors.black, 
              onTap: (){
                onEditPressed();
              }
            ),
          ],
        ),
      ),
    );
  }
}