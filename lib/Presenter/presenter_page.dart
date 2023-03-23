import 'package:flutter/material.dart';

// Presenter (Model-View-Presenter pattern)
class Presenter{
  //Vars
  late String picture = 'assets/remote.svg';
  late String info =  "- Let me know a lil' bit about you...";
  double? tempo;

  //Controllers
  TextEditingController goController = TextEditingController();
  TextEditingController backController = TextEditingController();
  TextEditingController elevatorController = TextEditingController();

  //A method that calculates spent time by the user.
  void calculate(){
    double go = double.parse(goController.text.replaceAll(',', '.'));
    double back = double.parse(backController.text.replaceAll(',', '.'));
    double elevator = double.parse(elevatorController.text.replaceAll(',', '.'));
    //22 worked by month - 12 months worked per year
    tempo = ((go + back + elevator) * 22/60*12)/24;
  }

  //A method to change the SVG
  void change(){
    picture = 'assets/stressedout.svg';
    if(tempo == null) {
      info = "Error loading data...";
    }else{
      info = "Gosh! You saved ${tempo!.toStringAsFixed(2)} days per year of your life!";
    }
  }

  //A method to refresh information
  void refresh(){
    goController.clear();
    backController.clear();
    elevatorController.clear();
    picture = 'assets/remote.svg';
    info =  "- Let me know a lil' bit about you...";
  }

}