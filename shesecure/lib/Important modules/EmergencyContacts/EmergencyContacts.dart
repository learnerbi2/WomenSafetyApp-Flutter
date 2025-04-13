
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shesecure/Important%20modules/EmergencyContacts/Contacts.dart';

class Emergencycontacts extends StatefulWidget {
  const Emergencycontacts({super.key});

  @override
  State<Emergencycontacts> createState() => _EmergencycontactsState();
}

class _EmergencycontactsState extends State<Emergencycontacts> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Trusted Contacts",
      style:TextStyle(color: Colors.white,
      fontWeight: FontWeight.bold,
      ),
     
      ),
      backgroundColor: Colors.purple ,
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child:Text("Add Contacts",)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=>contacts()
                 ));
              },
              backgroundColor: Colors.purple,child:Icon(Icons.add,color: Colors.white,),),
    );
  }
}