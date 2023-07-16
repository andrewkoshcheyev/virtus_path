import 'package:flutter/material.dart';
import '../models/quote.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';
import 'dart:ui';

class QuoteCardsSection extends StatelessWidget {
  final List<Quote> quotes;

  QuoteCardsSection({required this.quotes});

  @override
  Widget build(BuildContext context) {
    SwipeableCardSectionController _cardController =
        SwipeableCardSectionController();

    return Container(
      height: 400, // This line sets the height of the card.
      child: SwipeableCardsSection(
        cardController: _cardController,
        context: context,
        items: quotes.map((quote) => _buildQuoteCard(quote)).toList(),
        onCardSwiped: (dir, index, widget) {
          if (index < quotes.length - 1) {
            _cardController.addItem(_buildQuoteCard(quotes[index + 1]));
          }
        },
        enableSwipeUp: true,
        enableSwipeDown: false,
      ),
    );
  }

  // Your _buildQuoteCard method goes here.
  Widget _buildQuoteCard(Quote quote) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Image.asset(quote.imagePath, fit: BoxFit.cover),
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    quote.text, // This is the quote
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24, // Large font size for the quote
                      fontWeight: FontWeight.bold, // Bold weight for the quote
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8), // Space between the quote and the author
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "- " + quote.author, // This is the author
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16, // Smaller font size for the author
                        fontWeight:
                            FontWeight.normal, // Normal weight for the author
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: Icon(
              Icons.format_quote,
              color: Colors.white,
              size: 30,
            ),
          ),
          Positioned(
            bottom: 16,
            child: Padding(
              padding: EdgeInsets.only(
                  right:
                      16.0), // Adjust this value to move the icons to the left
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 30.0,
                    onPressed: () {
                      // Handle press on the favorite button
                    },
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                      width:
                          12.0), // You can adjust this value to change the spacing between the icons
                  IconButton(
                    iconSize: 30.0,
                    onPressed: () {
                      // Handle press on the menu button
                    },
                    icon: Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
