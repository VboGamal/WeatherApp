import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class TextInputWithIconButton extends StatelessWidget {
  TextInputWithIconButton({
    super.key,
  });
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          controller: _textController,
          onSubmitted: (value) {
            var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
            getWeatherCubit.getWeather(value);
            Navigator.pop(context);
          },
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            border: const OutlineInputBorder(),
            hintText: "Enter a City Name",
            labelText: "Search",
            suffixIcon:
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          ),
        ),
      ),
    );
  }
}
