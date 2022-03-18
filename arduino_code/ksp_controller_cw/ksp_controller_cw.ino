#include <Keypad.h>
#include <Keyboard.h>

const byte ROWS = 5; //five rows
const byte COLS = 4; //four columns
char keys[ROWS][COLS] = {
  {'a','b','c','d'},
  {'e','f','g','h'},
  {'i','j','k','l'},
  {'m','n','o','p'},
  {'q','r','s','t'}
};
byte rowPins[ROWS] = {5,6,7,8,9}; //connect to the row pinouts of the keypad
byte colPins[COLS] = {15,14,16,10}; //connect to the column pinouts of the keypad

Keypad keypad = Keypad( makeKeymap(keys), rowPins, colPins, ROWS, COLS );

byte ledPin = 13;
boolean blink = false;

int tog_sw1 = 2;
int tog_sw2 = 3;
//int pwm_pin = 

void setup(){
  Serial.begin(9600);
  pinMode(ledPin, OUTPUT);      // sets the digital pin as output
  digitalWrite(ledPin, HIGH);   // sets the LED on
  
  keypad.addEventListener(keypadEvent); //add an event listener for this keypad
  keypad.setHoldTime(500);
  keypad.setDebounceTime(50);
}

void loop(){
  char key = keypad.getKey();

  if (key) {
    Serial.println(key);

    switch (key) {
      case 'a':
        //pause/resume
        Keyboard.press(KEY_ESC);
        break;
      case 'b':
        //quicksave
        Keyboard.press(KEY_F5);
        break;
      case 'c':
        //quickload
        Keyboard.press(KEY_F9);
        break;
      case 'd':
        //save menu
        //Keyboard.press(KEY_ESC);
        break;
      case 'e':
        //IVA
        Keyboard.press('c');
        break;
      case 'f':
        //view (camera)
        Keyboard.press('v');
        break;
      case 'g':
        //s/h navball
        //Keyboard.press('.');
        break;
      case 'h':
        //s/h ui
        Keyboard.press(KEY_F2);
        break;
      case 'i':
        //prev obj
        Keyboard.press('[');
        break;
      case 'j':
        //next obj
        Keyboard.press(']');
        break;
      case 'k':
        //zoom minus
        Keyboard.press('-');
        break;
      case 'l':
        //zoom plus
        Keyboard.press('+');
        break;
      case 'm':
        //left arrow
        Keyboard.press(KEY_LEFT_ARROW);
        break;
      case 'n':
        //right arrow
        Keyboard.press(KEY_RIGHT_ARROW);
        break;
      case 'o':
        //down arrow
        Keyboard.press(KEY_DOWN_ARROW);
        break;
      case 'p':
        //up arrow
        Keyboard.press(KEY_UP_ARROW);
        break;
      case 'q':
        //warp decrease
        Keyboard.press('.');
        break;
      case 'r':
        //warp increase
        Keyboard.press(',');
        break;
      case 's':
        //physics warp decrease
        //Keyboard.press(KEY_ESC);
        break;
      case 't':
        //physics warp increase
        //Keyboard.press(KEY_ESC);
        break;
    }
  }
  
  if (blink) {
    digitalWrite(ledPin,!digitalRead(ledPin));
    delay(100);
  }
}

//take care of some special events
void keypadEvent(KeypadEvent key){
  switch (keypad.getState()){
    case PRESSED:
      digitalWrite(ledPin,!digitalRead(ledPin));
      break;
    case RELEASED:
      digitalWrite(ledPin,!digitalRead(ledPin));
      blink = false;
      
      Keyboard.releaseAll();
      break;
    case HOLD:
      blink = true;
      break;
  }
}
