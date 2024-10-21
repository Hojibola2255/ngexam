import 'package:flutter/material.dart';

class AddcardPage extends StatefulWidget {
  @override
  State<AddcardPage> createState() => _AddcardPageState();
}

class _AddcardPageState extends State<AddcardPage> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();

  void _addData() {
    if (_cardNumberController.text.isNotEmpty && _expiryDateController.text.isNotEmpty) {
      final cardData = {
        'key': ObjectKey(_cardNumberController.text),
        'cardNumber': _cardNumberController.text,
        'expiryDate': _expiryDateController.text,
      };
      Navigator.pop(context, cardData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Card",  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
      ),
      body: Column(
        children: [

          Expanded(child:
          Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(
                    "assets/images/card.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Text(
                  "Enter expiration date",
                  style: TextStyle(
                      color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.black,
                  ),

                  textAlign: TextAlign.center,
                  controller: _cardNumberController,
                  decoration: InputDecoration(
                    hintText: "1234 5678 1234 5678" ,
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 22, fontWeight: FontWeight.w400,),
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120.0),
                child: TextField(
                  keyboardType: TextInputType.datetime,
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.black,
                  ),

                  textAlign: TextAlign.center,
                  controller: _expiryDateController,
                  decoration: InputDecoration(
                    hintText: "12/25",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 22, fontWeight: FontWeight.w400),
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Text(
                  "* Only Visa, MasterCard issued cards supported",
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              ),

            ],
          ),
          ),



          /// Add Card button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: MaterialButton(
                height: 60,
                onPressed: _addData,
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // Circular border
                ),
                child: Text(
                  "Save Card",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
