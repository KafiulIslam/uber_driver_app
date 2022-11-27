import 'package:flutter/material.dart';
import '../../constant/color.dart';
import '../../constant/typography.dart';



class PrimaryButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onTap;
  final Color buttonColor;
  final bool isLoading;


  const PrimaryButton({
    Key? key,
    required this.buttonTitle,
    required this.onTap,
    this.buttonColor = primaryColor,
    this.isLoading = false
  }) : super(key: key);

  @override

  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: ElevatedButton(onPressed: isLoading == true ? null : onTap,
          style: ButtonStyle(
            // foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor:  MaterialStateProperty.all<Color>(buttonColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )
              )
          ),
          child: isLoading == true ? const CircularProgressIndicator(
            color: primaryDeepColor,
          ) :
          Text(
            buttonTitle,
            style: sixteenWhiteStyle,
          )),
    );
  }
}