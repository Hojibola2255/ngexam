import 'package:flutter/material.dart';
import 'package:ngexam/pages/home_page.dart';

class AddcardPage extends StatefulWidget {
  const AddcardPage({super.key});

  @override
  State<AddcardPage> createState() => _AddcardPageState();
}

class _AddcardPageState extends State<AddcardPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Card"),
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image(image: AssetImage("assets/images/card.png"),
                  fit: BoxFit.cover,
                  ),

                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Text("Enter expiration date", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Card number",
                    border: UnderlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),

              SizedBox(height: 10),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120.0),
                child: TextField(

                  decoration: InputDecoration(
                    hintText: "valid thru",
                    border: UnderlineInputBorder(),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
              ),

              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Text("* Only Visa, MasterCard issued cards supported", style: TextStyle(color: Colors.black, fontSize: 12),),
              ),

              SizedBox(height: 200,),

              /// Add Card button
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: MaterialButton(
                    height: 60,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomePage()),
                      );
                    },
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

        ),


      ),
    );
  }
}
