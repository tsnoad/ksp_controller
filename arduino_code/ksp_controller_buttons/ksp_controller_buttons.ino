
#include <Keyboard.h>

//setup the switch/toggle inputs that we'll use to control the backlights
//this is the number of buttons, we need this so we can loop through the arrays
int pushbuttons_num = 12;
//this boolean tells if anything has actually changed this cycle - if not then we don't need to wait to debounce
bool pushbuttons_changed = false;
//this is the list of pins, note the comment that explains what each button actually is
int pushbuttons_pin[] = {
  7, //row 1, col1 - toggle staging
  8, //row 1, col 2 - stage
  9, //row 1, col 3 - abort
  3, //row 2, col 1 - gear
  4, //row 2, col 2 - brakes
  5, //row 2, col 3 - lights
  10, //row 3, col 1 - toggle SAS
  14, //row 3, col 2 - toggle RCS
  18, //row 3, col 3 - SAS/RCS vernier
  19, //row 4, col 1 - AG1
  20, //row 4, col 2 - AG2
  21, //row 4, col 3 - AG3
};
//this is where we store the status of each button, while we're waiting to check if it's bouncing
bool pushbuttons_bounce_active[] = {
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
};
//this is the actual state of each button, after we know that its stopped bouncing
bool pushbuttons_active[] = {
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
};
//this is the USB keyboard key that we want to trigger for each button
char pushbuttons_key[] = {
  KEY_LEFT_ALT, // mod - l
  ' ', //space
  KEY_BACKSPACE,
  'g',
  'b',
  'u',
  't',
  'r',
  KEY_CAPS_LOCK,
  '1',
  '2',
  '3',
};
//for some buttons we want to trigger multiple USB keyboard keys, eg ALT + L
char pushbuttons_secondkey[] = {
  'l',
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
};
//this shows us which buttons should be treated as toggles - for these, when we detect an input we'll trigger a short keypress (rather than waiting for the button to be released, then releasing the USB keyboard key)
bool pushbuttons_toggle[] = {
  true,
  false,
  false,
  false,
  false,
  false,
  true,
  true,
  false,
  false,
  false,
  false,
};

void setup() {
//  Serial.begin(9600);

  //setup the input for the buttons
  for (int i = 0; i < pushbuttons_num; i += 1) {
     pinMode(pushbuttons_pin[i], INPUT_PULLUP);
  }

  //setup the USB keyboard library
  Keyboard.begin();
}

void loop() {
  //reset this so we know if any buttons have changed state
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

        //if this button is a toggle
        if (pushbuttons_toggle[i]) {
          //trigger a keypress for the associated key
          Keyboard.press(pushbuttons_key[i]);
          //if there's a seconday key associated, trigger a keypress
          if (pushbuttons_secondkey[i]) Keyboard.press(pushbuttons_secondkey[i]);
          //hold for a little while
          delay(100);
          //release the keys
          Keyboard.release(pushbuttons_key[i]);
          if (pushbuttons_secondkey[i]) Keyboard.release(pushbuttons_secondkey[i]);

        //if this button is not a toggle
        } else {
          //if the button is now on (it's been pressed)
          if (pushbuttons_active[i]) {
            //trigger a keypress for the associated key
            Keyboard.press(pushbuttons_key[i]);
            //if there's a seconday key associated, trigger a keypress
            if (pushbuttons_secondkey[i]) Keyboard.press(pushbuttons_secondkey[i]);
            
          //if the button is now off (it's been release)
          } else {
            //release the keys
            Keyboard.release(pushbuttons_key[i]);
            if (pushbuttons_secondkey[i]) Keyboard.release(pushbuttons_secondkey[i]);
          }
        }
      }
    }
  }
}
