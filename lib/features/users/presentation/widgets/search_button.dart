import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.blue),
      ),
      child: const Icon(
        Icons.search,
      ),
    );
  }
}
