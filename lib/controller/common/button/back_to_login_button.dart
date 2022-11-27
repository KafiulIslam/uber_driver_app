import 'package:flutter/material.dart';
import '../../../view/auth/login_screen.dart';
import '../../constant/color.dart';

class BackToLoginButton extends StatelessWidget {
  const BackToLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
    }, child: const Text('Back To Login',style: TextStyle(
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      fontFamily: 'Nunito',
      color: primaryColor,
      letterSpacing: 1,
    ),));
  }
}
