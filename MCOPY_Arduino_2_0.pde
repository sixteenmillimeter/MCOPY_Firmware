//Normal Mode

#include <AFMotor.h>
#include <Servo.h>
AF_DCMotor motor(1, MOTOR12_2KHZ);
//IR VARIABLE
int irVal = 1000;
int ir = 13;
int trip = 0;
int t = 0;

/*BLINK MODE - 4 LEDS representing the 4 functions

//x
int blink0 = 13;
//c
int blink1 = 12;
//f
int blink2 = 11;
//b
int blink3 = 10;

*/

int incomingByte = 0;
Servo myservo;


void setup(){

  pinMode(ir, OUTPUT);

  motor.setSpeed(200);
  Serial.begin(9600);
  myservo.attach(9);
  
  Serial.flush();
  Serial.println("M,C,O,P,Y,");
  Serial.println("Build: 'Balla'");
  Serial.println(" ");
  
  /*BLINK CODE
  pinMode(blink0, OUTPUT); 
  pinMode(blink1, OUTPUT);
  pinMode(blink2, OUTPUT);
  pinMode(blink3, OUTPUT); 
  digitalWrite(blink0, LOW);
  digitalWrite(blink1, LOW);
  digitalWrite(blink2, LOW);
  digitalWrite(blink3, LOW);
  */
}
void loop(){
  if (Serial.available() > 0){
    incomingByte = Serial.read();
  }
  if(incomingByte == 'f'){

    Serial.println(incomingByte, BYTE);
    // TAKE OUT FOR BLINK MODE
    motor.setSpeed(225);
    motor.run(FORWARD);
    delay(200);
    digitalWrite(ir, HIGH);
    t = analogRead(trip);

    while (t > irVal){
    delay(20);
    t = analogRead(trip);
    //Serial.println(t);
    }  
      motor.run(RELEASE);
      digitalWrite(ir, LOW);
      incomingByte = 0;
      delay(500);  
      motor.setSpeed(200);
      //

      /*BLINK CODE
      for(int i=0;i<3;i++){
      delay(165);
      digitalWrite(blink2, HIGH);
      delay(165);
      digitalWrite(blink2, LOW);
      }   */

  } 
  
  if(incomingByte == 'b'){
    Serial.println(incomingByte, BYTE);
    // TAKE OUT FOR BLINK MODE
    motor.setSpeed(225);
    motor.run(BACKWARD);
    delay(200);
    digitalWrite(ir, HIGH);
    t = analogRead(trip);

    while (t > irVal){
    delay(20);
    t = analogRead(trip);
    }  
      motor.run(RELEASE);
      digitalWrite(ir, LOW);
      incomingByte = 0;
      delay(500);
      //  

    /*BLINK CODE
      for(int i=0;i<4;i++){
        delay(125);
        digitalWrite(blink3, HIGH);
        delay(125);
        digitalWrite(blink3, LOW);
      } */
  } 
  if(incomingByte == 'c'){
    Serial.println(incomingByte, BYTE);

    // TAKE OUT FOR BLINK MODE
  delay(500);
  myservo.write(0);      
  delay(1000);      
  myservo.write(180);
  incomingByte = 0;
  //
  
    /*BLINK CODE
    for(int i=0;i<2;i++){
      delay(250);
      digitalWrite(blink0, HIGH);
      delay(250);
      digitalWrite(blink0, LOW);
      }*/
  } 
  if(incomingByte == 'x'){  
    Serial.println(incomingByte, BYTE);
  // TAKE OUT FOR BLINK MODE 
    motor.run(FORWARD);
    delay(200);
    motor.run(RELEASE);
    
    delay(500);
    myservo.write(0);      
    delay(1000);      
    myservo.write(180);
    delay(500);
    motor.run(BACKWARD);
    delay(350);
    motor.run(RELEASE);
    motor.run(FORWARD);
    digitalWrite(ir, HIGH);
    t = analogRead(trip);
    while (t > irVal)
    {
      delay(10);
      t = analogRead(trip);
    }  
    motor.run(RELEASE);
    digitalWrite(ir, LOW);
    incomingByte = 0; 
    delay(500);
    //

  /*BLINK CODE
    for(int i=0;i<2;i++){
      delay(250);
      digitalWrite(blink1, HIGH);
      delay(250);
      digitalWrite(blink1, LOW);

    } */
}
incomingByte = 0;
}

