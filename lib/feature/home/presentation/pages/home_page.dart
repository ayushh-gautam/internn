import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamyogya_intern_task/core/constants/constants.dart';
import 'package:kamyogya_intern_task/feature/home/presentation/bloc/cubit/copy_cubit.dart';
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
  Column _mainSection(BuildContext context) {
    TextEditingController endpointcontroller =
        TextEditingController(text: Constants().apiEndpoint);
    TextEditingController userinputcontroller = TextEditingController();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 280,
              child: TextField(
                maxLines: 3,
                controller: endpointcontroller,
                readOnly: true,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<CopyCubit>().copy(endpointcontroller.text);
                 // print('PRESSED');
                },
                child: const Text('copy'))
          ],
        ),

        //the field where the api endpoint should be pasted
        Container(
          width: 500,
          margin: const EdgeInsets.only(top: 50, left: 10, right: 10),
          child: TextFormField(
            controller: userinputcontroller,
            decoration: const InputDecoration(labelText: 'paste the url here'),
          ),
        ),
        Center(
          child: ElevatedButton(
              onPressed: () {
                context.read<HomeBloc>().add(GetHomeData(context,
                    apiUrl: userinputcontroller.text.toString()));
              },
              child: const Text('Fetch Data')),
        ),
      ],
    );
  }
}
