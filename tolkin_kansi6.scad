
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

module tutti() {
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

  can_diameter=54;
  diameter_tpu=can_diameter+0.75;
  radius_tpu=diameter_tpu/2;
  sisaanveto=2; // 2 oli liian suuri

module tpu_pohja() {
  difference () {
    cylinder (r=radius_tpu+2.5,h=6.5,$fn=100);
    translate ([0,0,2])
      cylinder (r1=radius_tpu,r2=radius_tpu,h=2.1,$fn=100);
    translate ([0,0,4])
      cylinder (r1=radius_tpu,r2=radius_tpu-sisaanveto,h=3.6,$fn=100);
    translate ([0,0,5])
      cylinder (r1=radius_tpu-sisaanveto,r2=radius_tpu+0.2,h=1.6,$fn=100);
    translate([0,0,-1])cylinder(d=44,h=10);
    //     cube(100);
  }
}


//tutti();

module testi ()difference() {
  union() {
    color("RED") kansi();
    tpu_pohja();
  }
  translate([0,0,-16])      cube(100);
}
//testi();

//tpu_pohja();
kansi();
