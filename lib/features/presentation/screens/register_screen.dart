import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/features/presentation/widgets/button_widget1.dart';

/*
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _saveForm() {
    if(_formKey.currentState!.validate()) {
      print('Name: ${_nameController.text}');
      print('Email: ${_emailController.text}');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: .min,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'name'),
                    validator: (value) {
                      if(value == null || value.isEmpty) {
                        return 'Por favor ingresa tu nombre';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Correo'),
                    validator: (value) {
                      if(value == null || !value.contains('@')) {
                        return 'Ingresa un correo válido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(onPressed: (){_saveForm();}, child: const Text('Enviar')),
                ],
              ), 
            ),
          ],
        ),
      ),
    );
  }
}
*/

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();

}

class _RegisterScreenState extends State<RegisterScreen> {
  bool hidePass = true;
  Icon ico = Icon(Icons.visibility);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Stack(
          clipBehavior: .none,
          children: [
            Positioned(
              top: -220,
              right: 50,
              child: Image.network(
                'https://i.ibb.co/pB8p3Tq9/moto.png',
                fit: .contain,
                height: 300,
                width: 300,
              ),
            ),
            Column(
              mainAxisSize: .min,
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    border: Border.all(color: AppColors.border),
                    borderRadius: .circular(12),
                  ),
                  child: Form(
                    child: Column(
                      children: [
                        Text(
                          'Crear cuenta',
                          style: TextStyle(
                            fontWeight: .bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 16,),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Nombre',
                            prefixIcon: Icon(Icons.person, color: AppColors.primary,),
                          ),
                          validator: (value) {
                            return null;
                          },
                        ),
                        const SizedBox(height: 16,),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Correo electrónico',
                            prefixIcon: Icon(Icons.mail, color: AppColors.primary,),
                          ),
                          validator: (value) {
                            return;
                          },
                        ),
                        const SizedBox(height: 16,),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Télefono',
                            prefixIcon: Icon(Icons.phone, color: AppColors.primary,)
                          ),
                          validator: (value) {
                            return;
                          },
                        ),
                        const SizedBox(height: 16,),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Contraseña',
                            prefixIcon: Icon(
                              Icons.lock,
                              color: AppColors.primary,
                            ),
                            suffixIcon: IconButton(
                              color: AppColors.primary,
                              onPressed: () {
                                setState(() {
                                  hidePass = !hidePass;
                                });
                              },
                              icon: Icon(
                                hidePass ? Icons.visibility_off : Icons.visibility,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16,),
                        ButtonWidget1(
                          title: 'Registrar', 
                          icon: Icon(Icons.login), 
                          color: AppColors.primary, 
                          colorIcon: Colors.black, 
                          onTap: () {}
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}