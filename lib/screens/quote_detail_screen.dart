import 'package:flutter/material.dart';
import '../models/quote.dart';

class QuoteDetailScreen extends StatelessWidget {
  final Quote quote;

  QuoteDetailScreen({required this.quote});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quote Detail'),
      ),
      body: Center(
        child: Text('Quote Detail Screen for ${quote.text}'),
      ),
    );
  }
}
