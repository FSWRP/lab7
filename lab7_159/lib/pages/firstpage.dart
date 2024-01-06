import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<String> gender = ["ชาย", "หญิง", "LGBT+"];

  List<ListItem> prefix = [
    ListItem("boy", "เด็กชาย"),
    ListItem("girl", "เด็กหญิง"),
    ListItem("Mr.", "นาย"),
    ListItem("Miss", "นางสาว"),
    ListItem("Mrs.", "นาง"),
  ];
  List<DropdownMenuItem<ListItem>> _dropdownMenuItems = [];
  ListItem? _selectedPrefix;

  String _selectedItem = "ชาย";

  List<DropdownMenuItem<ListItem>> buildDropdownMenuItem(
      List<ListItem> prefix) {
    List<DropdownMenuItem<ListItem>> items = [];
    for (ListItem pf in prefix) {
      items.add(DropdownMenuItem(
        value: pf,
        child: Text(pf.name),
      ));
    }
    return items;
  }

  @override
  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropdownMenuItem(prefix);
    _selectedPrefix = _dropdownMenuItems[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("lab7 Dropdown"),
      ),
      body: Column(
        children: [
          Text("เลือกเพศ"),
          DropdownButton(
            value: _selectedItem,
            items: gender.map((item) {
              return DropdownMenuItem(
                child: Text(item),
                value: item,
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedItem = value!;
              });
            },
          ),
          Divider(),
          Text("คำนำหน้า"),
          DropdownButton(
            value: _selectedPrefix,
            items: _dropdownMenuItems,
            onChanged: (value) {
              setState(() {
                _selectedPrefix = value;
              });
            },
          )
        ],
      ),
    );
  }
}

class ListItem {
  String value;
  String name;
  ListItem(this.value, this.name);
}
