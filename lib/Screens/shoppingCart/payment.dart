import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
class ePayment extends StatefulWidget {
  const ePayment({Key? key}) : super(key: key);

  @override
  State<ePayment> createState() => _ePaymentState();
}

class _ePaymentState extends State<ePayment> {
  String referenceId = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Payment"),
        backgroundColor: Colors.deepOrange,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              const Text(
                "Payment Methods",
                style: TextStyle(
                  fontSize: 28,
                  color: Color.fromARGB(255, 92, 15, 163),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: Color.fromARGB(255, 92, 15, 163),
                height: 20,
                thickness: 1,
              ),
              SizedBox(
                height: 20,
              ),

              //Image for Khalti
              InkWell(
                splashColor: Colors.grey,
                onTap: () {
                  print("Image Tapped");
                  khaltiWallet();
                }, // Image tapped
                child: Image.asset(
                  'assets/images/khaltilogo.png',
                  width: 180,
                ),
              ),

              SizedBox(
                height: 40,
              ),

              //Cash on Delivery
              InkWell(
                splashColor: Colors.grey,
                onTap: () {
                  AlertDialog(
                    title: const Text("Cash on Delivery"),
                    content: const Text("Payment successful"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("OK"))
                    ],
                  );
                },
                child: Image.asset(
                  'assets/images/cod.png',
                  width: 100,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Divider(
                color: Color.fromARGB(255, 92, 15, 163),
                height: 20,
                thickness: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

}
