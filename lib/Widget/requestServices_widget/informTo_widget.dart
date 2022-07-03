import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InformToDropDownList extends StatelessWidget {
  List? selectedFilter = List.empty(growable: true);
//  Map<dynamic,dynamic> employeeList={"1":"durra","2":"randa",};
  List employeeList = <String>['durra', 'hassan'];

  InformToDropDownList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  color: const Color(0xff73BDEE).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(5)),
              //  decoration: Style().boxDecoration(),
              width: double.infinity,

              // padding: EdgeInsets.only(left: 15, top: 5),
              child: Wrap(
                alignment: WrapAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: FittedBox(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton<String>(
                                isExpanded: true,
                                icon: const Icon(Icons.arrow_drop_down),
                                style: const TextStyle(
                                  color: Color(0xff555555),
                                  fontSize: 23,
                                ),
                                hint: const Text(
                                  'Inform to',
                                  style: TextStyle(fontSize: 17),
                                ),
                                onChanged: (newValue) {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  employeeList = employeeList.first(newValue);
                                },
                                items: <String>['Salary', 'B', 'C', 'D']
                                    .map((item) {
                                  return DropdownMenuItem(
                                    child: Text(
                                      item,
                                    ),
                                    value: item,
                                  );
                                }).toList()),
                          ),
                        ),
                      ),
                    ),
                  ),
                  employeeList.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(14),
                          child: Chip(
                            labelPadding: const EdgeInsets.all(4.0),
                            backgroundColor: Colors.blue,
                            label: const Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Text(
                                "Mohamed ahmed",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            onDeleted: () {},
                            deleteIcon: InkWell(
                              onTap: () {
                                selectedFilter!.removeWhere(
                                    (item) => item == employeeList);
                              },
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            ),
                          ))
                      : Container(
                          width: 10,
                        ),
                ],
              )),
        ],
      ),
    );
  }
}
