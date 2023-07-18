import 'package:flutter/material.dart';
import '../models/quote.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';
import 'dart:ui';
import 'package:animations/animations.dart';
import '../screens/quote_detail_screen.dart';

class QuoteCardsSection extends StatefulWidget {
  final List<Quote> quotes;

  QuoteCardsSection({required this.quotes});

  @override
  _QuoteCardsSectionState createState() => _QuoteCardsSectionState();
}

class _QuoteCardsSectionState extends State<QuoteCardsSection> {
  late SwipeableCardSectionController _cardController;

  @override
  void initState() {
    super.initState();
    _cardController = SwipeableCardSectionController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: SwipeableCardsSection(
        cardController: _cardController,
        context: context,
        items: widget.quotes
            .map((quote) => _buildQuoteCard(context, quote))
            .toList(),
        onCardSwiped: (dir, index, widget) {
          if (index < widget.quotes.length - 1) {
            _cardController
                .addItem(_buildQuoteCard(context, widget.quotes[index + 1]));
          }
        },
        enableSwipeUp: true,
        enableSwipeDown: false,
      ),
    );
  }

  Widget _buildQuoteCard(BuildContext context, Quote quote) {
    return OpenContainer(
      transitionType: ContainerTransitionType.fade,
      openBuilder: (BuildContext context, VoidCallback _) {
        return QuoteDetailScreen(quote: quote);
      },
      closedElevation: 5.0,
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      closedColor: Theme.of(context).cardColor,
      closedBuilder: (BuildContext context, VoidCallback openContainer) {
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
                        quote.text,
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
                          "- " + quote.author,
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
                  padding: EdgeInsets.only(right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        iconSize: 30.0,
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 12.0),
                      IconButton(
                        iconSize: 30.0,
                        onPressed: () {},
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
      },
    );
  }
}
