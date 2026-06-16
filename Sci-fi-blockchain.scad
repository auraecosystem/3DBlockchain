$fn = 120;

// glowing reactor core
module reactor() {
    color("cyan")
    sphere(r=22);
}

// energy rings
module energy_rings() {
    for (i = [0:3]) {
        rotate([0,0,i*30])
        translate([0,0,i*5])
        color("purple")
        torus(35 + i*5, 1.2);
    }
}

// node spikes
module spikes() {
    for (i = [0:20:340]) {
        rotate([0,0,i])
        translate([50,0,0])
        color("magenta")
        cylinder(h=15, r=2);
    }
}

// outer reactor shell
module shell() {
    difference() {
        color("gray")
        sphere(r=65);
        sphere(r=60);
    }
}

union() {
    shell();
    energy_rings();
    spikes();
    reactor();
}
