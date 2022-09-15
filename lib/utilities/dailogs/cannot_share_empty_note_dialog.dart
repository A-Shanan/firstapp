import 'package:firstapp/utilities/dailogs/generic_dialog.dart';
import 'package:flutter/material.dart';

Future<void> showCannotShareEmptyNoteDialog(BuildContext context) {
  return showGenericDialog<void>(
    context: context,
    title: 'Sharing',
    content: 'You CANNOT sharing an empty note!!! ',
    optionsBuilder: () => {
      'OK': null,
    },
  );
}
