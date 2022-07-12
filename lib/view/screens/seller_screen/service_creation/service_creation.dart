import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:freelance_fx_seller/firebase/database.dart';
import 'package:freelance_fx_seller/model/service_model.dart';
import 'package:freelance_fx_seller/view/constants/colors.dart';
import 'package:freelance_fx_seller/view/constants/size.dart';
import 'package:freelance_fx_seller/view/screens/seller_screen/bottom_navigation_seller/bottom_navigation_seller.dart';
import 'package:freelance_fx_seller/view/utilities/toast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceCreation extends StatelessWidget {
  ServiceCreation({Key? key}) : super(key: key);
  ServiceModel? data;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController domainController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  FilePickerResult? image;

  @override
  Widget build(BuildContext context) {
    if (data != null) {
      titleController.text = data!.title;
      descriptionController.text = data!.description;
      priceController.text = data!.price.toString();
      domainController.text = data!.domain;
    }
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kbackgroundpage,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Service Creation',
          style: GoogleFonts.roboto(color: kblack),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formkey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 90,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: kVoliet.withOpacity(0.3)),
                  child: Image.network(
                      "https://www.gstatic.com/mobilesdk/160503_mobilesdk/logo/2x/firebase_28dp.png"),
                ),
                kheight20,
                SizedBox(
                  width: size.width * 0.3,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () async {
                        image = await FilePicker.platform.pickFiles(
                            allowMultiple: false, type: FileType.any);
                        if (image == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('No file selected')));
                        }
                        
                      },
                      child: (data == null)
                          ? const Text('Add Image')
                          : const Text('Edit Image')),
                ),
                kheight20,
                TextFormField(
                  keyboardType: TextInputType.name,
                  style: const TextStyle(
                    color: Color.fromARGB(193, 85, 81, 81),
                  ),
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(90, 126, 123, 135), width: 0.7),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(90, 126, 123, 135),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    labelText: "Service",
                    labelStyle: TextStyle(color: klabeltext),
                  ),
                  controller: titleController,
                  validator: (value) {
                    if (RegExp(
                            "^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*")
                        .hasMatch(value!)) {
                      return null;
                    } else {
                      return "Please provide a valid service name";
                    }
                  },
                ),
                kheight20,
                TextFormField(
                  maxLines: 8,
                  keyboardType: TextInputType.multiline,
                  style: const TextStyle(
                    color: Color.fromARGB(193, 85, 81, 81),
                  ),
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(90, 126, 123, 135), width: 0.7),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(90, 126, 123, 135),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    labelText: "Description",
                    labelStyle: TextStyle(color: klabeltext),
                  ),
                  controller: descriptionController,
                  validator: (value) {
                    if (RegExp(
                            "^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*")
                        .hasMatch(value!)) {
                      return null;
                    } else {
                      return "Please provide a valid description of service";
                    }
                  },
                ),
                kheight20,
                TextFormField(
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    color: Color.fromARGB(193, 85, 81, 81),
                  ),
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(90, 126, 123, 135), width: 0.7),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(90, 126, 123, 135),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    labelText: "Price",
                    labelStyle: TextStyle(color: klabeltext),
                  ),
                  controller: priceController,
                  validator: (value) {
                    if (RegExp(
                            "^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*")
                        .hasMatch(value!)) {
                      return null;
                    } else {
                      return "Please provide a valid Price";
                    }
                  },
                ),
                kheight20,
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  style: const TextStyle(
                    color: Color.fromARGB(193, 85, 81, 81),
                  ),
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(90, 126, 123, 135), width: 0.7),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(90, 126, 123, 135),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    labelText: "Domain eg: App Development,Static website",
                    labelStyle: TextStyle(color: klabeltext),
                  ),
                  controller: domainController,
                  validator: (value) {
                    if (RegExp(
                            "^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*")
                        .hasMatch(value!)) {
                      return null;
                    } else {
                      return "Please provide a valid domain";
                    }
                  },
                ),
                kheight20,
                kheight20,
                ElevatedButton(
                  onPressed: () {
                    //if (formkey.currentState!.validate()) {
                    //if (data == null) {
                    addtoServiceModel(context);
                    //}
                    //  else {
                    //   updateServiceModel(context);
                    // }
                    // }
                  },
                  child: Text(
                    'Save',
                    style: GoogleFonts.roboto(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kgreenlight),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addtoServiceModel(BuildContext context) async {
    final title = titleController.text.trim();
    final description = descriptionController.text.trim();
    final price = priceController.text.trim();
    final domain = domainController.text.trim();

    final service = ServiceModel(
      title: title,
      description: description,
      price: double.parse(price),
      domain: domain,
    );
    toast(context, 'Adding Service Please wait');
    await addProduct(service, image!)
        .whenComplete(() => Get.off(BottomNavigationSeller()));
  }

  void updateServiceModel(BuildContext context) {}
}
