import 'dart:html';
import 'dart:io';
import 'dart:isolate';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/model/productsModel.dart';
import 'package:flutter_example/screen/home_screen.dart';
import 'package:flutter_example/utils/styles.dart';
import 'package:flutter_example/widgets/ecoTextField.dart';
import 'package:flutter_example/widgets/eco_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:uuid/uuid.dart';




class AddProductScreen extends StatefulWidget {
//  const AddProductScreen({ Key? key }) : super(key: key);
static const String id = "addproduct";


  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController categoryC = TextEditingController();
  TextEditingController idC = TextEditingController();
  TextEditingController productNameC = TextEditingController();
  TextEditingController detailC = TextEditingController();
  TextEditingController priceC = TextEditingController();
  TextEditingController discountPriceC = TextEditingController();
  TextEditingController serialCodeC = TextEditingController();
  // TextEditingController brandC = TextEditingController();

  bool isOnSale = false;
  bool isPopular = false;
  bool isFavourite = false;


String? selctedValue;
bool isSaving = false;
bool isUploading = false;


final imagePicker = ImagePicker();
List<XFile> images = [];
List<String> imageUrls = [];
 var uuid = Uuid();

  @override
  Widget build(BuildContext context) {
   
    return SingleChildScrollView(
      child: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              children: [
               const Text("ADD PRODUCT",
                style: EcoStyle.boldStyle,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 7),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10)),
                  child: DropdownButtonFormField(
                    hint: const Text("Choose Category"),
                    decoration:const  InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                    ),
                    validator: (value) {
                      if (value == null) {
                        return "category must be selected";
                      }
                      return null;
                    },
                    value: selctedValue,
                    
                    items: categories
                  .map((e) => DropdownMenuItem<String>(
                    value: e,
                    child: Text(e.toString())))
                  
                  .toList(), 
    
                  onChanged: (value) {
                    setState(() {
                      selctedValue = value.toString();
                    });
                  }),
                ),
                EcoButton(
                  title: "PICK IMAGES",
                  onPress:  () {
                    pickImage();
                  },
                  isLoginButton: true,
                ),
                // EcoButton(
                //   title: "UPLOAD IMAGES",
                //   isLoading: isUploading,
                //   onPress:  () {
                //    uploadImages();
                //   },
                //   isLoginButton: true,
                // ),
               
                Container(
                  height: 45.h,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20)
    
                  ),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 10), 
                      itemCount: images.length,
                  itemBuilder: (BuildContext context, int index) {
                 return Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Stack(
                     children: [
                       Container(
                         height: 45.h,
                         decoration: BoxDecoration(
                           border: Border.all(color: Colors.black),),
                         child: Image.network(
                           XFile(images[index].path).path,
                         height: 200,width: 200,fit: BoxFit.cover,),
                       ),
                       IconButton(onPressed: () {
                        setState(() {
                           images.removeAt(index);
                        });
                       }, icon: const Icon(Icons.cancel_outlined)),
                     ],
                   ),
                 );
                  },
                  ),
                ),
     EcoTextField(controller: productNameC,
     hintText: "enter product name ...",
     validate: (v) {
       if (v!.isEmpty) {
         return "should not be empty";
       } return null;
     },),
EcoTextField(controller: detailC,
     hintText: "enter product detail...",
     validate: (v) {
       if (v!.isEmpty) {
         return "should not be empty";
       } return null;
     },),

     EcoTextField(controller: priceC,
     hintText: "enter product price ...",
     validate: (v) {
       if (v!.isEmpty) {
         return "should not be empty";
       } return null;
     },),
     
     EcoTextField(controller: discountPriceC,
     hintText: "enter product discount price ...",
     validate: (v) {
       if (v!.isEmpty) {
         return "should not be empty";
       } return null;
     },),
     EcoTextField(controller: serialCodeC,
     hintText: "enter product serial code ...",
     validate: (v) {
       if (v!.isEmpty) {
         return "should not be empty";
       } return null;
     },),
     SwitchListTile(
       value: isOnSale, 
       title: Text("Is this Product on Sale?"),
       onChanged: (v) {
         setState(() {
           isOnSale = !isOnSale;
         });
       }
       ),
         SwitchListTile(
       value: isPopular, 
       title: Text("Is this Product on Popular?"),
       onChanged: (v) {
         setState(() {
           isPopular = !isPopular;
         });
       }
       ),
   
                EcoButton(
                  title: "SAVE",
                  isLoginButton: true,
                  onPress: () {
                    save();
                  },
                  isLoading: isSaving,
                ),
                ]
               ,
            ),
          ),
        ),
      ),
   
    );
  }

  /*
save() async {
    setState(() {
      isSaving = true;
    });
    await uploadImages();
    // error ///////////////////
    await Products.addProducts(Products(
            Category: selectedValue,
            //id: uuid.v4(),
  */
  save() async {
    setState(() {
      isSaving = true;
    });
    await uploadImages();
    await Products.addProducts(Products(
      id: uuid.v4(), 
      productName: productNameC.text, 
      detail: detailC.text, 
      category: selctedValue, 
      price: int.parse(priceC.text), 
      discountPrice: int.parse(discountPriceC.text), 
      serialCode: serialCodeC.text, 
      imageUrls: imageUrls, 
      isOnsale: isOnSale, 
      isPopular: isPopular, 
      isFavourite: isFavourite)).whenComplete(() {
        setState(() {
           setState(() {
      isSaving = false;
      ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text("ADDED SUCCESSFULLY")));
      //ScaffoldMessenger.of(context).showSnackBar(snackBar(context : Text("f;ldjf")));
    // ScaffoldMessengerState.of(context).showSnackBar(snackBar(context: Text("ADDDD")));
    });
        });
      });
  //  await FirebaseFirestore.instance.collection('products').add({"images" : imageUrls}).whenComplete(() {
  //     setState(() {
  //       isSaving = false;
  //       images.clear();
  //       imageUrls.clear();
  //     });
   // });
  }



  pickImage() async {
    final List<XFile>? pickImage = await imagePicker.pickMultiImage();
    if (pickImage != null) {
      setState(() {
        images.addAll(pickImage);
      });
    } else {
      print("no images selected");
    }
  }
 Future postImages(XFile? imageFile) async {
    setState(() {
      isUploading = true;
    });
    String? urls;
    Reference ref =
        FirebaseStorage.instance.ref().child("images").child(imageFile!.name);
    if (kIsWeb) {
      await ref.putData(
        await imageFile.readAsBytes(),
        SettableMetadata(contentType: "image/jpeg"),
      );
      urls = await ref.getDownloadURL();
      setState(() {
           isUploading = false;
      });
      return urls;
    }
  }
uploadImages() async {
    for (var image in images) {
      await postImages(image).then((downLoadUrl) => imageUrls.add(downLoadUrl));
    }
  }


}