import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/profile/screens/widgets/image_as_icon_container.dart';
import 'package:food_delivery_app/utilis/constants/colors.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';

class FProfileRowIconTextFormField extends StatefulWidget {
  final String image;
  final String label;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;

  const FProfileRowIconTextFormField({
    super.key,
    required this.image,
    required this.label,
    required this.controller,
    this.validator,
  });

  @override
  State<FProfileRowIconTextFormField> createState() =>
      _FProfileRowIconTextFormFieldState();
}

class _FProfileRowIconTextFormFieldState
    extends State<FProfileRowIconTextFormField> {
  bool isReadOnly = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          FImageAsIconContainer(image: widget.image),
          SizedBox(width: 8.0),
          Expanded(
            child: TextFormField(
              readOnly: isReadOnly,
              controller: widget.controller,
              validator: widget.validator,
              cursorColor: FColor.orange,
              decoration: InputDecoration(
                labelText: widget.label,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isReadOnly = !isReadOnly;
                    });
                  },
                  icon:
                      isReadOnly
                          ? Icon(Icons.lock_outline, color: FColor.orange)
                          : Icon(Icons.lock_open),
                ),
              ),
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: FSize.fontSizeLg,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
