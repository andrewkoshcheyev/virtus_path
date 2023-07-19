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
    // Rest of your build method
  }
}
