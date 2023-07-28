import 'package:flutter/material.dart';

class Draft01Screen extends StatelessWidget {
  const Draft01Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Title", textAlign: TextAlign.center),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.25,
                backgroundImage: const AssetImage("assets/images/profile_pic.jpg"),
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
                      const Text("Posts")
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.people,
                        size: MediaQuery.of(context).size.width * 0.05,
                      ),
                      const Text("Followers")
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.star,
                        size: MediaQuery.of(context).size.width * 0.05,
                      ),
                      const Text("Rating")
                    ],
                  )
                ],
              ),
              const Row(
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
