
// Kaljatölkin kansi kierrekorkilla


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
   cylinder(d2=24, d1=28, h=15, $fn = 50);
  translate([0,0,5]) 
    thread_for_nut_fullparm(diameter=20, length=10,pitch=1.5,usrclearance=0.2);
  translate([0,0,-1]) cylinder(d=22, h=9, $fn = 50);
 }
}


$fn=100;

module kansi () { 
difference () {
   union() {
     difference () {
        translate([0,0,-2])cylinder (r=radius+2.5,h=10.4,$fn=100);
	translate ([0,0,2])
	cylinder (r1=radius,r2=radius-0.75,h=4.6,$fn=100);
	translate ([0,0,6])
	cylinder (r1=radius-0.75,r2=radius+1,h=2.6,$fn=100);
        }
    translate([12,0,0]) rotate([0,180,0]) putki();
    translate([-2,0,-2]) rengas();
    }
   translate([12,0,-3]) cylinder(d=22,h=5);
   rotate_extrude() translate([radius-1,1.5,0]) circle(d=3.6) ;
   //   translate([0,0,-20])cube(100);

 }
translate([-36.2,-5,3])cube([7,10,5]);
}

translate([0,0,6.4]) rotate([180,0,0]) {
      kansi();
     translate([46,0,-1.6])    korkki();
}

module korkki() {
 translate([0,0,3])thread_for_screw_fullparm(diameter=20, length=8,pitch=1.5);
 translate([0,0,-2])cylinder(d=30, h=4, $fn=6);
 translate([0,0,2]) cylinder(d=17.5,h=9);
 translate([0,0,-2])rengas();
}


