import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../constant/color.dart';
import '../../constant/constant.dart';
import '../../constant/typography.dart';

class PasswordInputField extends StatefulWidget {
  final String name;
  final String? title;
  final String? hintText;
  // final StringValidationCallback? validator;

  const PasswordInputField(
      {Key? key, required this.name, this.title,  this.hintText})
      : super(key: key);

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {

  late bool _isPassObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title!,
          style: sixteenBlackStyle,
        ),
        const SizedBox(
          height: 12,
        ),
        FormBuilderTextField(
          name: widget.name ,
          obscureText: _isPassObscure,
          decoration: InputDecoration(
            filled: true,
            fillColor: assColor,
            contentPadding: const EdgeInsets.all(16),
            hintText: widget.hintText,
            hintStyle: fourteenDeepAssStyle,
            prefixIcon: const Icon(Icons.lock,color: iconColor,),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _isPassObscure = !_isPassObscure;
                  var index = 0;
                  if (!_isPassObscure) {
                    index = 1;
                  }
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                    child: _isPassObscure
                        ? const Icon(Icons.visibility_off,color: iconColor,)
                        : const Icon(Icons.visibility,color: iconColor,)),
              ),
            ),
            focusedBorder: outline,
            enabledBorder: outline,
            focusColor: primaryColor,
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
          ]),
        ),
      ],
    );
  }
}
