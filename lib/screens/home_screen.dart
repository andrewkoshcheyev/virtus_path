import 'package:flutter/material.dart';
import '../models/quote.dart';
import 'dart:ui';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';
import '../widgets/navigation_grid.dart';
import '../widgets/quote_card_section.dart';
import 'package:animations/animations.dart';
import '../data/quotes_data.dart';

class HomeScreen extends StatelessWidget {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    _selectedIndex = index;
    // TODO: Implement functionality to switch between pages
  }

  @override
  Widget build(BuildContext context) {
    SwipeableCardSectionController _cardController =
        SwipeableCardSectionController();

    return Scaffold(
      backgroundColor:
          Theme.of(context).backgroundColor, // Set the background color
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 16.0), // Adjust the padding here
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Welcome, Username',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white, // Set the text color
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.menu),
                            iconSize: 32.0, // Make the icon bigger
                            color: Colors.white, // Set the icon color
                            onPressed: () {
                              // TODO: Implement the functionality to open the drawer
                            },
                          ),
                        ],
                      ),
                    ),
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
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: Offset(0, 5), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: TextButton(
                      child: Text(
                        'Virtus Path',
                        style: TextStyle(
                            color: _selectedIndex == 0
                                ? Colors.orange
                                : Colors.black),
                      ),
                      onPressed: () {
                        // TODO: Implement functionality to switch to 'Virtus Path'
                      },
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      child: Text(
                        'My Path',
                        style: TextStyle(
                            color: _selectedIndex == 1
                                ? Colors.orange
                                : Colors.black),
                      ),
                      onPressed: () {
                        // TODO: Implement functionality to switch to 'My Path'
                      },
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













/*class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SwipeableCardSectionController _cardController =
        SwipeableCardSectionController();
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Custom scrollable title container
              Container(
                height: 56,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Welcome Back",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    IconButton(
                        icon: Icon(Icons.menu),
                        color: Colors.white,
                        onPressed: () {
                          // Open drawer
                        })
                  ],
                ),
              ),

              Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: QuoteCardsSection(quotes: quotes)),

              NavigationGrid()
            ],
          ),
        ),
      ),
    );
  }
}*/
