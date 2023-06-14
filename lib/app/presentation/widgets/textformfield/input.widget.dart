import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormInput extends StatelessWidget {
  final String? initialValue;
  final String? text;
  final String? hintText;
  final bool readOnly;
  final bool? enabled;
  final TextEditingController? controller;
  final Color? fillColor;
  final Function(String value)? onChanged;
  final TextCapitalization textCapitalization;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffix;
  final void Function()? onEditingComplete;
  final int? maxLength;

  const TextFormInput({
    Key? key,
    this.initialValue,
    this.text,
    this.hintText,
    this.enabled,
    this.readOnly = false,
    this.controller,
    this.fillColor,
    this.onChanged,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType,
    this.inputFormatters,
    this.suffix,
    this.onEditingComplete,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text == null ? SizedBox() : Text(text!),
          text == null ? SizedBox() : SizedBox(height: 4),
          TextFormField(
            controller: controller,
            initialValue: initialValue,
            decoration: InputDecoration(
              hintText: hintText,
              fillColor: fillColor,
              suffix: suffix,
            ),
            textCapitalization: TextCapitalization.sentences,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            readOnly: readOnly,
            enabled: enabled,
            onChanged: onChanged,
            onEditingComplete: onEditingComplete,
            maxLength: maxLength,
            // maxLengthEnforcement: MaxLengthEnforcement.enforced,
          ),
        ],
      ),
    );
  }
}
