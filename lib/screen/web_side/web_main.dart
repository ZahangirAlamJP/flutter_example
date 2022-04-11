import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_example/screen/web_side/addproducts_screen.dart';
import 'package:flutter_example/screen/web_side/deleteProducts_screen.dart';
import 'package:flutter_example/screen/web_side/updateProducts_screen.dart';

import 'deshboard_screen.dart';

class WebMainScreen extends StatefulWidget {
  //const WebMainScreen({ Key? key }) : super(key: key);
  static const String id = "webmain";

  @override
  State<WebMainScreen> createState() => _WebMainScreenState();
}

class _WebMainScreenState extends State<WebMainScreen> {
  Widget selectedScreen =const  DashBoardScreen();

chooseScreens(item) {
    switch (item.route) {
      case DashBoardScreen.id:
        setState(() {
          selectedScreen = DashBoardScreen();
        });
        break;
      case AddProductScreen.id:
        setState(() {
          selectedScreen = AddProductScreen();
        });
        break;
      case UpdateProductScreen.id:
        setState(() {
          selectedScreen = UpdateProductScreen();
        });
        break;
      case DeleteProductScreen.id:
        setState(() {
          selectedScreen = DeleteProductScreen();
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("ADMIN"),
        ),
        sideBar: SideBar(
            backgroundColor: Colors.black,
            textStyle: const TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
            onSelected: (item) {
              chooseScreens(item);
            },


               items: const [
              MenuItem(
                title: "DASHBOARD",
                icon: Icons.dashboard,
                route: DashBoardScreen.id,
              ),
              MenuItem(
                title: "ADD PRODUCTS",
                icon: Icons.add,
                route: AddProductScreen.id,
              ),
              MenuItem(
                title: "UPDATE PRODUCTS",
                icon: Icons.update,
                route: UpdateProductScreen.id,
              ),
              MenuItem(
                title: "DELETE PRODUCTS",
                icon: Icons.delete,
                route: DeleteProductScreen.id,
              ),
              MenuItem(
                title: "CART ITEMS",
                icon: Icons.shop,
              ),
            ],
        selectedRoute: WebMainScreen.id),
      body: selectedScreen,
      );
  }
}