import 'package:flutter/material.dart';
import 'package:mtc_xackaton/ui/pages/my_certificates_page/widgets/cerficate_tile.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

import '../../../../model/certificate.dart';

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
};

class TabService extends StatefulWidget {
  const TabService({Key? key}) : super(key: key);

  @override
  State<TabService> createState() => _TabServiceState();
}

class _TabServiceState extends State<TabService> {
  List<String> listser = ['fsdfdfsfd', 'fdsfsdfee', '4324324233432'];
  String? selectedItem;
  List<CertificateService> list = [];
  late SingleValueDropDownController _cnt;

  @override
  void initState() {
    _cnt = SingleValueDropDownController();
    _cnt.dropDownValue = DropDownValueModel(
        name: map['1']['name'], value: map['1']['sub_services']);
    list = listBuilder(map['1']['sub_services']);
    super.initState();
  }

  @override
  void dispose() {
    _cnt.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
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
                    textStyle: TextStyle(),
                    textFieldDecoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    controller: _cnt,
                    clearOption: false,

                    // enableSearch: true,
                    // dropdownColor: Colors.green,
                    dropDownItemCount: 6,

                    dropDownList: [
                      for (final it in map.values)
                        DropDownValueModel(
                          name: it['name'],
                          value: it['sub_services'],
                        )
                    ],
                    onChanged: (val) {
                      onChangedDropDown(val);
                    },
                  ),
                ),
              ),
              for (dynamic it in list)
                CertificateTile(
                  cost: it.cost,
                  title: it.serviceId,
                  isShare: false,
                  image: 'https://i.imgur.com/0WCT0md.png',
                  onTap: () {},
                ),
            ],
          ),
        ),
      ],
    );
  }

  void onChangedDropDown(DropDownValueModel item) {
    setState(() {
      selectedItem = item.name;
      list = listBuilder(item.value);
      print(list);
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
