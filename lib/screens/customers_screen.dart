import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:librarian_app/constants/color_constant.dart';
import 'package:librarian_app/widgets/customers_item.dart';
import 'package:librarian_app/widgets/drawer.dart';

class CustomersScreen extends StatefulWidget {
  static final routname = "CustomersScreen";

  @override
  _CustomersScreenState createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  String _scanBarcode = 'Unknown';
  final seaech = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      if (barcodeScanRes != "1") {
        _scanBarcode = barcodeScanRes;
        seaech.text = barcodeScanRes;
      } else {
        print("not Found");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Text("Manage Customers",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Container(
                      height: 45,
                      margin: EdgeInsets.only(left: 20, top: 18),
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kLightGreyColor),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 25,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search,
                              size: 25,
                              color: kGreyColor,
                            ),
                            Expanded(
                              child: TextField(
                                controller: seaech,
                                style: TextStyle(
                                    fontSize: 17,
                                    color: kBlackColor,
                                    fontWeight: FontWeight.w600),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        right: 10, bottom: 3, left: 10),
                                    border: InputBorder.none,
                                    hintText: 'Search Customers ...',
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: kGreyColor,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18, left: 5),
                      child: IconButton(
                        icon: Icon(
                          Icons.qr_code_scanner,
                          size: 30,
                        ),
                        onPressed: () {
                          scanQR();
                        },
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: CustomersItem(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
