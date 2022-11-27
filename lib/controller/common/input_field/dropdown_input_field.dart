import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../constant/color.dart';
import '../../constant/constant.dart';
import '../../constant/typography.dart';


class DropdownTextField extends StatelessWidget {
  final String? title;
  final String name;
  final String hintText;
  final List<DropdownMenuItem<String>> itemList;
  final double textFieldWidth;
  final bool isFocusNodeOn;

  const DropdownTextField(
      {Key? key,
        this.title,
        this.hintText = '',
        required this.itemList,
        required this.textFieldWidth,
        required this.name,
        this.isFocusNodeOn = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: const TextStyle(
              fontWeight: FontWeight.w600, fontSize: 16, fontFamily: 'Nunito'),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          width: MediaQuery.of(context).size.width / textFieldWidth,
          child: FormBuilderDropdown<String>(
            name: name,
           // focusNode: isFocusNodeOn == false ? AlwaysDisabledFocusNode() : AlwaysEnableFocusNode()  ,
            decoration: InputDecoration(
              filled: true,
              fillColor: assColor,
              contentPadding: const EdgeInsets.all(16),
              hintText: hintText,
              hintStyle: fourteenDeepAssStyle,
              focusedBorder: outline,
              enabledBorder: outline,
              focusColor: primaryColor,
            ),
            validator: FormBuilderValidators.compose(
                [FormBuilderValidators.required()]),
            items: itemList,
            valueTransformer: (val) => val?.toString(),
          ),
        ),
      ],
    );
  }
}
