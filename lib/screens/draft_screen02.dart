import 'package:flutter/material.dart';

class Draft02Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Column(
            children: [
              // Quote card
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        "This is an inspirational quote",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "- Author Name",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: 14, fontStyle: FontStyle.italic),
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(height: 16),

              // Section 1
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Icon(Icons.person, size: 60, color: Colors.white),
                    SizedBox(height: 8),
                    Text("Title Text",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        textAlign: TextAlign.center),
                    SizedBox(height: 8),
                    Text("Body text goes here",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center)
                  ],
                ),
              ),

              SizedBox(height: 16),

              // Section 2
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Icon(Icons.settings, size: 60, color: Colors.white),
                    SizedBox(height: 8),
                    Text("Title Text",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        textAlign: TextAlign.center),
                    SizedBox(height: 8),
                    Text("Body text goes here",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center)
                  ],
                ),
              ),

              SizedBox(height: 16),

              // Section 3
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: [
                    Icon(Icons.menu, size: 60, color: Colors.white),
                    SizedBox(height: 8),
                    Text("Title Text",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        textAlign: TextAlign.center),
                    SizedBox(height: 8),
                    Text("Body text goes here",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center)
                  ],
                ),
              ),

              // Bottom navigation
              Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.home, color: Colors.grey[600]),
                    Icon(Icons.search, color: Colors.grey[600]),
                    Icon(Icons.settings, color: Colors.grey[600]),
                    Icon(Icons.menu, color: Colors.grey[600])
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
