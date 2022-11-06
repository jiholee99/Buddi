
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kiosk/const.dart';

class ExitButtonWidget extends StatelessWidget {
  Function callback;
  ExitButtonWidget(this.callback);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: RawMaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero,side: BorderSide(width: 2, color: Colors.black)),
        fillColor: Colors.grey[400],
        onPressed: ()=>callback,
        child: Text("X", style: defaultTextStyle.copyWith(fontSize: 30,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
