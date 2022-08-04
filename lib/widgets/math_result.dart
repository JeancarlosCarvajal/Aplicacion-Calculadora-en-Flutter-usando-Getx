import 'package:d_calculadora/controllers/calculator_controller.dart';
import 'package:d_calculadora/widgets/line_separator.dart';
import 'package:d_calculadora/widgets/main_result.dart';
import 'package:d_calculadora/widgets/sub_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MathResults extends StatelessWidget {

  // busca una instancia del calculator controller agregado en la otra pagina
  final calculatorCtrl = Get.find<calculatorController>();

  MathResults({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx( // cada vez que algo cambie va redibujar esta parte el Getx
      () => Column(
        children: [

          SubResult( text: '${ calculatorCtrl.firstNumber }' ),
            
          SubResult( text: '${ calculatorCtrl.operation }' ),
            
          SubResult( text: '${ calculatorCtrl.secondNumber }' ),
            
          LineSeparator(),
            
          MainResultText( text: '${ calculatorCtrl.mathResult }' ),

        ],
      )
    );
  }
}