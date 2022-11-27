import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:form_validator/form_validator.dart';
import 'package:uber_driver_app/controller/constant/constant.dart';
import '../../constant/color.dart';
import '../../constant/typography.dart';

class EmailTextField extends StatelessWidget {
  final String name;
  final bool isSuffixIcon;
  final String? title;
  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final StringValidationCallback? validator;

  const EmailTextField({
    Key? key,
    required this.name,
    this.isSuffixIcon = false,
    this.title,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.controller, this.validator
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: sixteenBlackStyle,
        ),
        const SizedBox(
          height: 12,
        ),
        FormBuilderTextField(
          name: name,
          autofocus: false,
          decoration: InputDecoration(
            filled: true,
            fillColor: assColor,
            contentPadding: const EdgeInsets.all(16),
            hintText: hintText,
            hintStyle: fourteenDeepAssStyle,
            prefixIcon: Icon(prefixIcon,color: iconColor,),
            suffixIcon: isSuffixIcon == false
                ? const SizedBox.shrink()
                : Icon(suffixIcon,color: iconColor,),
            focusedBorder: outline,
            enabledBorder: outline,
            focusColor: primaryColor,
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
            FormBuilderValidators.email(),
          ]),
        ),

      ],
    );
  }
}
