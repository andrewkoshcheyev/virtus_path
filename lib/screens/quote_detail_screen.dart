import 'package:flutter/material.dart';
import '../models/quote.dart';
import 'dart:ui';
import '../helpers/database_helper.dart';

class QuoteDetailScreen extends StatefulWidget {
  final Quote quote;

  QuoteDetailScreen({required this.quote});

  @override
  _QuoteDetailScreenState createState() => _QuoteDetailScreenState();
}

class _QuoteDetailScreenState extends State<QuoteDetailScreen> {
  int currentIndex = 0;
  List<Quote> quotes = [];
  bool isShuffleActivated = false;

  @override
  void initState() {
    super.initState();
    fetchQuotes();
  }

  void fetchQuotes() async {
    quotes = await DatabaseHelper.instance.getQuotes();
    if (quotes.contains(widget.quote)) {
      setState(() {
        currentIndex = quotes.indexOf(widget.quote);
      });
    }
  }

  void goToNextQuote() {
    if (currentIndex < quotes.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  void goToPreviousQuote() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (quotes.isEmpty) {
      // Quotes have not been loaded yet, return a loading indicator
      return CircularProgressIndicator();
    }

    Quote currentQuote = quotes[currentIndex];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(currentQuote.imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(
            color: Colors.black.withOpacity(0.6),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    Expanded(
                      flex: 7,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.arrow_back_ios,
                                        color: Colors.white),
                                    onPressed: () => goToPreviousQuote(),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          currentQuote.text,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(height: 8),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            "- " + currentQuote.author,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.arrow_forward_ios,
                                        color: Colors.white),
                                    onPressed: () => goToNextQuote(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Divider(color: Colors.white),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.favorite, color: Colors.white),
                              Icon(Icons.share, color: Colors.white),
                              Icon(Icons.edit, color: Colors.white),
                            ],
                          ),
                          SizedBox(height: 16),
                          Text(
                            currentQuote.categories.join(', '),
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Card(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text('Open Categories'),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.shuffle,
                              color: isShuffleActivated
                                  ? Colors.blue
                                  : Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                isShuffleActivated = !isShuffleActivated;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
