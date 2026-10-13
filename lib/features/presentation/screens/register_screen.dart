import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/features/presentation/widgets/button_widget1.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../auth/presentation/auth_controller.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void onRegisterPressed() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final phoneNumber = _phoneController.text.trim(); 

    if(email.isEmpty || password.isEmpty) return;

    final succes = await ref.read(authControllerProvider.notifier).singUp(
      email: email, 
      password: password,
    );

    if(!mounted) return;

    if(succes) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('¡Registro exitoso! Revisa tu correo si requiere confirmación.')),
      );
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Hubo un error al registrarse')),
      );
    }
  }

  bool hidePass = true;
  Icon ico = Icon(Icons.visibility);
  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Stack(
          clipBehavior: .none,
          children: [
            Positioned(
              top: -180,
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
                  margin: EdgeInsets.all(30),
                  padding: EdgeInsets.all(20),
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
                    key: _formKey,
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
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: 'Nombre',
                            prefixIcon: Icon(Icons.person, color: AppColors.primary,),
                          ),
                          validator: (value) {
                            if(value == null || value.isEmpty) {
                              return 'Por favor ingresa tu nombre';
                            }
                            else if(!RegExp(r'^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$').hasMatch(value)) {
                              return 'Nombre no valido debe tener solo letras';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16,),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'Correo electrónico',
                            prefixIcon: Icon(Icons.mail, color: AppColors.primary,),
                          ),
                          validator: (value) {
                            if(value == null || value.isEmpty) {
                              return 'Campo obligatorio';
                            }
                            else if(!value.contains('@')) {
                              return 'Una dirección de correo electrónico debe llevar @';
                            }
                            else if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                              return 'Ingresa un correo electrónico válido';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16,),
                        TextFormField(
                          controller: _phoneController,
                          keyboardType: .number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            hintText: 'Télefono',
                            prefixIcon: Icon(Icons.phone, color: AppColors.primary,)
                          ),
                          validator: (value) {
                            if(value.toString().length != 10) {
                              return 'Debe tener exactamente 10 dígitos';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16,),
                        TextFormField(
                          controller: _passwordController,
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
                          obscureText: hidePass,
                          validator: (value) {
                            if(value == null || value.isEmpty || !RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$').hasMatch(value)) {
                              return 'Minimo 8 caracteres, una mayuscula, \nun número y un símbolo';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16,),
                        isLoading ? const CircularProgressIndicator() :
                        ButtonWidget1(
                          title: 'Registrarse', 
                          icon: Icon(Icons.login), 
                          color: AppColors.primary, 
                          colorIcon: Colors.black, 
                          onTap: () {
                            onRegisterPressed();
                          }
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