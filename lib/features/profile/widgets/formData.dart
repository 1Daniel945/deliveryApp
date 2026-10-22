import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/features/presentation/widgets/button_widget1.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Formdata extends ConsumerStatefulWidget {
  const Formdata({super.key});

  @override
  ConsumerState<Formdata> createState() => _FormdataState();
}

class _FormdataState extends ConsumerState<Formdata> {
  
  bool isRightSelected = false;
  bool isLeftSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Form(
        child: Column(
          children: [
            const SizedBox(height: 16,),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person_outline,
                  color: AppColors.primary,
                ),
                hintText: 'Juan Daniel Jimenez Lopez',
                labelText:'Nombre', 
                floatingLabelBehavior: .always,
              ),
            ),
            const SizedBox(height: 16,),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: AppColors.primary,
                ),
                hintText: 'zonacero945@gmail.com',
                labelText:'correo electrónico', 
                floatingLabelBehavior: .always,
              ),
            ),
            const SizedBox(height: 16,),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.phone_outlined,
                  color: AppColors.primary,
                ),
                hintText: '4451102197',
                labelText:'Número de teléfono', 
                floatingLabelBehavior: .always,
              ),
            ),
            const SizedBox(height: 16,),
            TextFormField(
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
            const SizedBox(height: 16,),
            TextFormField(
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
            const SizedBox(height: 16,),
            ButtonWidget1(
              title: 'Guardar cambios', 
              icon: Icon(Icons.save), 
              color: AppColors.primary, 
              colorIcon: Colors.black, 
              onTap: (){}
            ),
          ],
        ),
      ),
    );
  }
}