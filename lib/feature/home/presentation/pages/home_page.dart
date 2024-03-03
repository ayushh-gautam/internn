import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: _mainSection(context),
    );
  }

  Center _mainSection(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            context.read<HomeBloc>().add(GetHomeData(
                apiUrl:
                    'https://rotarydistrict3292.org.np/api/club/member/search'));
          },
          child: Text('send ')),
    );
  }
}