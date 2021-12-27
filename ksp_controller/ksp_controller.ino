#include <Keyboard.h>

int trans_inout_brown = 3;
int trans_inout_red = 2;
int trans_cont_white = 7;
int trans_cont_brown = 6;
int trans_cont_orange = 5;
int trans_cont_green = 4;

int trans_in = trans_inout_brown;
int trans_out = trans_inout_red;
int trans_left = trans_cont_green;
int trans_right = trans_cont_brown;
int trans_up = trans_cont_orange;
int trans_down = trans_cont_white;

bool trans_in_active = false;
bool trans_out_active = false;
bool trans_left_active = false;
bool trans_right_active = false;
bool trans_up_active = false;
bool trans_down_active = false;

char trans_in_key = 'n';
char trans_out_key = 'h';
char trans_left_key = 'j';
char trans_right_key = 'l';
char trans_up_key = 'i';
char trans_down_key = 'k';

//pin 8 does not work
//pin 11 does not work

//int att_roll_
//int att_roll_
int att_red = 13;
int att_yellow = 12;
int att_blue = 10;
int att_gray = 9;

//int att_rollleft
//int att_rollright
int att_left = att_gray;
int att_right = att_yellow;
int att_up = att_blue;
int att_down = att_red;

bool att_rollleft_active = false;
bool att_rollright_active = false;
bool att_left_active = false;
bool att_right_active = false;
bool att_up_active = false;
bool att_down_active = false;

char att_rollleft_key = 'q';
char att_rollright_key = 'e';
char att_left_key = 'a';
char att_right_key = 'd';
char att_up_key = 'w';
char att_down_key = 's';



void setup() {
  pinMode(trans_in, INPUT_PULLUP);
  pinMode(trans_out, INPUT_PULLUP);
  pinMode(trans_left, INPUT_PULLUP);
  pinMode(trans_right, INPUT_PULLUP);
  pinMode(trans_up, INPUT_PULLUP);
  pinMode(trans_down, INPUT_PULLUP);
  
  //pinMode(att_rollleft, INPUT_PULLUP);
  //pinMode(att_rollright, INPUT_PULLUP);
  pinMode(att_left, INPUT_PULLUP);
  pinMode(att_right, INPUT_PULLUP);
  pinMode(att_up, INPUT_PULLUP);
  pinMode(att_down, INPUT_PULLUP);
  
  Keyboard.begin();
}

void loop() {
  if (trans_in_active != (digitalRead(trans_in) == LOW)) {
    if (digitalRead(trans_in) == LOW) {
      trans_in_active = true;
      Keyboard.press(trans_in_key);
    } else {
      trans_in_active = false;
      Keyboard.release(trans_in_key);
    }
  }
  
  if (trans_out_active != (digitalRead(trans_out) == LOW)) {
    if (digitalRead(trans_out) == LOW) {
      trans_out_active = true;
      Keyboard.press(trans_out_key);
    } else {
      trans_out_active = false;
      Keyboard.release(trans_out_key);
    }
  }
  
  if (trans_left_active != (digitalRead(trans_left) == LOW)) {
    if (digitalRead(trans_left) == LOW) {
      trans_left_active = true;
      Keyboard.press(trans_left_key);
    } else {
      trans_left_active = false;
      Keyboard.release(trans_left_key);
    }
  }
  
  if (trans_right_active != (digitalRead(trans_right) == LOW)) {
    if (digitalRead(trans_right) == LOW) {
      trans_right_active = true;
      Keyboard.press(trans_right_key);
    } else {
      trans_right_active = false;
      Keyboard.release(trans_right_key);
    }
  }
  
  if (trans_up_active != (digitalRead(trans_up) == LOW)) {
    if (digitalRead(trans_up) == LOW) {
      trans_up_active = true;
      Keyboard.press(trans_up_key);
    } else {
      trans_up_active = false;
      Keyboard.release(trans_up_key);
    }
  }
  
  if (trans_down_active != (digitalRead(trans_down) == LOW)) {
    if (digitalRead(trans_down) == LOW) {
      trans_down_active = true;
      Keyboard.press(trans_down_key);
    } else {
      trans_down_active = false;
      Keyboard.release(trans_down_key);
    }
  }

  
  if (att_left_active != (digitalRead(att_left) == LOW)) {
    if (digitalRead(att_left) == LOW) {
      att_left_active = true;
      Keyboard.press(att_left_key);
    } else {
      att_left_active = false;
      Keyboard.release(att_left_key);
    }
  }
  if (att_right_active != (digitalRead(att_right) == LOW)) {
    if (digitalRead(att_right) == LOW) {
      att_right_active = true;
      Keyboard.press(att_right_key);
    } else {
      att_right_active = false;
      Keyboard.release(att_right_key);
    }
  }
  if (att_up_active != (digitalRead(att_up) == LOW)) {
    if (digitalRead(att_up) == LOW) {
      att_up_active = true;
      Keyboard.press(att_up_key);
    } else {
      att_up_active = false;
      Keyboard.release(att_up_key);
    }
  }
  if (att_down_active != (digitalRead(att_down) == LOW)) {
    if (digitalRead(att_down) == LOW) {
      att_down_active = true;
      Keyboard.press(att_down_key);
    } else {
      att_down_active = false;
      Keyboard.release(att_down_key);
    }
  }
}
