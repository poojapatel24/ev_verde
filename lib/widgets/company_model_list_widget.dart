import 'package:ev_verde/bloc/companylist_cubit.dart';
import 'package:ev_verde/bloc/companymodellist_cubit.dart';
import 'package:ev_verde/bloc/states/companylist_state.dart';
import 'package:ev_verde/bloc/states/companymodellist_state.dart';
import 'package:ev_verde/model/companyname/responsecompanynamelist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/ev_verde_repo.dart';

class CompanyModelListWidget extends StatefulWidget {
  int vid;

  CompanyModelListWidget({required this.vid, super.key});

  @override
  State<StatefulWidget> createState() => _CompanyModelListWidget();
}

class _CompanyModelListWidget extends State<CompanyModelListWidget> {
  late CompanyModelListCubit cubit;

  @override
  void initState() {
    if (kDebugMode) {
      print('model init  ${widget.vid}');
    }
    cubit = CompanyModelListCubit(EvVerdeRepo(), widget.vid);
    cubit.getCompanyModelList(vid: widget.vid);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CompanyModelListWidget oldWidget) {
    if (kDebugMode) {
      print('model update widget ${widget.vid}');
    }
    cubit.getCompanyModelList(vid: widget.vid);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    var selectedModelName ;
    if (kDebugMode) {
      print('model api ${selectedModelName}');
    }
    //cubit.getCompanyModelList(vid: widget.vid);
    return BlocProvider(
      //create: (context) => CompanyModelListCubit(EvVerdeRepo(), widget.vid),
      create: (context) => cubit,
      child: BlocConsumer<CompanyModelListCubit, CompanyModelListState>(
        listener: (context, state) {},
        builder: (context, state) {
          if(state is CompanyModelListLoading){
            return DropdownButtonFormField(
              hint: const Text('Select Model Name'),
              items: const [],
              onChanged: (value) {  },
            );
          }
          if (state is CompanyModelLoaded) {
            return DropdownButtonFormField(
              value: state.companyModel.data?[0].vehicleModelId,
              hint: const Text('Select Model Name'),
              items: state.companyModel.data?.map((e) {
                return DropdownMenuItem(
                    value: e.vehicleModelId,
                    child: Text('${e.modelName}'));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedModelName = value!;
                });
                if (kDebugMode) {
                  print(selectedModelName);
                }
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
