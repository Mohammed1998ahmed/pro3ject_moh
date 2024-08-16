import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class paymentMohammed extends StatefulWidget {
  const paymentMohammed({super.key});

  @override
  State<paymentMohammed> createState() => _paymentMohammedState();
}

class _paymentMohammedState extends State<paymentMohammed> {
  Map<String, dynamic>? paymentIntet;
  void makePayment() async {
    try {
      paymentIntet = await creatPaymentIntent();
      var gpay = const PaymentSheetGooglePay(

          merchantCountryCode: "US", currencyCode: "US", testEnv: true);
      await Stripe.instance.initPaymentSheet(

          paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntet!["client_secret"],
        style: ThemeMode.dark,
        merchantDisplayName: "mohammed",
        googlePay: gpay,

      ));
      displayPaymentSheet();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet(
        
      );
      print("Done");
    } catch (e) {
      print("faild");
    }
  }

  creatPaymentIntent() async {
    try {
      Map<String, dynamic> body = {"amount": "3400", "currency": "USD"};
      http.Response response = await http.post(
          Uri.parse("https://api.stripe.com/v1/payment_intents"),
          body: body,
          headers: {
            "Authorization":
                "Bearer sk_test_51OpWWDCxQy2AfPxbwTOLYLIlzBFtG8CPvJTJBXmTWPmuiF0nR3pK3xDULZA8JkxUzRaSw78JNKflJPVqg8a5MHh600liN8NUqG",
            "Content-Type": "application/x-www-form-urlencoded"
          });
      return json.decode(response.body);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: ElevatedButton(
              onPressed: () {
                makePayment();
                print("mohammed");
              },
              child: Text("payment")),
        ),
      ),
    );
  }
}
