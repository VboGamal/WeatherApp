import 'package:flutter/material.dart';
import 'package:weather_app/widgets/text_input_with_icon_button.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        iconTheme: const IconThemeData(),
        title: Text(
          "Search",
          style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimaryContainer),
        ),
      ),
      body: TextInputWithIconButton(),
    );
  }
}
