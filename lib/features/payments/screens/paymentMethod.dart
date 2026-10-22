import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/features/presentation/widgets/button_widget1.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentmethodScreen extends StatelessWidget {
  const PaymentmethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              'Métodos de pago',
              style: TextStyle(fontSize: 18, fontWeight: .bold),
            ),
            Text(
              'Selecciona cómo quieres pagar tu pedido',
              style: TextStyle(fontSize: 16, fontWeight: .normal),
            ),
          ],
        ),
      ),
      /*body: Container(
        margin: EdgeInsets.all(10),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.border),
                    borderRadius: .circular(12),
                    color: AppColors.textPrimary,
                  ),
                  child: Row(
                    mainAxisAlignment: .start,
                    spacing: 16,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/credit_card.svg',
                        width: 60,
                        height: 60,
                        fit: .contain, 
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text(
                              'Tarjeta de crédito o débito',
                              style: TextStyle(
                                fontWeight: .bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 4,),
                            Text(
                              'Paga de forma segura con tu tarjeta a través de Stripe.',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: .normal,
                              ),
                              overflow: .ellipsis,
                              maxLines: 3,
                            ),
                            const SizedBox(height: 8,),
                            Row(
                              spacing: 16,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: .circular(12),
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/icons/visa.svg',
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: .circular(12),
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/icons/mastercard.svg',
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Radio(
                        value: 10,
                        activeColor: AppColors.primary,
                        fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                            if (states.contains(WidgetState.disabled)) {
                              return Colors.white;
                            }
                            else {
                              return AppColors.primary;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.border),
                    borderRadius: .circular(12),
                    color: AppColors.textPrimary,
                  ),
                  child: Row(
                    mainAxisAlignment: .start,
                    spacing: 16,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/coins.svg',
                        width: 60,
                        height: 60,
                        fit: .contain, 
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text(
                              'Efectivo',
                              style: TextStyle(
                                fontWeight: .bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 4,),
                            Text(
                              'Puedes pagar en efectivo al momento de recibir tu pedido.',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: .normal,
                              ),
                              overflow: .ellipsis,
                              maxLines: 3,
                            ),
                          ],
                        ),
                      ),
                      Radio(
                        value: 10,
                        activeColor: AppColors.primary,
                        fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                            if (states.contains(WidgetState.disabled)) {
                              return Colors.white;
                            }
                            else {
                              return AppColors.primary;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.only(top: 20, left: 10, right: 15, bottom: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.border),
                    borderRadius: .circular(12),
                    color: AppColors.textPrimary,
                  ),
                  child: Row(
                    mainAxisAlignment: .start,
                    spacing: 16,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/coins.svg',
                        width: 60,
                        height: 60,
                        fit: .contain, 
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Text(
                              'Tus pagos están protegidos',
                              style: TextStyle(
                                fontWeight: .bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 4,),
                            Text(
                              'Toda tu información se procesa de forma segura a través de Stripe.',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: .normal,
                              ),
                              overflow: .ellipsis,
                              maxLines: 3,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Stripe',
                        style: TextStyle(
                          fontWeight: .bold,
                          fontSize: 16,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 40,
              right: 5,
              child: SvgPicture.asset(
                'assets/illustration.svg',
                width: 300,
                height: 300,
              ), 
            ),
            Positioned(
              bottom: 10,
              child: ButtonWidget1(
                title: 'Continuar', 
                icon: Icon(Icons.confirmation_num), 
                color: AppColors.primary,
                colorIcon: Colors.transparent, 
                onTap: (){}
              ),
            ),
          ],
        ),
      ),*/
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 240,),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.border),
                                  borderRadius: .circular(12),
                                  color: AppColors.textPrimary,
                                ),
                                child: Row(
                                  mainAxisAlignment: .start,
                                  spacing: 16,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/credit_card.svg',
                                      width: 60,
                                      height: 60,
                                      fit: .contain, 
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: .start,
                                        children: [
                                          Text(
                                            'Tarjeta de crédito o débito',
                                            style: TextStyle(
                                              fontWeight: .bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          const SizedBox(height: 4,),
                                          Text(
                                            'Paga de forma segura con tu tarjeta a través de Stripe.',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: .normal,
                                            ),
                                            overflow: .ellipsis,
                                            maxLines: 3,
                                          ),
                                          const SizedBox(height: 8,),
                                          Row(
                                            spacing: 16,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(left: 5, right: 5),
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: .circular(12),
                                                ),
                                                child: SvgPicture.asset(
                                                  'assets/icons/visa.svg',
                                                  width: 50,
                                                  height: 50,
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(left: 5, right: 5),
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: .circular(12),
                                                ),
                                                child: SvgPicture.asset(
                                                  'assets/icons/mastercard.svg',
                                                  width: 50,
                                                  height: 50,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Radio(
                                      value: 10,
                                      activeColor: AppColors.primary,
                                      fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                                          if (states.contains(WidgetState.disabled)) {
                                            return Colors.white;
                                          }
                                          else {
                                            return AppColors.primary;
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.border),
                                  borderRadius: .circular(12),
                                  color: AppColors.textPrimary,
                                ),
                                child: Row(
                                  mainAxisAlignment: .start,
                                  spacing: 16,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/coins.svg',
                                      width: 60,
                                      height: 60,
                                      fit: .contain, 
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: .start,
                                        children: [
                                          Text(
                                            'Efectivo',
                                            style: TextStyle(
                                              fontWeight: .bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          const SizedBox(height: 4,),
                                          Text(
                                            'Puedes pagar en efectivo al momento de recibir tu pedido.',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: .normal,
                                            ),
                                            overflow: .ellipsis,
                                            maxLines: 3,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Radio(
                                      value: 10,
                                      activeColor: AppColors.primary,
                                      fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                                          if (states.contains(WidgetState.disabled)) {
                                            return Colors.white;
                                          }
                                          else {
                                            return AppColors.primary;
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: .circular(12),
                                  color: AppColors.backgroundErrorMessageWarning,
                                ),
                                child: Row(
                                  mainAxisAlignment: .start,
                                  spacing: 16,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/Safe.svg',
                                      width: 60,
                                      height: 60,
                                      fit: .contain, 
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: .spaceBetween,
                                        children: [
                                          Text(
                                            'Tus pagos están protegidos',
                                            style: TextStyle(
                                              fontWeight: .bold,
                                              fontSize: 16,
                                              color: AppColors.textPrimary,
                                            ),
                                          ),
                                          const SizedBox(height: 4,),
                                          Text(
                                            'Toda tu información se procesa de forma segura a través de Stripe.',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: .normal,
                                              color: AppColors.textPrimary,
                                            ),
                                            overflow: .ellipsis,
                                            maxLines: 3,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      'Stripe',
                                      style: TextStyle(
                                        fontWeight: .bold,
                                        fontSize: 16,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),  
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 60,
                          right: 10,
                          child: SvgPicture.asset(
                            'assets/illustration.svg',
                            width: 250,
                            height: 250,
                            fit: .contain,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: ButtonWidget1(
                            title: 'Continuar', 
                            icon: const Icon(Icons.confirmation_num), 
                            color: AppColors.primary, 
                            colorIcon: Colors.transparent, 
                            onTap: (){}
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}