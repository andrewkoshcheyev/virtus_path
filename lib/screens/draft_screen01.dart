import 'package:flutter/material.dart';

class Draft01Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title", textAlign: TextAlign.center),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.25,
                backgroundImage: AssetImage("assets/images/profile_pic.jpg"),
              ),
              Text(
                "John Doe",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                ),
              ),
              Text(
                "New York, USA",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.03,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        "500",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.05),
                      ),
                      Text("Posts")
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.people,
                        size: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Text("Followers")
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.star,
                        size: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Text("Rating")
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.home),
                  Icon(Icons.search),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
