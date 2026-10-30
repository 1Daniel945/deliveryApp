import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/features/auth/data/auth_repository.dart';
import 'package:flutter_application_1/features/presentation/widgets/button_widget1.dart';
import 'package:flutter_application_1/features/profile/presentation/widgets/form_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {

  String? name;
  String? email;
  String? phone;

  final authRepository = AuthRepository();
  
  @override
  void initState() {
    super.initState();
    getCurrentData();
  }

  Future<void> getCurrentData() async {
    try {
      final data = authRepository.getUserProfileData();
      setState(() {
        name = data['name'];
        email = data['email'];
        phone = data['phone'];
      });
    }
    catch(e) {
      throw Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Editar perfil',
          style: TextStyle(
            fontSize: 18,
            fontWeight: .bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    spacing: 20,
                    mainAxisAlignment: .spaceBetween,
                    crossAxisAlignment: .center,
                    children: [
                      Stack(
                        clipBehavior: .none,
                        children: [    
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: Image.network('https://i.ibb.co/hR46vqKw/1779166947552.jpg').image,
                          ),
                          Positioned(
                            bottom: -5,
                            right: -5,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.photo_camera,
                                size: 26,
                              ),
                            ), 
                          ),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text(
                              'Foto de perfil',
                              style: TextStyle(
                                fontWeight: .bold,
                                fontSize: 16,
                              ),
                              overflow: .ellipsis,
                              maxLines: 2,
                            ),
                            const SizedBox(height: 10,),
                            Text(
                              'Puedes agregar una foto para que tus pedidos sean más personales.',
                              style: TextStyle(
                                fontWeight: .normal,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 10,),
                            ButtonWidget1(
                              title: 'Cambiar foto', 
                              icon: Icon(Icons.photo_camera), 
                              color: AppColors.primary, 
                              colorIcon: Colors.black, 
                              onTap: () async {
                                final picker = ImagePicker();
                                final XFile? pickedFile = await picker.pickImage(
                                  source: ImageSource.gallery,
                                );
                                if(pickedFile != null) {
                                  
                                }
                              }
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Formdata(
                  name: name.toString(),
                  email: email.toString(),
                  phone: phone.toString(),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}