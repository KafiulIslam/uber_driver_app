import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:uber_driver_app/controller/common/body/single_scroll_column.dart';
import 'package:uber_driver_app/controller/constant/constant.dart';
import 'package:uber_driver_app/view/auth/create_driver_account.dart';
import '../../controller/common/button/primary_button.dart';
import '../../controller/common/input_field/email_input_field.dart';
import '../../controller/common/input_field/password_input_field.dart';
import '../../controller/constant/color.dart';
import '../../controller/constant/typography.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  late bool _isLoading = false;
//  final storage = const FlutterSecureStorage();
  late List<dynamic> groupType = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: Center(
          child: FormBuilder(
            key: _formKey,
            enabled: !_isLoading,
            autovalidateMode: AutovalidateMode.disabled,
            onChanged: () {
              _formKey.currentState!.save();
            },
            child: SingleScrollColumn(
                children: [
                  Image.asset(
                    'assets/images/car.jpg',
                    height: 150,
                    width: 280,
                  ),
              const EmailTextField(
              name: 'email',
              title: 'Email',
              hintText: 'batchlearn@gmail.com',
              prefixIcon: Icons.email,
            ),
              primarySpacerVertical,
              const PasswordInputField(
                name: 'password',
                title: 'Password',
                hintText: 'Password',
              ),
              primarySpacerVertical,
              _buildForgotPassword(context),
              primarySpacerVertical,
              PrimaryButton(
                buttonTitle: 'Login',
                onTap: () async {
                  // if (_formKey.currentState
                  //     ?.saveAndValidate() ??
                  //     false) {
                  //   try{
                  //     if (!_isLoading) {
                  //       setState(() {
                  //         _isLoading = true;
                  //       });
                  //       // Send request to server
                  //       var response = await sendLoginRequest(
                  //         _formKey.currentState?.value,
                  //       );
                  //       var data = response['data'];
                  //       final accessKey = data['access'];
                  //       if (response['status'] == 'success') {
                  //         await storage.write(
                  //             key: 'access_key',
                  //             value: accessKey);
                  //         await _loadAllCredential(accessKey);
                  //       } else {
                  //         if (data
                  //             .containsKey('non_field_errors')) {
                  //           CustomSnack.warningSnack('${data['non_field_errors'][0]}');
                  //         } else {
                  //           data.forEach((k, v) {
                  //             _formKey.currentState
                  //                 ?.invalidateField(
                  //                 name: k,
                  //                 errorText: data[k][0]);
                  //           });
                  //         }
                  //       }
                  //     }
                  //   }catch(e){
                  //     CustomSnack.warningSnack('$e');
                  //   }finally{
                  //     setState(() {
                  //       _isLoading = false;
                  //     });
                  //   }
                  // }
                },
                buttonColor: primaryColor,
                //  isLoading: _isLoading,
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPassword(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
            onPressed: () {
            //  Get.to(()=> const ForgotPassword());
            },
            child: const Text(
              'Forgot Password?',
              style: fourteenPrimaryStyle,
            )),
        TextButton(
            onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (_) => const CreateDriverAccount()));
             // Get.to(()=> const CreateStudentAccount());
            },
            child: const Text(
              'Create Account',
              style: sixteenPrimaryStyle,
            )),
        //  Container(height: 5,width: 5,),
      ],
    );
  }

}
