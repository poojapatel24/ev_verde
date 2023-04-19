import 'package:ev_verde/bloc/companylist_cubit.dart';
import 'package:ev_verde/bloc/states/companylist_state.dart';
import 'package:ev_verde/widgets/company_model_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/ev_verde_repo.dart';

class CompanyNameListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CompanyNameListWidget();
}

class _CompanyNameListWidget extends State<CompanyNameListWidget> {
  var selectedCompanyName;
  var isCompanySeleced = false;

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
                    if (kDebugMode) {
                      print(isCompanySeleced);
                    }
                    setState(() {
                      selectedCompanyName = value;
                      isCompanySeleced = true;
                    });
                    if (kDebugMode) {
                      print(selectedCompanyName);
                      print(isCompanySeleced);
                    }
                    //context.read<CompanyListCubit>().getCompanyModelList(vid: selectedCompanyName);
                    //BlocProvider.of<CompanyListCubit>(context).getCompanyModelList(vid: selectedCompanyName);
                  },
                ),
                if(isCompanySeleced)
                  CompanyModelListWidget(vid: selectedCompanyName)
                else
                  Container(
                    child: Text('Select Company Model'),
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
