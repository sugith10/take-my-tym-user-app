import 'dart:convert';
import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class StripePayment {
  Future createPaymentIntent({
    required String name,
    required String pin,
    required String city,
    required String state,
    required String amount,
    required String address,
  }) async {
    final Uri url = Uri.parse("https://api.stripe.com/v1/payment_intents");
    final String secretKey = dotenv.env["STRIPE_SECRET_KEY"]!;
    final body = {
      'amount': amount,
      'currency': 'INR',
      'automatic_payment_methods[enabled]': 'true',
      'description': "Test Donation",
      'shipping[name]': name,
      'shipping[address][line1]': address,
      'shipping[address][postal_code]': pin,
      "shipping[address][city]": city,
      "shipping[address][state]": state,
      "shipping[address][country]": 'INDIA',
    };

    final response = await http.post(url,
        headers: {
          "Authorization": "Bearer $secretKey",
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: body);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      log(json.toString());
      return json;
    } else {
      log("error in payment");
    }
  }
}
