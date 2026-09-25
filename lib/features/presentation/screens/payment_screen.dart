import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/features/presentation/widgets/credit_card.dart';
import 'package:go_router/go_router.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        automaticallyImplyLeading: false,
        title: Row(
          spacing: 8,
          children: [
            IconButton(
              onPressed: () {
                context.pop();
              }, 
              icon: Icon(Icons.arrow_back),
            ),
            Text(
              'Configurar método de pago', 
              style: TextStyle(
                fontSize: 18,
                fontWeight: .bold,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        width: .maxFinite,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            CreditCard(),
            Divider(
              endIndent: 10,
              indent: 10,
            ),
            
          ],
        ),
      ),
    );
  }
}
