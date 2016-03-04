//
// an example of modulating pulse width to make Nintendo NES like sounds
// example available at https://soundcloud.com/catpants/nes

//makes two pulse oscillators and mix them together with gain g, send to speakers
PulseOsc a => Gain g => dac;
PulseOsc b => g;

// make a variable for a counter and set a note to base the scale off of.

0 => int counter1;
60 => int key;

// plays a scale

[ 1, 3, 3, 4, 9, 9, 1, 8, 9 ] @=> int scale[];

// set the gain
.8 => g.gain, a.gain, b.gain;

// make a loop
while (true){
    // turn the scale into a midi note and send it to oscillator a and b.
    Math.mtof(key+scale[counter1%9]) => a.freq, b.freq; 
    // set pulse widths, wait 250 ms, change pulse widths, wait 250 ms, change pulse widths,
    // wait 250 ms, increase counter by 1, print to console and then repeat indefinitely
    .125 => a.width;
    .25 => b.width;
    250::ms => now;
    .25 => a.width;
    .5 => b.width;
    250::ms => now; 
    .5 => a.width;
    .75 => b.width;
    250::ms => now;
    counter1 + 1 => counter1; 
    <<< "change", counter1 >>>;
    }
    
    