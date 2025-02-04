import 'package:fitnest_app/common/constants/global_variable.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ErrorPage router',style: textTheme(context).bodyMedium,),
      ),
    );
  }
}