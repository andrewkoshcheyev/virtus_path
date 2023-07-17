import 'package:flutter/material.dart';

class NavigationGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400, // Set a specific height for your GridView
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 5, // Horizontal space between cards
        mainAxisSpacing: 5, // Vertical space between cards
        childAspectRatio: 3 / 2, // This is the aspect ratio of the cards.
        children: <Widget>[
          _buildCard('Categories', '/categories', context),
          _buildCard('Challenges', '/challenges', context),
          _buildCard('Affirmations', '/favorites', context),
          _buildCard('Mood', '/settings', context),
        ],
      ),
    );
  }

  // Your _buildCard method goes here.
  Card _buildCard(String title, String route, BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            15.0), // This is the border radius of the card.
      ),
      elevation: 5, // This is the shadow of the card.
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18, // Larger font size
              color: Theme.of(context)
                  .primaryColor, // Use primary color for the text
            ),
          ),
        ),
      ),
    );
  }
}
