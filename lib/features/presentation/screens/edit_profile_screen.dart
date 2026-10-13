import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override 
  Widget build(BuildContext context) {
    return Text('Hello');
  }
}

@Preview(name: 'editProfile')
Widget previewEditProfile() {
  return Scaffold(
    appBar: AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      title: Text(
        'Editar perfil',
      ),
      
    ),
    body: Form(
      child: Column(
        children: [
          TextFormField(
            
          ),
          TextFormField(),
        ],
      ), 
    ),
  );
}