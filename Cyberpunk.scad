$fn = 120;

// REACTOR CORE
module reactor() {
    color("cyan")
    sphere(r=20);
}

// ENERGY RINGS
module rings() {
    for (i = [0:4]) {
        rotate([0,0,i*25])
        translate([0,0,i*6])
        color("purple")
        torus(35 + i*3, 1);
    }
}

// SPIKES (NETWORK NODES)
module spikes() {
    for (i = [0:15:345]) {
        rotate([0,0,i])
        translate([55,0,0])
        color("magenta")
        cylinder(h=20, r=2);
    }
}

// OUTER SHELL
difference() {
    sphere(r=70);
    sphere(r=65);
}

reactor();
rings();
spikes();
