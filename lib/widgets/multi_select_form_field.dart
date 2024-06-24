import 'package:flutter/material.dart';

class MultiSelectFormField extends FormField<List<String>> {
  MultiSelectFormField({
    required List<String> dataSource,
    required String titleText,
    required String hintText,
    required FormFieldSetter<List<String>> onSaved,
    required FormFieldValidator<List<String>> validator,
    List<String>? initialValue,
    Key? key,
  }) : super(
          key: key,
          onSaved: onSaved,
          initialValue: initialValue,
          validator: validator,
          builder: (FormFieldState<List<String>> state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    titleText,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: dataSource.map((item) {
                      return CheckboxListTile(
                        title: Text(item),
                        value: state.value?.contains(item) ?? false,
                        onChanged: (checked) {
                          List<String>? updatedValue = List.from(state.value ?? []);
                          if (checked == true) {
                            if (!updatedValue.contains(item)) {
                              updatedValue.add(item);
                            }
                          } else {
                            if (updatedValue.contains(item)) {
                              updatedValue.remove(item);
                            }
                          }
                          state.didChange(updatedValue);
                        },
                      );
                    }).toList(),
                  ),
                ),
                if (state.hasError)
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      state.errorText ?? '',
                      style: TextStyle(color: Colors.red.shade700, fontSize: 12.0),
                    ),
                  )
              ],
            );
          },
        );
}
