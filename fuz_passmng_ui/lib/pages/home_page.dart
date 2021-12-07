import 'package:flutter/material.dart';
import 'package:fuz_passmng_ui/ffi/phrase_to_serial.dart';
import 'package:fuz_passmng_ui/pages/item_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> data = getBwData();
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(child: InkWell(
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ItemPage(data[index]))),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Center(child: Text(data[index]['name'], style: TextStyle(fontSize: 20),)),

            ),
          ),

          );
        });
  }
}
