import 'package:flutter/material.dart';

class MultiSelectFormField extends FormField<List<String>> {
  MultiSelectFormField({
    Key? key,
    required List<String> dataSource,
    required String titleText,
    required String hintText,
    List<String>? initialValue,
    FormFieldSetter<List<String>>? onSaved,
    FormFieldValidator<List<String>>? validator,
  }) : super(
          key: key,
          initialValue: initialValue ?? [],
          onSaved: onSaved,
          validator: validator,
          builder: (FormFieldState<List<String>> state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  onTap: () async {
                    final List<String>? results = await showDialog<List<String>>(
                      context: state.context,
                      builder: (BuildContext context) {
                        return _MultiSelectDialog(
                          dataSource: dataSource,
                          initialSelectedValues: state.value ?? [],
                          titleText: titleText,
                        );
                      },
                    );
                    if (results != null) {
                      state.didChange(results);
                    }
                  },
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: titleText,
                      errorText: state.hasError ? state.errorText : null,
                      hintText: hintText,
                    ),
                    isEmpty: state.value == null || state.value!.isEmpty,
                    child: Text(
                      state.value?.join(', ') ?? '',
                      style: TextStyle(color: state.value == null || state.value!.isEmpty ? Colors.grey[600] : Colors.black),
                    ),
                  ),
                ),
              ],
            );
          },
        );
}

class _MultiSelectDialog extends StatefulWidget {
  final List<String> dataSource;
  final List<String> initialSelectedValues;
  final String titleText;

  const _MultiSelectDialog({
    Key? key,
    required this.dataSource,
    required this.initialSelectedValues,
    required this.titleText,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectDialogState();
}

class _MultiSelectDialogState extends State<_MultiSelectDialog> {
  late List<String> _selectedValues;

  @override
  void initState() {
    super.initState();
    _selectedValues = widget.initialSelectedValues;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.titleText),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.dataSource.map((item) {
            return CheckboxListTile(
              value: _selectedValues.contains(item),
              title: Text(item),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    _selectedValues.add(item);
                  } else {
                    _selectedValues.remove(item);
                  }
                });
              },
            );
          }).toList(),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('CANCEL'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.of(context).pop(_selectedValues);
          },
        ),
      ],
    );
  }
}
