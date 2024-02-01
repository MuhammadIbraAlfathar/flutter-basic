// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  bool isOn = false;

  var selected = "Flutter";
  final dropdownList = <String>['Flutter', 'Dart', 'Java', 'Scala', 'Python'];

  var gender = "male";
  var isChecked = false;
  TextEditingController textController = TextEditingController(text: 'Sabrina');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter - Form"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                maxLength: 20,
                controller: textController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                  helperText: "What's your name?",
                ),
                onChanged: (value) {},
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("Your favorite Languange"),
                  const SizedBox(
                    width: 8,
                  ),
                  DropdownButton(
                    value: selected,
                    icon: const Icon(Icons.arrow_downward),
                    style: TextStyle(color: Colors.blue[600]),
                    underline: Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: Colors.grey,
                        width: 3,
                      ))),
                    ),
                    items: dropdownList
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (String? val) {
                      setState(() {
                        if (val != null) {
                          selected = val;
                        }
                      });
                    },
                  ),
                ],
              ),
              LayoutBuilder(builder: (context, constraint) {
                // ignore: unused_local_variable
                List<String> itemStringList = ["Female", "Male"];

                return FormField(
                  initialValue: false,
                  enabled: true,
                  builder: (FormFieldState<bool> field) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        labelText: "Gender",
                        errorText: field.errorText,
                        helperText: "Your gender",
                      ),
                      child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: "Female",
                          icon: Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Icon(
                              Icons.arrow_drop_down_outlined,
                              size: 24.0,
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          ),
                          iconSize: 16,
                          elevation: 16,
                          style: TextStyle(
                            fontSize:
                                Theme.of(context).textTheme.bodyText2!.fontSize,
                            fontFamily: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .fontFamily,
                            color: Theme.of(context).textTheme.bodyText2!.color,
                          ),
                          underline: Container(
                            height: 0,
                            color: Colors.grey[300],
                          ),
                          onChanged: (String? newValue) {},
                          items: itemStringList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  value,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      )),
                    );
                  },
                );
              }),
              Row(
                children: [
                  const Text('Connect Instagram'),
                  const SizedBox(
                    width: 8,
                  ),
                  Switch(
                    value: isOn,
                    onChanged: (bool? val) {
                      if (val != null) {
                        setState(() {
                          isOn = val;
                        });
                      }
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  const Text("Gender :"),
                  const SizedBox(
                    width: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                        value: "male",
                        groupValue: gender,
                        onChanged: (String? val) {
                          setState(() {
                            if (val != null) {
                              gender = val;
                            }
                          });
                        },
                      ),
                      const Text("Male")
                    ],
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                        value: "Female",
                        groupValue: gender,
                        onChanged: (String? val) {
                          setState(() {
                            if (val != null) {
                              gender = val;
                            }
                          });
                        },
                      ),
                      const Text("Female")
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (val) {
                      setState(() {
                        if (val != null) {
                          isChecked = val;
                        }
                      });
                    },
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const Text(
                    "Agree Term & Condition",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  debugPrint("pickedDate: $pickedDate");
                },
                child: TextFormField(
                  maxLength: 20,
                  enabled: false,
                  decoration: const InputDecoration(
                    labelText: 'Birth date',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                    suffixIcon: Icon(Icons.date_range),
                    helperText: "What's your birth date?",
                  ),
                  onChanged: ((value) {}),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
