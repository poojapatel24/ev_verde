import 'package:ev_verde/bloc/companylist_cubit.dart';
import 'package:ev_verde/bloc/states/companylist_state.dart';
import 'package:ev_verde/widgets/company_model_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/ev_verde_repo.dart';
import '../utils/preference_utils.dart';
final key = new GlobalKey<CompanyNameListStateWidget>();
class CompanyNameListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CompanyNameListStateWidget();
}

class CompanyNameListStateWidget extends State<CompanyNameListWidget> {
  var selectedCompanyName;
  var isCompanySelected = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompanyListCubit(EvVerdeRepo()),
      child: BlocConsumer<CompanyListCubit, CompanyListState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CompanyListLoaded) {
            return Column(
              children: [
                DropdownButtonFormField(
                  value: selectedCompanyName,
                  hint: const Text('Select Company Name'),
                  items: state.companyNameList.data?.map((e) {
                    return DropdownMenuItem(
                        value: e.vehicleCompanyId,
                        child: Text('${e.vehicleCompanyName}'));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCompanyName = value;
                      isCompanySelected = true;
                      PreferenceUtils.setString('companyname', selectedCompanyName.toString());
                    });
                    if (kDebugMode) {
                      print(selectedCompanyName);
                      print(isCompanySelected);
                    }
                  },
                ),
                if(isCompanySelected)
                  CompanyModelListWidget(vid: selectedCompanyName)
                else
                  DropdownButtonFormField(
                    hint: const Text('Select Model Name'),
                    items: const [],
                    onChanged: (value) {  },
                  ),
              ],
            );
          }
          return Container();
        },

      ),
    );
  }



}
