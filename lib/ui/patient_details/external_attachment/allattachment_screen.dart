import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



/// Here some set of images can be appeared
class Allattachment extends StatefulWidget {
  @override
  _AllattachmentState createState() => _AllattachmentState();
}

class _AllattachmentState extends State<Allattachment> {
  final List = ["image 100000000000000000000000", "image 200000000000", "image 30000000000", "image4000000000000", "image5000000","image600000000","image70000000000"];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView.builder(
          itemCount: List == null ? 0 : List.length,
          itemBuilder: (BuildContext context, int index) {
            return new InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   new MaterialPageRoute(
                //     builder: (context) {
                //       return new OtherClass(id[index], video[index]);
                //     },
                //   ),
                // );
              },
              child: Container(

                child: Card(
                  child: ListTile(
                    leading:   Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(padding: new EdgeInsets.all(3.0)),
                        Text(List[index],
                          style: new TextStyle(fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon:Icon(Icons.cloud_upload_rounded,size: 40),
                      onPressed: (){
                        //
                      },
                    ),

                  ),
                ),
                height: 75,
              ),
            );
          }),
    );
  }
}
