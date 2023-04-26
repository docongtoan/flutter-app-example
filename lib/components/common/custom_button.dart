import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String innerText;
  final bool disabled;
  final void Function()? onPressed;
  const CustomButton(
      {Key? key,
      required this.innerText,
      this.disabled = false,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: disabled
            ? const Color.fromRGBO(0, 0, 0, 0.12)
            : const Color(0xff233743),
        borderRadius: BorderRadius.circular(26),
      ),
      child: TextButton(
        onPressed: disabled ? null : onPressed,
        child: Text(
          innerText,
          // '#00000061'
          style: TextStyle(
              color:
                  disabled ? const Color.fromRGBO(0, 0, 0, 0.38) : Colors.white,
              fontSize: 20),
        ),
      ),
    );
  }
}
