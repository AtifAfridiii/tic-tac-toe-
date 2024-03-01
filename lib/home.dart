
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
 
class _HomeState extends State<Home> {

 List <String> displayOX= ['','','','','','','','','',];
  bool oTurn = true;
  String winner = '';
 List <int> collect=[];
  int Oscore=0;
  int xscore=0;
  int filledbox=0;
  bool winnerfound=false;

  @override
  Widget build(BuildContext context) {
    
   

    return Scaffold(
      backgroundColor: Colors.red.shade300,
      body: Padding(
        padding: const EdgeInsets.all(11),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Expanded(
              flex: 1,
              child:Container(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                       Text('Player O Score ',style: GoogleFonts.peralta(textStyle:TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                       )),),
                      Text(Oscore.toString(),style: GoogleFonts.padauk(textStyle:TextStyle(
                        fontSize: 31,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                       )),),
                    ],
                  ),
                  SizedBox(width: 31,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                       Text('Player X Score ',style: GoogleFonts.peralta(textStyle:TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                       )),),
                      Text(xscore.toString(),style: GoogleFonts.padauk(textStyle:TextStyle(
                        fontSize: 31,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                       )),),
                    ],
                  )
                ],
              ),)),
               Expanded(
              flex: 4,
              child: GridView.builder(
                
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:3 ),
                 itemBuilder: (BuildContext context,int index) {

                return InkWell(
                  onTap: (){
                    Tapped(index);
                  },
                  child: Container(
                  
                    decoration: BoxDecoration(
                  
                      color:  collect.contains(index)? Colors.green:Colors.yellow,
                      borderRadius: BorderRadius.circular(11),
                      border: Border.all(width: 3,
                      color: Colors.black45,
                      style: BorderStyle.solid),
                  
                    ),
                    child: Center(child: Text(displayOX[index].toString(),style: GoogleFonts.lato(textStyle: TextStyle(
                        fontSize: 71,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54
                      ),)),),
                  ),
                );
              },)),

               Expanded(
              flex: 2,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(winner.toString(), style:GoogleFonts.zcoolKuaiLe(textStyle:TextStyle(
                fontSize: 31,
                color: Colors.white,
               fontWeight: FontWeight.bold,
              )) ,),
              SizedBox(height: 51,),

              InkWell(
                onTap: (){
                  Restart();
                },
                child: Container(
                  height: 51,
                  width: 251,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Center(child: Text('Restart',style: GoogleFonts.yeonSung(textStyle:TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.bold)),),),
                ),
              )            ],
              )),
          ],

        ),
      ),
    );
  }
  void Tapped(int index){

    setState(() {
    if (displayOX[index] == '') {
      if (oTurn) {
        displayOX[index] = 'O';
        filledbox++;
      } else {
        displayOX[index] = 'X';
        filledbox++;
      }
      oTurn = !oTurn;
      Result();
    }
  });
  }

   void Result(){
  //first row
   if(displayOX[0]==displayOX[1] && displayOX[0]==displayOX[2] && displayOX[0]!=''){
      setState(() {
        winner ='Player ${displayOX[0]} Wins';
        collect.addAll([0,1,2]);
        Score(displayOX[0]);
      });
   }

   // second row

   if(displayOX[3]==displayOX[4] && displayOX[3]==displayOX[5] && displayOX[3]!=''){
      setState(() {
        winner ='Player ${displayOX[3]} Wins';
         collect.addAll([3,4,5]);
        Score(displayOX[3]);
      });
   }

   // third row 

   if(displayOX[6]==displayOX[7] && displayOX[6]==displayOX[8] && displayOX[6]!=''){
      setState(() {
        winner ='Player ${displayOX[6]} Wins';
         collect.addAll([6,7,8]);
        Score(displayOX[6]);
      });
   }

   //first Column
   if(displayOX[0]==displayOX[3] && displayOX[0]==displayOX[6] && displayOX[0]!=''){
      setState(() {
        winner ='Player ${displayOX[0]} Wins';
         collect.addAll([0,3,6]);
        Score(displayOX[0]);
      });
   }
   
   //second column 

   if(displayOX[1]==displayOX[4] && displayOX[1]==displayOX[7] && displayOX[1]!=''){
      setState(() {
        winner ='Player ${displayOX[1]} Wins';
         collect.addAll([1,4,7]);
        Score(displayOX[1]);
      });
   }

  // third column 
  
   if(displayOX[2]==displayOX[5] && displayOX[2]==displayOX[8] && displayOX[2]!=''){
      setState(() {
        winner ='Player ${displayOX[2]} Wins';
         collect.addAll([2,5,8]);
        Score(displayOX[2]);
      });
   }


  // diognal

if(displayOX[0]==displayOX[4] && displayOX[0]==displayOX[8] && displayOX[0]!=''){
      setState(() {
        winner ='Player ${displayOX[0]} Wins';
         collect.addAll([0,4,8]);
        Score(displayOX[0]);
      });
   }
if(displayOX[6]==displayOX[4] && displayOX[6]==displayOX[2] && displayOX[6]!=''){
      setState(() {
        winner ='Player ${displayOX[6]} Wins';
         collect.addAll([6,4,2]);
        Score(displayOX[6]);
      });
   }

   if (!winnerfound && filledbox == 9) {
    setState(() {
      winner = 'Nobody Wins';
    });
     
  }


   }

   void Score(String winner ){
    if(winner=='O'){
      Oscore++;
    }else if (winner=='X'){
      xscore++;
    }
   
   }
   
void Restart(){
  setState(() {
    for(int i=0 ; i<9 ; i++){
      displayOX[i]='';
     collect.clear();
    }
 winner='';
 filledbox=0;
 
  },
 
  );
}
 }