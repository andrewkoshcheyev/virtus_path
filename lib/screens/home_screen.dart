import 'package:flutter/material.dart';
import '../models/quote.dart';
import 'dart:ui';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';
import '../widgets/navigation_grid.dart';
import '../widgets/quote_card_section.dart';

List<Quote> quotes = [
  Quote(
      text:
          "When I let go of what I am, I become what I might be. When I let go of what I have, I receive what I need.",
      author: "Tao Te Ching",
      imagePath: 'assets/images/image1.jpg'),
  Quote(
      text:
          "Hardships often prepare ordinary people for an extraordinary destiny.",
      author: "C.S. Lewis",
      imagePath: 'assets/images/image2.jpg'),
  Quote(
      text: "The pain you feel today will be the strength you feel tomorrow.",
      author: "Unknown",
      imagePath: 'assets/images/image3.jpg'),
];

/*class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SwipeableCardSectionController _cardController =
        SwipeableCardSectionController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(
              children: <Widget>[
                Container(
                  height: 400, // This line sets the height of the card.
                  child: SwipeableCardsSection(
                    cardController: _cardController,
                    context: context,
                    items:
                        quotes.map((quote) => _buildQuoteCard(quote)).toList(),
                    onCardSwiped: (dir, index, widget) {
                      if (index < quotes.length - 1) {
                        _cardController
                            .addItem(_buildQuoteCard(quotes[index + 1]));
                      }
                    },
                    enableSwipeUp: true,
                    enableSwipeDown: false,
                  ),
                ),
                Container(
                  height: 400, // set a specific height for your GridView
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio:
                        3 / 2, // This is the aspect ratio of the cards.
                    children: <Widget>[
                      _buildCard('Categories', '/categories', context),
                      _buildCard('Challenges', '/challenges', context),
                      _buildCard('Favorites', '/favorites', context),
                      _buildCard('Settings', '/settings', context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  
}*/

/*class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(
              children: <Widget>[
                QuoteCardsSection(quotes: quotes),
                NavigationGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SwipeableCardSectionController _cardController =
        SwipeableCardSectionController();

    return Scaffold(
      backgroundColor:
          Theme.of(context).backgroundColor, // Set the background color
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      bottom:
                          20.0), // Space between QuoteCardStack and NavigationGrid
                  child: QuoteCardsSection(quotes: quotes),
                ),
                NavigationGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
