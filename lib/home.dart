import 'package:flutter/material.dart';
import 'package:flutter_app/member.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool _isLocked = false;
  var _icon = Icons.lock;
  var _text = 'กรุณาเข้าสู่ระบบ';
  //1.callbacl funtion
  bool getIsLocked() => _isLocked;
  //2.callbacl funtion
  void updateStatus(value){
    setState(() {
      if(!value){
        _icon = Icons.lock;
        _text = 'กรุณาเข้าสู่ระบบ';
      }
      else{
        _icon = Icons.lock_open;
        _text = 'ท่านได้เข้าสู่ระบบแล้ว';
      }

      _isLocked = value;
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('หน้าหลัก'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30,),
            Icon(_icon,size: 64),
            Text(_text),
            const SizedBox(height: 60,),
            ElevatedButton(
            style:ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
              ) ,
            onPressed: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (contex)=> MemberPage(
                    updateStatus: updateStatus,
                    getIsLocked: getIsLocked,
                    )
                  )
                );
            }, 
            child: const Text(' Member ')
            ),
          ],
        ),
      ),
    );
  }
}