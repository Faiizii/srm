import 'package:flutter/material.dart';
void showSnackBar(BuildContext context,String message,String actionText)
{
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: actionText,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ));
}