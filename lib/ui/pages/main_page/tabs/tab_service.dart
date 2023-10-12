import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mtc_xackaton/model/certificate.dart';
import 'package:mtc_xackaton/model/service_group.dart';
import 'package:mtc_xackaton/ui/navigation/navigation_manager.dart';
import 'package:mtc_xackaton/ui/pages/my_certificates_page/widgets/cerficate_tile.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

import '../../../../domain/app_cubit.dart';

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
    super.initState();
    
    _cnt = SingleValueDropDownController();
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
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFFD9D9D9)),
                      color: const Color(0xFFF7F7F7),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropDownTextField(
                      textFieldDecoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      textStyle: const TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.1,
                        height: 16 / 13,
                      ),
                      listTextStyle: const TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        height: 1,

                      ),
                      controller: _cnt,
                      clearOption: false,
                      dropDownItemCount: state.services.length,
                      dropDownList: [
                        for (ServiceGroup sg in state.services)
                          DropDownValueModel(
                            name: sg.name,
                            value: sg.services,
                          )
                      ],
                      onChanged: (val) {
                        setState(() {
                          selectedItem = val;
                        });
                      },
                    ),
                  ),
                  for (CertificateService cert in selectedItem!.value)
                    CertificateTile(
                      cost: cert.cost,
                      title: cert.name,
                      isShare: false,
                      image: cert.imageLink,
                      onTap: () {
                        GetIt.I.get<NavMan>().openCertificateInfoPage(cert);
                      },
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
