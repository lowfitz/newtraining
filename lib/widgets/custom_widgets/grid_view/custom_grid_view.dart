// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bussiness_app/modules/home/cubit/cubit.dart';
import 'package:new_bussiness_app/modules/home/cubit/states.dart';
import 'package:new_bussiness_app/modules/home/domain/home_model.dart';

class CustomGrid extends StatefulWidget {
  CustomGrid({
    super.key,
  });

  Categories? cat;
  @override
  State<CustomGrid> createState() => _CustomGridState();
}

class _CustomGridState extends State<CustomGrid> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit()..getHomeData(context: context),
      child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = HomeCubit.get(context);
            return SizedBox(
              height: 250,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: GridView.builder(
                  itemCount: cubit.categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 3,
                      mainAxisSpacing: 3,
                      childAspectRatio: 1 / 1),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Card(
                    elevation: 10,
                    child: Container(
                      height: 150,
                      width: 150,
                      color: Colors.white30,
                      child: GridTile(
                        footer: Center(
                            child: Text(cubit.categories[index].name ?? "")),
                        child: SizedBox(
                          height: 150,
                          width: 150,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Image.network(
                              cubit.categories[index].iconUrl ?? "",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
