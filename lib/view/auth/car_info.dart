import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:uber_driver_app/controller/common/body/single_scroll_column.dart';
import 'package:uber_driver_app/controller/common/button/back_to_login_button.dart';
import 'package:uber_driver_app/controller/constant/constant.dart';
import 'package:uber_driver_app/view/dashboard/dashboard.dart';
import '../../controller/common/button/primary_button.dart';
import '../../controller/common/input_field/common_input_field.dart';
import '../../controller/common/input_field/dropdown_input_field.dart';
import '../../controller/common/util/custom_snack.dart';
import '../../controller/constant/color.dart';
import 'login_screen.dart';

class CarInfo extends StatefulWidget {
  const CarInfo({Key? key}) : super(key: key);

  @override
  State<CarInfo> createState() => _CarInfoState();
}

class _CarInfoState extends State<CarInfo> {
  final _formKey = GlobalKey<FormBuilderState>();
  late bool _isLoading = false;
  final TextEditingController _phoneNumberController = TextEditingController();
  String initialCountry = 'BD';
  PhoneNumber number = PhoneNumber(isoCode: 'BD');
  late String phoneNumber = '';
  final List<DropdownMenuItem<String>> _carTypeList = const [
    DropdownMenuItem(
      alignment: AlignmentDirectional.centerStart,
      value: '1',
      child: Text('Corola - X'),
    ),
    DropdownMenuItem(
      alignment: AlignmentDirectional.centerStart,
      value: '2',
      child: Text('Axio'),
    ),
    DropdownMenuItem(
      alignment: AlignmentDirectional.centerStart,
      value: '3',
      child: Text('Primio'),
    ),
    DropdownMenuItem(
      alignment: AlignmentDirectional.centerStart,
      value: '4',
      child: Text('Toyota'),
    ),
  ];

  saveCarInfo() async {
    try {
      if (_formKey.currentState?.saveAndValidate() ?? false) {
        if (!_isLoading) {
          setState(() {
            _isLoading = true;
          });
          Map driverCarInfoMap = {
            'car_model': _formKey.currentState?.value['car_model'],
            'car_number': _formKey.currentState?.value['car_number'],
            'car_color': _formKey.currentState?.value['car_color'],
            'car_type': _formKey.currentState?.value['car_type'],
          };
          DatabaseReference driverRef =
              FirebaseDatabase.instance.ref().child("drivers");
          driverRef
              .child(currentFirebaseUser!.uid)
              .child("car_details")
              .set(driverCarInfoMap);
          CustomSnack.successSnack('Car information has been saved successfully');
          Get.to(()=> const LoginScreen());
        }
      }
    } catch (e) {
      CustomSnack.warningSnack(e.toString());
    } finally {
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
          child: SingleScrollColumn(children: [
            Image.asset(
              'assets/images/car.jpg',
              height: 150,
              width: 280,
            ),
            const CommonTextField(
              name: 'car_model',
              title: 'Car Model',
              hintText: 'Enter your car model',
              prefixIcon: Icons.car_rental,
            ),
            primarySpacerVertical,
            const CommonTextField(
              name: 'car_number',
              title: 'Car Number',
              hintText: 'Enter your car number',
              prefixIcon: Icons.numbers,
            ),
            primarySpacerVertical,
            const CommonTextField(
              name: 'car_color',
              title: 'Car Color',
              hintText: 'Enter your car color',
              prefixIcon: Icons.color_lens_outlined,
            ),
            primarySpacerVertical,
            DropdownTextField(
              itemList: _carTypeList,
              textFieldWidth: 0,
              name: 'car_type',
              title: 'Car Type',
              hintText: 'Choose your car type',
            ),
            primarySpacerVertical,
            PrimaryButton(
              buttonTitle: 'Submit',
              onTap: () async {
               await saveCarInfo();
              },
              buttonColor: primaryColor,
              isLoading: _isLoading,
            ),
            const BackToLoginButton()
          ]),
        ),
      ),
    );
  }
}
