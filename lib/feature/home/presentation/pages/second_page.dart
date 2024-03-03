import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_color.dart';
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
        // Future.delayed(Duration(seconds: 30)).;
        return ListTile(
          title: Text(
            homeMembersData?[index].name ?? '',
            style: TextStyle(color: AppColor.black),
          ),
        );
      },
    );
  }
}