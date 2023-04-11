import 'package:flutter/material.dart';
class Calls extends StatefulWidget {
  const Calls({super.key});

  @override
  State<Calls> createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          shape: BoxShape.circle
                        ),
                        child: Icon(Icons.menu)),
                      SizedBox(width: 20,)
,                      Text('Calls',
                      style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
                   Row(
                    children: [
                      Container(padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          shape: BoxShape.circle
                        ),
                        child: Icon(Icons.call)),
                      SizedBox(width: 10,)
,                     Container(padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          shape: BoxShape.circle
                        ),
                        child: Icon(Icons.video_call)),
                    ],
                  ),
                
                ],
              ),
                Divider(
                    color: Colors.black,
                    height: 10,
                  ),
                  SizedBox(height: 50,),
                  Center(
                    child: Text('No Calls',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,color: Colors.grey,
                      fontSize: 20
                    ),),
                  ),
                  Center(
                    child: Text('Recent calls willl arive here.',
                    style: TextStyle(
                    color: Colors.grey,
                      fontSize: 16
                    ),),
                  ),
                  SizedBox(height: 10,),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue.shade400,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                        child: Text('START A CALL',
                        style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold),
                      ),
                    ),)
                  ),
                  SizedBox(height: 50,),
                  Text('Suggestions'
                  ,style: TextStyle(color: Colors.grey.shade400,
                  fontSize: 20),),
            ],
          ),
        ),
      ),
    );
  }
}