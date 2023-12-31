import 'package:chatapp_firebase/pages/home_page.dart';
import 'package:chatapp_firebase/service/auth_service.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';
import 'login_page.dart';



class ProfilePage extends StatefulWidget {
  String username;
  String email;
   ProfilePage({Key?key,required this.email,required this.username}):super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    AuthService authService=AuthService();
    return  Scaffold(
      
    appBar: AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      title:Text("Profile page",style: 
      TextStyle(color: Colors.white,fontSize: 27,fontWeight: FontWeight.bold),) ,
    ),
    drawer:Drawer(child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 50),
        children: <Widget>[
          Icon(Icons.account_circle,size: 150,color: Colors.grey[700],),

        const SizedBox(height: 15,),
        Text(widget.username,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold),),
        const SizedBox(height: 30,),
        const Divider(
          height: 2,
        ),
        ListTile(
          onTap: (){
            nextScreenReplace(context, const HomePage());
          },
          selectedColor: Theme.of(context).primaryColor,
          selected: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,vertical: 5
          ),
          leading:const Icon(Icons.group),
          title: const Text("Groups",style: TextStyle(color: Colors.black),),
        ),
        ListTile(
          onTap: (){
            nextScreen(context, const HomePage());
          },
          
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,vertical: 5
          ),
          leading:const Icon(Icons.person),
          title: const Text("Profile",style: TextStyle(color: Colors.black),),
        ),
        ListTile(
          onTap: () async{
            showDialog(
              barrierDismissible: false,
              context: context, builder:(context){
                return AlertDialog(
                  title:const  Text("Logout"),
                  content:const Text("Are you sure you want to logout"),
                  actions: [
                    IconButton(onPressed:(){
                      Navigator.pop(context);
                    }, icon:  const Icon(Icons.cancel,color: Colors.red,)),
                     IconButton(onPressed:() async{
                      await authService.signOut();
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginPage(),), (route) => false);
                    }, icon:  const Icon(Icons.done,color: Colors.green,))

                  ],
                );
            });
            authService.signOut().whenComplete((){
                nextScreenReplace(context, const LoginPage());
            });
          },
         
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,vertical: 5
          ),
          leading:const Icon(Icons.exit_to_app),
          title: const Text("Logout",style: TextStyle(color: Colors.black),),
        )
        ],
      ),),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 170),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.account_circle,size: 200,color: Colors.grey[700],),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Full Name",style: TextStyle(fontSize: 17),),
                 Text(widget.username,style: const TextStyle(fontSize: 17),),
                
              ],
            ),
           const Divider(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Email",style: TextStyle(fontSize: 17),),
                 Text(widget.email,style: const TextStyle(fontSize: 17),),
                
              ],
            ),

                      ],
        ),
      )
    );
  }
}