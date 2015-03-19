/*
This is based on combining ControlP5 Controlframe with a screen capture
technique. 

ControlP5 Controlframe is a way of generating two windows so that we can 
have one window to display the video and one to display the controls.

The screen capture technique is an implementation of a comment someone
left on the github for "ScreenCapturer", a once-popular Processing library
to generate live screen capture data. The library is several years old though 
and no longer works due to an update to Java's way of handling transparent 
windows.

Most of the comments come from the copied code.

Original ithub comment:
https://github.com/onformative/ScreenCapturer/issues/2
 */

import java.awt.Frame;
import java.awt.BorderLayout;
import java.awt.Robot;
import java.awt.Rectangle;
import java.awt.AWTException;
import controlP5.*;

private ControlP5 cp5;

ControlFrame cf;

PImage display;
PImage capture_img;
color pixel_value;

// S O R T I N G
//MODE:
//0 -> black
//1 -> bright
//2 -> white
int mode = 1;
int loops = 1;
int blackValue = -10000000;
int brigthnessValue = 60;
int whiteValue = -6000000;
int row = 0;
int column = 0;
boolean saved = false;

int capture_window_posX = 0;
int capture_window_posY = 100;
int capture_window_width = 1150;
int capture_window_height = 480;
boolean capture_pause = false;
boolean update_capture_window = true;
int update_image;

int[] fx_toggle; 
/*  FX TOGGLE LEGEND:
    0: RGB CC space
    1: brightness space 
    2: contrast space
    3: hue space
    4: saturation space
    5: sharpening
    6: fancy contrast
    7: party mode
*/
float user_red = 0.;
float user_green = 0.;
float user_blue = 0.;
float brightness_val = 0.;
float contrast_val = 0.;
float threshold_val = 0.;
float exp_val = 1.0;

CheckBox checkbox_toggles;
int cp5_mx = 15;
int cp5_my = 10;
float fps;

PShape grid;
PShader bwShader;

int DIM, NUMQUADS; // variables to hold the grid dimensions and total grid size

PFont font1 = createFont("monaco", 10, true);
