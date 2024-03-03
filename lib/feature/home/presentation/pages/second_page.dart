import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/home_data_model.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen({super.key});

  HomeDataModel? homeDataModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadedState) {
              homeDataModel = state.homeDataModel;
              return _mainSection(state.itemCount);
            } else {
              return const Center(
                child: Text('Error loading Page'),
              );
            }
          },
        ));
  }

  ListView _mainSection(int itemCount) {
    var homeMembersData = homeDataModel?.data?.members;
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) {
        Future.delayed(const Duration(seconds: 3));
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          padding: const EdgeInsets.all(15),
          height: 120,
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRect(
                child: Image.network(homeMembersData?[index].image ?? ''),
              ),
              Column(
                children: [Text(homeMembersData?[index].name ?? '')],
              ),
         
            ],
          ),
        );

        //ListTile(
        //   title: Text(
        //     homeMembersData?[index].name ?? '',
        //     style: const TextStyle(color: AppColor.black),
        //   ),
        // );
      },
    );
  }
}
//TODO:: clean ui