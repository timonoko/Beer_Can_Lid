
// Kaljatölkin kansi kierrekorkilla

$fn=100;

use <threads-library-by-cuiso-v1.scad>

liian_tiukka=0.1;
purkin_koko=54;
diameter=purkin_koko+0.8;
radius=diameter/2+liian_tiukka;

module rengas() {
  translate([-1,4,-2])
  rotate([90,0,0])
  difference() {
   cylinder(8,d=8);
   cylinder(28,d=5);
 }
}

module putki() {
 difference(){
   cylinder(d2=24, d1=30, h=15, $fn = 50);
  translate([0,0,5]) 
    thread_for_nut_fullparm(diameter=20, length=10,pitch=1.5,usrclearance=0.2);
  translate([0,0,-1]) cylinder(d=22, h=9, $fn = 50);
 }
}


module kansi () { 
  difference () {
    union() {
      translate([0,0,-2])cylinder (d1=57,d2=59,h=2);
      translate([12,0,0]) rotate([0,180,0]) putki();
      translate([-3,0,-2]) rengas();
    }
    translate([12,0,-3]) cylinder(d=22,h=5);
    //   translate([0,0,-20])cube(100);

  }
}

module korkki() {
  difference(){
    union() {
      translate([0,0,3])thread_for_screw_fullparm(diameter=20, length=8,pitch=1.5);
      translate([0,0,-6])cylinder(d=35, h=8, $fn=4);
      translate([0,0,2]) cylinder(d=17.5,h=9);
      translate([0,0,-15])cylinder(d1=8,d2=14,h=20);
    }
    translate([0,0,-16])cylinder(d1=2,d2=12,h=30);
    //    translate([0,0,-16]) cube(100); 
  }
}

//perry=0.25; // perry on isompi
perry=0 //kumirengasta kun venyttää toimii paremmin
tolkki=59.5;
pullennus=0.6+perry;

module uuspohja() {
  difference(){
    cylinder(d=tolkki+3+pullennus,h=9);
    translate([0,0,-3]) cylinder(d=54+pullennus,h=10);
    translate([0,0,2.5])  rotate_extrude() translate([tolkki/2-3.5/2+pullennus,0,0])  circle(d=3.5);
    translate([0,0,-1]) cylinder(d=56+pullennus,h=3);
    cylinder(d=46,h=10);
    //  cube(100);
  }
}


module tiiviste () {
  difference(){
    cylinder(d=54+pullennus-0.2,h=2);
    cylinder(d=47,h=3);
  }
}

//kansi();
uuspohja();
//tiiviste();
