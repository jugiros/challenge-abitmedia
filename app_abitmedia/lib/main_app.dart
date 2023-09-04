import 'package:app_abitmedia/pages/PaymentLink.dart';
import 'package:app_abitmedia/pages/PaymentLinkList.dart';
import 'package:app_abitmedia/pages/PaymentRequest.dart';
import 'package:app_abitmedia/pages/PaymentRequestList.dart';
import 'package:flutter/material.dart';

import 'ui/login.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(30, 40, 171, 1.0),
        ),
      ),
      routes: {
        '/payment-request': (context) => const PaymentRequestWidget(),
        '/payment-link': (context) => const PaymentLinkWidget(),
        '/payment-request-list': (context) => const PaymentRequestList(),
        '/payment-link-list': (context) => const PaymentLinkList(),
      },
      home: const Login(),
    );
  }
}
