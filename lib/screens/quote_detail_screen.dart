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
  late int currentIndex;
  late List<Quote> quotes;

  @override
  void initState() {
    super.initState();
    fetchQuotes();
  }

  void fetchQuotes() async {
    quotes = await DatabaseHelper.instance.getQuotes();
    setState(() {
      currentIndex = quotes.indexOf(widget.quote);
    });
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
    Quote currentQuote = quotes[currentIndex];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => goToPreviousQuote(),
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () => goToNextQuote(),
          ),
        ],
      ),
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
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
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
