import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Sample'),
        leading:
        IconButton(onPressed: () {
         Get.back();
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: nameController,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Enter your name',
                    labelText: 'Name',
                  ),
                  validator: (value){
                    if (value!.isEmpty) {
                      return 'The name is not empty.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: phoneController,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.phone),
                    hintText: 'Enter a phone number',
                    labelText: 'Phone',
                  ),
                  validator: (value){
                    if (value!.isEmpty) {
                      return 'Please enter valid phone number';
                    }

                    if (value.contains(RegExp('[a-z]'))) {
                      return 'The phone is number';
                    }
                    // print(value.contains(RegExp("[0-9\s.-]{9,10}")));
                    // if (!value.contains(RegExp("[0-9\s.-]{9,10}"))) {
                    //   return 'The phone is then number required';
                    // }
                    return null;
                  },
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: dateController,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.calendar_today),
                    hintText: 'Enter your date of birth',
                    labelText: 'Dob',
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                    //alignment: Alignment.center,
                    child: ElevatedButton(
                      child: const Text('Submit'),
                      onPressed: (){
                        print(nameController.text);
                        print(phoneController.value);
                        print(dateController.value);
                      },
                    )),
              ],
            ),
          )
        ),
      ),
    );
  }
}
