import 'package:flutter/material.dart';

import 'package:firstapp/utilities/dailogs/generic_dialog.dart';

Future<bool> showDeleteDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: 'Delete',
    content: 'Are you sure you want to DELETE this item?',
    optionsBuilder: () => {
      'Cancel': false,
      'DELETE': true,
    },
  ).then(
    (value) => value ?? false,
  );
}
