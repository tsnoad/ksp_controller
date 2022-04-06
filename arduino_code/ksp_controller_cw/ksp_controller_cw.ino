#include <Keypad.h>
#include <Keyboard.h>

//setup the keypad array
const byte ROWS = 5; //five rows
const byte COLS = 4; //four columns
//for each press of the keypad, we'll use a generic but unique character
//we actually need the arduino keyboard library to send some special key presses (shift, mod+l, backspace, etc)
//so we'll need to translate these generic characters later
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

//setup the switch/toggle inputs that we'll use to control the backlights
int pushbuttons_num = 2;
bool pushbuttons_changed = false;
int pushbuttons_pin[] = {
  20, //toggle button up
  21, //toggle button down
};
bool pushbuttons_bounce_active[] = {
  false,
  false,
};
bool pushbuttons_active[] = {
  false,
  false,
};

//setup the backlighting control
int backlight_pwm_pin = 3;
int backlight_pwm_mode = 0;

void setup(){
  //Serial.begin(9600);

  //setup the keypad
  keypad.addEventListener(keypadEvent);
  keypad.setHoldTime(500);
  keypad.setDebounceTime(50);

  //setup backlight
  pinMode(backlight_pwm_pin, OUTPUT);
  analogWrite(backlight_pwm_pin, 0);

  for (int i = 0; i < pushbuttons_num; i += 1) {
     pinMode(pushbuttons_pin[i], INPUT_PULLUP);
  }
}

void loop(){
  //First, we'll check if the button/switch that controls the backlight has changed
  pushbuttons_changed = false;
  //loop through all pushbuttons
  for (int i = 0; i < pushbuttons_num; i += 1) {
    //check if the button has changed state
    if (pushbuttons_bounce_active[i] != (digitalRead(pushbuttons_pin[i]) == LOW)) {
      //button has changed state, make a note
      pushbuttons_bounce_active[i] = digitalRead(pushbuttons_pin[i]) == LOW;
      //set this so we know we need to check for bouncing
      pushbuttons_changed = true;
    }
  }

  //one of the buttons has changed state, we need to check if it actually has, or if it's just bouncing
  if (pushbuttons_changed) {
    //wait to debounce
    delay(100);

    //loop through all pushbuttons
    for (int i = 0; i < pushbuttons_num; i += 1) {
      //check if state has not bounced
      if (pushbuttons_bounce_active[i] == (digitalRead(pushbuttons_pin[i]) == LOW) && pushbuttons_bounce_active[i] != pushbuttons_active[i]) {
        //state has actually changed (not just a bounce)
        //make a note of the new button state
        pushbuttons_active[i] = pushbuttons_bounce_active[i];

        //if the button has turned on
        if (pushbuttons_active[i]) {
          //we need to cycle to the next backlight brightness state
          switch (backlight_pwm_mode) {
            case 0:
              //set to medium brightness
              analogWrite(backlight_pwm_pin, 127);
              backlight_pwm_mode = 1;
              break;
            case 1:
              //set to full brightness
              analogWrite(backlight_pwm_pin, 255);
              backlight_pwm_mode = 2;
              break;
            case 2:
              //turn the backlight off
              analogWrite(backlight_pwm_pin, 0);
              backlight_pwm_mode = 0;
              break;
          }
        }
      }
    }
  }

  //Now, we'll check if any of the keypad buttons have been pressed
  //get the current button (of any)
  char key = keypad.getKey();

  //has something been pressed?
  if (key) {
    //Serial.println(key);

    //the keypad library will send us a generic a-t character for each key pressed
    //but we need to translate this to the keyboard character that we actually want
    switch (key) {
      case 'a': //pause/resume
        Keyboard.press(KEY_ESC);
        break;
      case 'b': //quicksave
        Keyboard.press(KEY_F5);
        break;
      case 'c': //quickload
        Keyboard.press(KEY_F9);
        break;
      case 'd': //save menu
        //Keyboard.press(KEY_ESC);
        break;
      case 'e': //IVA
        Keyboard.press('c');
        break;
      case 'f': //view (camera)
        Keyboard.press('v');
        break;
      case 'g': //s/h navball
        //Keyboard.press('.');
        break;
      case 'h': //s/h ui
        Keyboard.press(KEY_F2);
        break;
      case 'i': //prev obj
        Keyboard.press('[');
        break;
      case 'j': //next obj
        Keyboard.press(']');
        break;
      case 'k': //zoom minus
        Keyboard.press('-');
        break;
      case 'l': //zoom plus
        Keyboard.press('+');
        break;
      case 'm': //left arrow
        Keyboard.press(KEY_LEFT_ARROW);
        break;
      case 'n': //right arrow
        Keyboard.press(KEY_RIGHT_ARROW);
        break;
      case 'o':
        //down arrow
        Keyboard.press(KEY_DOWN_ARROW);
        break;
      case 'p': //up arrow
        Keyboard.press(KEY_UP_ARROW);
        break;
      case 'q': //warp decrease
        Keyboard.press('.');
        break;
      case 'r': //warp increase
        Keyboard.press(',');
        break;
      case 's': //physics warp decrease
        //Keyboard.press(KEY_ESC);
        break;
      case 't': //physics warp increase
        //Keyboard.press(KEY_ESC);
        break;
    }
  }
  
  /*if (blink) {
    digitalWrite(ledPin,!digitalRead(ledPin));
    delay(100);
  }*/
}

//take care of some special events
//in the library example this event is used to blink a led while a key is held down
//but we'll only use it to detect when a key is released, so we can we can release the USB keyboard key at the right time
void keypadEvent(KeypadEvent key) {
  switch (keypad.getState()){
    case PRESSED:
      //digitalWrite(ledPin,!digitalRead(ledPin));
      break;
    case RELEASED:
      //digitalWrite(ledPin,!digitalRead(ledPin));
      //blink = false;
      
      Keyboard.releaseAll();
      break;
    case HOLD:
      //blink = true;
      break;
  }
}
