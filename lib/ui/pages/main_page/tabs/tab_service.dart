import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtc_xackaton/model/service_group.dart';
import 'package:mtc_xackaton/ui/pages/my_certificates_page/widgets/cerficate_tile.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

import '../../../../domain/app_cubit.dart';
import '../../../../model/certificate.dart';
import '../../../../model/service.dart';
/*
var map = <String, dynamic>{
  '1': {
    "_id": "oierhglihfjwdfd",
    "name": "PON PON USLUGA",
    "sub_services": [
      {
        "name": "BimBimBamBam",
        "cost": "150",
        "description": "OGO!",
        "image": "LINK"
      },
      {
        "name": "КОНЦЕРТ КИШЛАКА ТУТ",
        "cost": "300",
        "description": "OGO!",
        "image": "LINK"
      },
      {
        "name": "МАРКЕТОЛОГИ ТУТ",
        "cost": "500",
        "description": "ДА!!!",
        "image": "LINK"
      }
    ]
  },
  '2': {
    "_id": "oierhglihfjwdfd",
    "name": "PON PON USLUGA NOMER 2",
    "sub_services": [
      {
        "name": "BimBimBamBam 2",
        "cost": "150",
        "description": "OGO!",
        "image": "LINK"
      },
      {
        "name": "КОНЦЕРТ КИШЛАКА ТУТ 2",
        "cost": "300",
        "description": "OGO!",
        "image": "LINK"
      },
      {
        "name": "МАРКЕТОЛОГИ ТУТ 2",
        "cost": "500",
        "description": "ДА!!!",
        "image": "LINK"
      }
    ]
  },
  '3': {
    "_id": "oierhglihfjwdfd",
    "name": "PON PON USLUGA NOMER 3",
    "sub_services": [
      {
        "name": "BimBimBamBam 2",
        "cost": "150",
        "description": "OGO!",
        "image": "LINK"
      },
      {
        "name": "КОНЦЕРТ КИШЛАКА ТУТ 2",
        "cost": "300",
        "description": "OGO!",
        "image": "LINK"
      },
      {
        "name": "МАРКЕТОЛОГИ ТУТ 2",
        "cost": "500",
        "description": "ДА!!!",
        "image": "LINK"
      }
    ]
  },
  '4': {
    "_id": "oierhglihfjwdfd",
    "name": "PON PON USLUGA NOMER 4",
    "sub_services": [
      {
        "name": "BimBimBamBam 2",
        "cost": "150",
        "description": "OGO!",
        "image": "LINK"
      },
      {
        "name": "КОНЦЕРТ КИШЛАКА ТУТ 2",
        "cost": "300",
        "description": "OGO!",
        "image": "LINK"
      },
      {
        "name": "МАРКЕТОЛОГИ ТУТ 2",
        "cost": "500",
        "description": "ДА!!!",
        "image": "LINK"
      }
    ]
  },
  '5': {
    "_id": "oierhglihfjwdfd",
    "name": "PON PON USLUGA NOMER 5",
    "sub_services": [
      {
        "name": "BimBimBamBam 2",
        "cost": "150",
        "description": "OGO!",
        "image": "LINK"
      },
      {
        "name": "КОНЦЕРТ КИШЛАКА ТУТ 2",
        "cost": "300",
        "description": "OGO!",
        "image": "LINK"
      },
      {
        "name": "МАРКЕТОЛОГИ ТУТ 2",
        "cost": "500",
        "description": "ДА!!!",
        "image": "LINK"
      }
    ]
  },
  '6': {
    "_id": "oierhglihfjwdfd",
    "name": "PON PON USLUGA NOMER 6",
    "sub_services": [
      {
        "name": "BimBimBamBam 2",
        "cost": "150",
        "description": "OGO!",
        "image": "LINK"
      },
      {
        "name": "КОНЦЕРТ КИШЛАКА ТУТ 2",
        "cost": "300",
        "description": "OGO!",
        "image": "LINK"
      },
      {
        "name": "МАРКЕТОЛОГИ ТУТ 2",
        "cost": "500",
        "description": "ДА!!!",
        "image": "LINK"
      }
    ]
  },
  '7': {
    "_id": "oierhglihfjwdfd",
    "name": "PON PON USLUGA NOMER 7",
    "sub_services": [
      {
        "name": "BimBimBamBam 2",
        "cost": "150",
        "description": "OGO!",
        "image": "LINK"
      },
      {
        "name": "КОНЦЕРТ КИШЛАКА ТУТ 2",
        "cost": "300",
        "description": "OGO!",
        "image": "LINK"
      },
      {
        "name": "МАРКЕТОЛОГИ ТУТ 2",
        "cost": "500",
        "description": "ДА!!!",
        "image": "LINK"
      }
    ]
  },
  '8': {
    "_id": "oierhglihfjwdfd",
    "name": "PON PON USLUGA NOMER 8",
    "sub_services": [
      {
        "name": "BimBimBamBam 2",
        "cost": "150",
        "description": "OGO!",
        "image": "LINK"
      },
      {
        "name": "КОНЦЕРТ КИШЛАКА ТУТ 2",
        "cost": "300",
        "description": "OGO!",
        "image": "LINK"
      },
      {
        "name": "МАРКЕТОЛОГИ ТУТ 2",
        "cost": "500",
        "description": "ДА!!!",
        "image": "LINK"
      }
    ]
  },
};*/

class TabService extends StatefulWidget {
  const TabService({super.key});

  @override
  State<TabService> createState() => _TabServiceState();
}

class _TabServiceState extends State<TabService> {
  DropDownValueModel? selectedItem;
  late SingleValueDropDownController _cnt;

  @override
  void initState() {
    _cnt = SingleValueDropDownController();

    super.initState();
  }

  @override
  void dispose() {
    _cnt.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, s) {
        AppStateLoaded state = s as AppStateLoaded;

        if (selectedItem == null) {
          _cnt.dropDownValue = DropDownValueModel(
            name: state.services[0].name,
            value: state.services[0].services,
          );
          selectedItem = _cnt.dropDownValue;
        }

        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.grey,
                      ),
                      child: DropDownTextField(
                        textStyle: const TextStyle(),
                        textFieldDecoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        controller: _cnt,
                        clearOption: false,

                        // enableSearch: true,
                        // dropdownColor: Colors.green,
                        dropDownItemCount: 6,

                        dropDownList: [
                          for (ServiceGroup sg in state.services)
                            DropDownValueModel(
                              name: sg.name,
                              value: sg.services,
                            )
                        ],
                        onChanged: (val) {
                          onChangedDropDown(val);
                        },
                      ),
                    ),
                  ),
                  for (Service service in selectedItem!.value)
                    CertificateTile(
                      cost: service.cost,
                      title: service.name,
                      isShare: false,
                      image: 'https://i.imgur.com/0WCT0md.png',
                      onTap: () {},
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void onChangedDropDown(DropDownValueModel item) {
    setState(() {
      selectedItem = item;
      // list = listBuilder(item.value);
      // print(list);
    });
  }

  List<CertificateService> listBuilder(dynamic services) {
    List<CertificateService> listOfServices = [];
    for (dynamic it in services) {
      listOfServices.add(CertificateService(
          cost: int.parse(it['cost']),
          groupId: 'fdsfsfwf',
          serviceId: it['name']));
    }
    return listOfServices;
  }
}
