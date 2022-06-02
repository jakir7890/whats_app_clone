

import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/colors.dart';
import 'package:whatsapp_ui_clone/widget/contacts_list.dart';

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3,
     child: Scaffold(
       appBar: AppBar(
         backgroundColor: appBarColor,
         title: const Text("Whatsapp", style: TextStyle(
           fontSize: 20,
           fontWeight: FontWeight.bold,
           color: Colors.grey

         ),),
         centerTitle: false,
         actions: [
           IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
           IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),

         ],
         // ignore: prefer_const_literals_to_create_immutables
         bottom: const TabBar(
           indicatorColor: tabColor,
           labelColor: tabColor,
           unselectedLabelColor: Colors.grey,
           labelStyle: TextStyle(
             fontWeight: FontWeight.bold
           ),
           tabs: [
           Tab(text: "CHATS",),
           Tab(text: "STATUS"),
           Tab(text: "CALLLS"),
         ]),
       ),
       body: const ContactList(),
     )
     );
    
  }
}