import 'package:flutter/material.dart';
import 'package:ngexam/pages/addCard_page.dart';

class HomePage extends StatefulWidget {
  final List<Map<String, dynamic>> dataList;

  HomePage({required this.dataList});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card List", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
      ),
      body: Column(
        children: [

          Divider(thickness: 1,),

          Expanded(
            child: widget.dataList.isEmpty
                ? Center(
              child: Text('No cards added yet.'),
            )
                : ListView.builder(
              itemCount: widget.dataList.length,
              itemBuilder: (context, index) {
                return CustomCard(
                  cardNumber: widget.dataList[index]['cardNumber'],
                  validThru: widget.dataList[index]['expiryDate'],
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: MaterialButton(
                height: 60,
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddcardPage(),
                    ),
                  );

                  if (result != null) {
                    setState(() {
                      widget.dataList.add(result);
                    });
                  }
                },
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // Circular border
                ),
                child: Text(
                  "Add Card",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget CustomCard({required String cardNumber, required String validThru}) {
    return Container(
      height: 120,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 130,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 20,
                  width: 20,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/visalogo.png"),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cardNumber,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                validThru,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
