// Kaljatölkin kansi kierrekorkilla

use <threads-library-by-cuiso-v1.scad>

purkin_koko=54;
diameter=purkin_koko+0.75;
radius=diameter/2;

module rengas() {
  translate([0,4,-2])
  rotate([90,0,0])
  difference() {
   cylinder(8,d=8);
   cylinder(28,d=5);
 }
}

module putki() {
 difference(){
  cylinder(d=24, h=15, $fn = 50);
  translate([0,0,7]) 
    thread_for_nut_fullparm(diameter=20, length=8,pitch=1.5,usrclearance=0.2);
  translate([0,0,-1]) cylinder(d=22, h=9, $fn = 50);
 }
}

module korkki() {
 difference() {
  thread_for_screw_fullparm(diameter=20, length=8,pitch=1.5); 
  cylinder(d=16, h=11, $fn=50);
  }
 translate([0,0,-2])cylinder(d=30, h=4, $fn=6);
 translate([0,0,2]) cylinder(d=16,h=6);
 translate([0,0,-2])rengas();
}

module kansi () { 
 difference () {
   union() {
     difference () {
	cylinder (r=radius+2.5,h=6.4,$fn=100);
	translate ([0,0,2])
	cylinder (r1=radius,r2=radius-0.75,h=4.6,$fn=100);
	translate ([0,0,5])
	cylinder (r1=radius-0.75,r2=radius+0.2,h=1.6,$fn=100);
        }
    translate([12,0,0]) rotate([0,180,0]) putki();
    translate([-5,0,-0.5]) rengas();
    }
   translate([12,0,-1]) cylinder(d=22,h=5);
 }
translate([-35.2,-5,0])cube([7,10,5]);
}

translate([0,0,6.4]) rotate([180,0,0]) {
    kansi();
    translate([46,0,-1.6]) korkki();
}

