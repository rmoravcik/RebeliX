// RebeliX
//
// cable-holder
// GNU GPL v3
// Martin Neruda <neruda@reprap4u.cz>
// http://www.reprap4u.cz

extrusion_width = 0.66;

width = 13;
height = 7;

// Vyrez v hlinikovem profilu
space = 8.2;

difference(){
  union(){
	translate([-2*extrusion_width,0,0]) cube([width+4*extrusion_width,2*extrusion_width,height]);
	translate([-2*extrusion_width,-2*extrusion_width-2,0]) cube([width+4*extrusion_width,2*extrusion_width,height]);
	translate([-2*extrusion_width,-2*extrusion_width-2,0]) cube([2*extrusion_width,4*extrusion_width+2,height]);
	translate([width,-2*extrusion_width-2,0]) cube([2*extrusion_width,2*extrusion_width+2*3/4,height]);
	translate([width/2 - space/2+0.1,2*extrusion_width,0]) cube([2*extrusion_width,2*extrusion_width+2.2,height]);
	translate([width/2 + space/2 - 2*extrusion_width-0.1,2*extrusion_width,0]) cube([2*extrusion_width,2*extrusion_width+2.2,height]);

	translate([width/2 - space/2 + 2*extrusion_width+0.1,2*extrusion_width + 2.4 + 2*extrusion_width,0]) rotate([0,0,-180]) cube([2.5,2*extrusion_width,height]);
	translate([width/2 + space/2 - 2*extrusion_width-0.1,2*extrusion_width + 2.4,0]) cube([2.5,2*extrusion_width,height]);
	}
	// Seriznuti "pacicek"
	translate([0,2*extrusion_width,-0.1]) rotate([0,0,57]) cube([width,width,width]);
	translate([width,2*extrusion_width,-0.1]) rotate([0,0,33]) cube([width,width,width]);
}	
