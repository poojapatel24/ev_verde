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
  var selectedModelName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompanyModelListCubit(EvVerdeRepo(), widget.vid),
      child: BlocConsumer<CompanyModelListCubit, CompanyModelListState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CompanyModelLoaded) {
            return DropdownButtonFormField(
              value: selectedModelName,
              hint: const Text('Select Company Model'),
              items: state.companyModel.data?.map((e) {
                return DropdownMenuItem(
                    value: e.vehicleModelId, child: Text('${e.modelName}'));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedModelName = value;
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
