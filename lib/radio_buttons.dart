import 'package:flutter/material.dart';

class RadioButtons extends StatefulWidget {
  const RadioButtons({super.key});

  @override
  State<RadioButtons> createState() => _RadioButtonsState();
}

class _RadioButtonsState extends State<RadioButtons> {
  String selectedoption = 'Student'; // selected radio option
  var email = TextEditingController(); // to get input text
  final FocusNode focusNode = FocusNode(); // track focus of TextField

  //for check box
  bool remeberMe = false;

  @override
  void initState() {
    super.initState();

    // Listen to focus change and rebuild UI
    focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    focusNode.dispose(); // cleanup
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100),

          // --- Radio Buttons ---
          Row(
            children: [
              Radio<String>(
                groupValue: selectedoption,
                value: 'Student',
                onChanged: (value) {
                  setState(() {
                    selectedoption = value!;
                  });
                },
              ),
              Text('Student'),
              SizedBox(width: 30),
              Radio<String>(
                groupValue: selectedoption,
                value: "Teacher",
                activeColor: Colors.green,
                onChanged: (value) {
                  setState(() {
                    selectedoption = value!;
                  });
                },
              ),
              Text('Teacher'),
            ],
          ),

          SizedBox(height: 20),

          // --- TextField with focus color change ---
          TextField(
            controller: email,
            focusNode: focusNode,
            decoration: InputDecoration(
              labelText: 'Enter your name *',
              labelStyle: TextStyle(color: Colors.black, fontSize: 16),
              filled: true,
              fillColor: focusNode.hasFocus ? Colors.white : Colors.grey[300],
              border: InputBorder.none,
            ),
          ),

          // Check Box
          SizedBox(height: 20),
          Row(
            children: [
              Checkbox(
                value: remeberMe,
                onChanged: (value) {
                  setState(() {
                    remeberMe = value == true;
                  });
                },
              ),
              Text('Remmber Me'),
            ],
          ),
        ],
      ),
    );
  }
}
