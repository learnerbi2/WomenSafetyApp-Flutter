import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class contacts extends StatefulWidget {
  const contacts({super.key});

  @override
  State<contacts> createState() => _contactsState();
}

class _contactsState extends State<contacts> {

  void initState(){
  super.initState();
  askPermissions();
}


 //Extracting contacts
 List<Contact> contacts = [];
 getAllContacts() async{
 List<Contact> _contacts = await ContactsService.getContacts(withThumbnails: false);
 setState(() {
   contacts = _contacts;
 });
 }


  //permissions
  Future<void> askPermissions()async{
    PermissionStatus permissionStatus = await getContactPermissions();  
    if(permissionStatus==PermissionStatus.denied){
      getAllContacts();
    }
    else if(permissionStatus==PermissionStatus.permanentlyDenied){
      handleInvalidPermissions(permissionStatus);
    }

    }
  handleInvalidPermissions(PermissionStatus permissionStatus){
    if(permissionStatus==PermissionStatus.denied){
      //dialog
    }
    else if(permissionStatus==PermissionStatus.permanentlyDenied){
      //dialog
    }
  }


  Future<PermissionStatus> getContactPermissions() async {
  PermissionStatus permission = await Permission.contacts.status;
  if(permission != PermissionStatus.granted && 
    permission != PermissionStatus.permanentlyDenied
    ){
      PermissionStatus permissionStatus = await Permission.contacts.request();
      return permissionStatus;
    }else{
      return permission;
    }
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: contacts.isEmpty ? Center(child:CircularProgressIndicator()) : ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (
          BuildContext context, int index){
            Contact contact = contacts[index];
           return ListTile(
            title: Text(contact.displayName!),
            //subtitle: Text(contacts.phones!.elementAt(0).value!),
            leading:contact.avatar!=null && contact.avatar!.isNotEmpty ? CircleAvatar(
             backgroundImage: MemoryImage(contact.avatar!),
            ):CircleAvatar(
              child:Text(contact.initials()),
            )
           );
          }
          ),
    );
  }
}