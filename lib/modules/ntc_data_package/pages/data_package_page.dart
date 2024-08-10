import 'package:flutter/material.dart';

import 'package:kodiary_test/constants/custom_sizedBox.dart';
import 'package:kodiary_test/modules/ntc_data_package/repo/repo.dart';

import '../../../common_widgets/common_button.dart';
import '../../../common_widgets/custom_drop_down.dart';
import '../models/data_package_model.dart';

class DataPackagePage extends StatefulWidget {
  const DataPackagePage({Key? key}) : super(key: key);

  @override
  State<DataPackagePage> createState() => _DataPackagePageState();
}

class _DataPackagePageState extends State<DataPackagePage> {
  String dropdownValue = '';
  String subPackageValue = '';
  String packageValue = '';

  //todo controller
  String selectedPackageDisplay = '';
  String selectedSubPackageDisplay = '';
  String selectedDataPackageDisplay = '';
  List<DataPackageModel> dataPackages = [];
  List<String> prepaidItems = [];
  List<String> subPackageItems = [];
  List<String> dataPackageItems = [];
  DataPackageModel? selectedPackages;

  @override
  void initState() {
    super.initState();
    fetchPrepaidData();
  }

  void fetchPrepaidData() async {
    final prepaidData = await RepoServices().getDataPackages();
    dataPackages = prepaidData;

    setState(() {
      prepaidItems = prepaidData.map((item) => item.title!).toList();

      dropdownValue = prepaidItems[0];
      updateSubPackages();
    });
  }

  void updateSubPackages() {
    final selectedPackage = dataPackages.firstWhere(
      (item) => item.title == dropdownValue,
    );
    selectedPackages = selectedPackage;
    setState(() {
      subPackageItems = selectedPackage.subpackages?.map((sp) => sp.title ?? '').toList() ?? [];
      subPackageValue = subPackageItems[0];
      updateDataPackages();
    });
  }

  void updateDataPackages() {
    final selectedSubPackage = selectedPackages?.subpackages?.firstWhere(
      (sp) => sp.title == subPackageValue,
    );
    setState(() {
      dataPackageItems = selectedSubPackage?.datapackages?.map((dp) => dp.title ?? '').toList() ?? [];
      print("Data package is $dataPackageItems");
      packageValue = dataPackageItems[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey,
          title: const Text("Data Packages"),
          centerTitle: true,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDropDown(
                dropdownValue: dropdownValue,
                items: prepaidItems.map((item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                headingText: "Choose package type",
                onChanged: (newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                    updateSubPackages();
                  });
                },
              ),
              sBoxH10,
              CustomDropDown(
                dropdownValue: subPackageValue,
                items: subPackageItems.map((item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                headingText: "Choose sub-package type",
                onChanged: (newValue) {
                  setState(() {
                    subPackageValue = newValue!;
                    updateDataPackages();
                  });
                },
              ),
              sBoxH10,
              CustomDropDown(
                dropdownValue: packageValue,
                items: dataPackageItems.map((item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                headingText: "Choose Data package",
                onChanged: (newValue) {
                  setState(() {
                    packageValue = newValue!;
                  });
                },
              ),
              sBoxH10,
              Center(
                child: CommonButton(
                  buttonText: "Submit",
                  onTap: () {
                    setState(() {
                      selectedPackageDisplay = dropdownValue;
                      selectedSubPackageDisplay = subPackageValue;
                      selectedDataPackageDisplay = packageValue;
                    });
                  },
                ),
              ),
              sBoxH10,
              Text("Selected Package Type: $selectedPackageDisplay"),
              sBoxH5,
              Text("Selected Sub-package Type: $selectedSubPackageDisplay"),
              sBoxH5,
              Text("Selected Data Package: $selectedDataPackageDisplay"),
            ],
          ),
        ),
      ),
    );
  }
}
