import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/presentation/widgets/login_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textControllerUser = TextEditingController();
    final textControllerPass = TextEditingController();
    return Material(
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: .bottomStart,
            child: Column(
              crossAxisAlignment: .center,
              children: [
                Image.network('https://i.ibb.co/twWSbVKh/Gemini-Generated-Image.png'),
                LoginCard(
                  textControllerUser: textControllerUser, 
                  textControllerPass: textControllerPass,
                ),
              ],
            ),
          ),
        ), 
      ),
    );
  }
}
