import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:uber_driver_app/controller/common/body/single_scroll_column.dart';
import 'package:uber_driver_app/controller/common/button/back_to_login_button.dart';
import 'package:uber_driver_app/controller/constant/constant.dart';
import 'package:uber_driver_app/view/auth/car_info.dart';
import '../../controller/common/button/primary_button.dart';
import '../../controller/common/input_field/common_input_field.dart';
import '../../controller/common/input_field/email_input_field.dart';
import '../../controller/common/input_field/password_input_field.dart';
import '../../controller/common/util/custom_snack.dart';
import '../../controller/constant/color.dart';
import '../../controller/constant/typography.dart';


class CreateDriverAccount extends StatefulWidget {
  const CreateDriverAccount({Key? key}) : super(key: key);

  @override
  State<CreateDriverAccount> createState() => _CreateDriverAccountState();
}

class _CreateDriverAccountState extends State<CreateDriverAccount> {

  final _formKey = GlobalKey<FormBuilderState>();
  late bool _isLoading = false;
  final TextEditingController _phoneNumberController = TextEditingController();
  String initialCountry = 'BD';
  PhoneNumber number = PhoneNumber(isoCode: 'BD');
  late String phoneNumber = '';

  saveDriverInfoNow() async {
   try{
     if (_formKey.currentState?.saveAndValidate() ?? false) {
       if (!_isLoading) {
         setState(() {
           _isLoading = true;
         });
         final User? firebaseUser = (
             await fAuth.createUserWithEmailAndPassword(
                 email: _formKey.currentState?.value['email'],
                 password: _formKey.currentState?.value['password'])
         ).user;
         if(firebaseUser != null){
           Map driverInfoMap = {
             'id' : firebaseUser.uid,
             'name' : _formKey.currentState?.value['name'],
             'email' : _formKey.currentState?.value['email'],
             'password' : _formKey.currentState?.value['password'],
           };
           DatabaseReference driverRef = FirebaseDatabase.instance.ref().child("drivers");
           driverRef.child(firebaseUser.uid).set(driverInfoMap);
           currentFirebaseUser = firebaseUser;
           CustomSnack.successSnack('Account has been created successfully');
           Get.to(()=> const CarInfo());
       }}
     }else{
       Get.back();
       CustomSnack.warningSnack('Account creation is failed');
     }
   }catch(e){
     CustomSnack.warningSnack(e.toString());
   }finally{
     setState(() {
       _isLoading = false;
     });
   }
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        // appBar: const CustomAppBar(title: 'Register Account',),
        body: FormBuilder(
          key: _formKey,
          enabled: !_isLoading,
          autovalidateMode: AutovalidateMode.disabled,
          onChanged: () {
            _formKey.currentState!.save();
          },
          child: SingleScrollColumn(

              children: [
                Image.asset('assets/images/car.jpg', height: 150, width: 280,),
                const CommonTextField(
                  name: 'name',
                  title: 'Name',
                  hintText: 'Ex.Jhonny',
                  prefixIcon: Icons.person,
                ),
                primarySpacerVertical,
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
                _buildPhoneNumberInputField(context),
                primarySpacerVertical,
                PrimaryButton(
                  buttonTitle: 'Create Account',
                  onTap: () async {
                    await saveDriverInfoNow();
                  },
                  buttonColor: primaryColor,
                  isLoading: _isLoading,
                ),
                const BackToLoginButton(),
              ]),
        ),
      ),
    );
  }

  Widget _buildPhoneNumberInputField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Phone Number:', style: sixteenBlackStyle),
        const SizedBox(height: 10,),
        InternationalPhoneNumberInput(
          inputDecoration: InputDecoration(
            filled: true,
            fillColor: assColor,
            contentPadding: const EdgeInsets.all(16),
            hintText: 'Phone Number',
            hintStyle: fourteenDeepAssStyle,
            focusedBorder: outline,
            enabledBorder: outline,
            focusColor: primaryColor,
          ),
          onInputChanged: (PhoneNumber number) {},
          // onInputValidated: (bool value) {
          //   print(value);
          // },
          selectorConfig: const SelectorConfig(
            selectorType: PhoneInputSelectorType.DROPDOWN,
          ),
          ignoreBlank: false,
          autoValidateMode: AutovalidateMode.disabled,
          selectorTextStyle: const TextStyle(color: Colors.black),
          initialValue: number,
          textFieldController: _phoneNumberController,
          formatInput: false,
          keyboardType:
          const TextInputType.numberWithOptions(signed: true, decimal: true),
          onSaved: (PhoneNumber number) {
            phoneNumber = number.phoneNumber!;
          },
        )
      ],);
  }

}
