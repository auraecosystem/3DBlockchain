$fn = 80;

// =========================
// CENTRAL CORE (UI HEART)
// =========================
module core() {
    color("cyan")
    sphere(r=18);
}

// =========================
// ORBIT RINGS (UI LAYERS)
// =========================
module rings() {
    for (i = [0:2]) {
        rotate([0,0,i*20])
        translate([0,0,i*6])
        color("purple")
        torus(35 + i*6, 1.2);
    }
}

// =========================
// NODE TOWERS (UI BLOCKS)
// =========================
module nodes() {
    for (i = [0:60:300]) {
        rotate([0,0,i])
        translate([50,0,0])
        color("magenta")
        cube([6,6,18], center=true);
    }
}

// =========================
// DATA BRIDGES (CONNECTION LINES)
// =========================
module bridges() {
    for (i = [0:90:270]) {
        rotate([0,0,i])
        translate([25,0,10])
        color("white")
        cube([40,2,2], center=true);
    }
}

// =========================
// BASE PLATFORM (UI SCREEN)
// =========================
module base() {
    translate([0,0,-30])
    color("gray")
    cylinder(h=6, r=65, center=true);
}

// =========================
// FINAL ASSEMBLY
// =========================
union() {

    base();
    core();
    rings();
    nodes();
    bridges();

}
