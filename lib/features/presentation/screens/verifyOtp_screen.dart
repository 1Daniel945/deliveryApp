import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/features/auth/presentation/auth_controller.dart';
import 'package:flutter_application_1/features/presentation/widgets/button_widget1.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class OtpView extends ConsumerStatefulWidget {
  final String email;
  const OtpView({
    super.key, 
    required this.email,
  });

  @override
  ConsumerState<OtpView> createState() => _OtpViewState(); 
}

class _OtpViewState extends ConsumerState<OtpView> {
  int remainigSeconds = 300;
  late Timer countdownTimer;
  final TextEditingController pinController = TextEditingController();

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if(remainigSeconds > 0) {
        setState(() {
          remainigSeconds--;
        });
      }
      else {
        countdownTimer.cancel();
      }
    });
  }

  Future<void> verifyOtp () async {
    try{
      await ref.read(authControllerProvider.notifier).verifyOtp(
        email: widget.email, 
        token: pinController.text.trim(),
      );
      if(!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Correo verificado correctamente'),
        behavior: SnackBarBehavior.floating,)
      );
      context.go('/home');
    } catch(e) {
      if(!mounted) return;
      
    }
  }

  @override
  void dispose() {
    countdownTimer.cancel();
    pinController.dispose();
    super.dispose();
  }

  String get formattedTime {
    final muinutes = (remainigSeconds ~/60).toString().padLeft(2, '0');
    final seconds = (remainigSeconds % 60).toString().padLeft(2, '0');
    return '$muinutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    //final isLoading = ref.watch(authControllerProvider);
    final isExpired = remainigSeconds == 0;
    return Scaffold(
      appBar: AppBar(title: const Text('Verificar código'),),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.border),
            borderRadius: .circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: .min,
            spacing: 16,
            children: [
              Text(
                'Ingresa el código OTP',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: .bold,
                ),
              ),
              Text(
                'Introduce el código de 8 dígitos que enviamos a ${widget.email}.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: .normal,
                ),
                textAlign: .left,
              ),
              TextField(
                controller: pinController,
                keyboardType: .number,
                style: TextStyle(
                  wordSpacing: 4.0,
                  letterSpacing: 20,
                  fontWeight: .bold,
                  fontSize: 18,
                ),
                textAlign: .center,
                maxLength: 8,
                enabled: !isExpired,
              ),
              Text(
                isExpired ? 'El código ha expirado, vuelve a solicitar el código de verificación.' : 'El código expira en : $formattedTime minutos.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: .bold,
                  color: isExpired ? Colors.red : Colors.grey.shade700,
                ),
              ),
              ButtonWidget1(
                title: 'Verificar', 
                icon: Icon(Icons.mark_email_read), 
                color: AppColors.primary, 
                colorIcon: Colors.black, 
                onTap: (){
                  verifyOtp();
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}