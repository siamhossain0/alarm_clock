import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class HighlightedTitle extends StatelessWidget {
  final String title;
  final String highlightWord;

  const HighlightedTitle({
    Key? key,
    required this.title,
    required this.highlightWord,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: _getHighlightedTitle(),
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  List<TextSpan> _getHighlightedTitle() {
    if (highlightWord.isEmpty || !title.contains(highlightWord)) {
      return [TextSpan(text: title)];
    }

    final List<TextSpan> spans = [];
    final int highlightIndex = title.indexOf(highlightWord);

    if (highlightIndex > 0) {
      spans.add(TextSpan(text: title.substring(0, highlightIndex)));
    }

    spans.add(
      TextSpan(
        text: highlightWord,
        style: const TextStyle(
          color: AppTheme.primaryColor,
        ),
      ),
    );

    if (highlightIndex + highlightWord.length < title.length) {
      spans.add(
        TextSpan(
          text: title.substring(highlightIndex + highlightWord.length),
        ),
      );
    }

    return spans;
  }
}