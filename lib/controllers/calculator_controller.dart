
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class calculatorController extends GetxController {

  var firstNumber  = '10'.obs;
  var secondNumber = '20'.obs;
  var mathResult   = '30'.obs;
  var operation    = '+'.obs;

  void resetAll(){
    // this.firstNumber  = '10'.obs; // una forma
    // this.firstNumber.value  = '10'; // otra forma
    // this.firstNumber.update((val) { }); // otra forma
    firstNumber.value  = '0';
    secondNumber.value = '0';
    mathResult.value   = '0';
    operation.value    = '+';
  } 

  void changeNegativePositive() {
    mathResult.startsWith('-') 
    ? mathResult.value = mathResult.value.replaceFirst('-', '')
    : mathResult.value = '-${mathResult.value}';
  }

  addNumber(String number) {
    if(mathResult.value == '0') {
      return mathResult.value = number;
    }
    
    // numeros negativos, evita que el valor mostrado quede en -0585 y quede -585
    if(mathResult.value == '-0'){
      return mathResult.value = '-$number';
    }

    // el + indica que se concatenan los strings para mostrar los numeros escritos en pantalla
    mathResult.value = mathResult.value + number;

  }

  void addDecimalPoint() {
    if(mathResult.contains('.')) return;

    mathResult.startsWith('0')
      ?mathResult.value = '0.'
      :mathResult.value = '${mathResult.value}.';

  }

  // permite colocar el operador aritmetico en la casilla y setear el valor escrito arriba
  selectOperation(String newOperation){
    operation.value = newOperation;
    firstNumber.value = mathResult.value;
    // ahora la persona ve empezar escribir otra operacion por tanto debe setear mathreult en cero
    mathResult.value = '0';
  }

  // boton delete. es para borrar el ultimo numero escrito
  void deleteLastEntry() { 
    if(mathResult.value.replaceAll('-', '').length  > 1){
      mathResult.value = mathResult.value.substring(0, mathResult.value.length - 1);
    }else{
      mathResult.value = '0';
    }
  }

  // calcular resultado
  void calculateResult() {
    double num1 = double.parse(firstNumber.value);
    double num2 = double.parse(mathResult.value);

    // asignamos el valor a la casilla debajo del operador aritmetico
    secondNumber.value = mathResult.value;

    switch(operation.value){ 
      case '+':
        mathResult.value = '${num1+num2}';
        break;
      case '-':
        mathResult.value = '${num1-num2}';
        break;
      case '/':
        mathResult.value = '${num1/num2}';
        break;
      case 'X':
        mathResult.value = '${num1*num2}';
        break;
      default:
        return; 
    }

    if(mathResult.value.endsWith('.0')){
      mathResult.value = mathResult.value.substring(0, mathResult.value.length-2);
    }

  }
  

}