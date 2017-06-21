sirka = 98.5;
vyska = 25;
hloubka = 48;
tloustka_steny = 2;
plech_tloustka = 2;

pruchodka = 12;

module power_base(){
    cube([sirka,hloubka,vyska]);
    translate([0+plech_tloustka,0,vyska]) cube([sirka-2*plech_tloustka,23,15.5]);
}

module power_cuts(){
    translate([tloustka_steny,tloustka_steny,tloustka_steny]) cube([sirka-2*tloustka_steny,hloubka-2*tloustka_steny,vyska-3*tloustka_steny]);
    translate([tloustka_steny,23,vyska-2*tloustka_steny]) cube([sirka-2*tloustka_steny,hloubka-23-tloustka_steny,2*tloustka_steny]);
    translate([2*tloustka_steny,tloustka_steny,vyska-2*tloustka_steny]) cube([sirka-4*tloustka_steny,hloubka-23-tloustka_steny,16+2*tloustka_steny]);

    // otvor naboku
    translate([0,24,vyska-22.5]) cube([tloustka_steny,hloubka-24-tloustka_steny,22.5]);

    translate([14,31,0]) cylinder(r=4,h=vyska,$fn=16,center=true);
    translate([50,31,0]) cylinder(r=4,h=vyska,$fn=16,center=true);
    translate([14,31-4,0]) cube([36,4*2,vyska]);

    // otvor pre priechodku
    translate([sirka-tloustka_steny-2-pruchodka/2,tloustka_steny+2+pruchodka/2,0]) cylinder(r=pruchodka/2,h=vyska,$fn=16,center=true);

    // otvory pre sroby
    translate([sirka/2,17,vyska+8]) rotate([0,90,0])cylinder(r=3/2,h=sirka,$fn=16,center=true);    
  
    translate([tloustka_steny,tloustka_steny,vyska-2*tloustka_steny]) rotate([0,45,0])cube([sqrt(tloustka_steny*tloustka_steny),23-tloustka_steny,sqrt(2*tloustka_steny*tloustka_steny)]);
    translate([sirka-3*tloustka_steny,tloustka_steny,vyska-2*tloustka_steny]) rotate([0,45,0])cube([sqrt(2*tloustka_steny*tloustka_steny),23-tloustka_steny,sqrt(2*tloustka_steny*tloustka_steny)]);

    translate([sirka-3*tloustka_steny,16,vyska-2.5]) rotate([0,45,0])cube([sqrt(2*tloustka_steny*tloustka_steny),12.5,sqrt(2*tloustka_steny*tloustka_steny)]);

    //otvor pre vypinac
    translate([sirka-2*tloustka_steny,16,(vyska-20)/2]) cube([2*tloustka_steny,12.5,20]);
}

module drzak_matky_base()
{
    translate([2*tloustka_steny+2.5/2,17,vyska+8]) rotate([0,90,0]) cylinder(r1=12/2,r2=10/2,h=2.5,$fn=12,center=true);

    translate([sirka-(2*tloustka_steny+2.5/2),17,vyska+8]) rotate([0,90,0]) cylinder(r1=10/2,r2=12/2,h=2.5,$fn=12,center=true);
}

module drzak_matky_cuts()
{
    translate([2*tloustka_steny+2.5/2+1,17,vyska+8]) rotate([0,90,0]) cylinder(r=6.6/2,h=5,$fn=6,center=true);
    translate([sirka-(2*tloustka_steny+2.5/2+1),17,vyska+8]) rotate([0,90,0]) cylinder(r=6.6/2,h=5,$fn=6,center=true);
}

module drzak_kabelu_base()
{
    difference(){
        translate([sirka-tloustka_steny-17.5,tloustka_steny/2,tloustka_steny+2]) cube([18,4,9.5]);
        translate([sirka,2,4]) rotate([0,45,90])cube([sqrt(2*4*4),23-tloustka_steny,sqrt(2*4*4)]);
    }
}

module drzak_kabelu_cuts()
{
    translate([sirka-tloustka_steny-2-pruchodka/2,9+tloustka_steny/2,tloustka_steny+2+6]) difference(){
    rotate([0,0,0]) cylinder(r=9,h=3,$fn=32,center=true);
      rotate([0,0,0]) cylinder(r=7,h=4,$fn=32,center=true);
  }
}

module drzak_matky(){
    difference(){
        drzak_matky_base();
        drzak_matky_cuts();
    }
}

module drzak_kabelu(){
    difference(){
        drzak_kabelu_base();
        drzak_kabelu_cuts();
    }
}

module kryt_zdroje(){
	difference(){
	  power_base();
	  power_cuts();
	}
}

module kryt(){
    kryt_zdroje();
    drzak_matky();
    drzak_kabelu();
}

kryt();