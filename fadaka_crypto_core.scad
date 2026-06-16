$fn = 80;

// =======================
// BASE CORE (IDENTITY)
// =======================
module core() {
    color("cyan")
    sphere(r=18);
}

// =======================
// KMS RING (PROCESSING)
// =======================
module kms_ring() {
    difference() {
        color("gold")
        cylinder(h=10, r=35, center=true);

        cylinder(h=12, r=28, center=true);
    }
}

// =======================
// NODE FRAME (P2P LAYER)
// =======================
module node_frame() {
    for (i = [0:60:300]) {
        rotate([0,0,i])
        translate([45,0,0])
        color("magenta")
        cylinder(h=6, r=4, center=true);
    }
}

// =======================
// OUTER SHELL (SECURE CASING)
// =======================
module shell() {
    difference() {
        color("gray")
        sphere(r=55);

        sphere(r=50);
    }
}

// =======================
// STATUS PINS (LED STYLE)
// =======================
module pins() {
    for (i = [0:90:270]) {
        rotate([0,0,i])
        translate([30,0,20])
        color("lime")
        cube([3,3,10], center=true);
    }
}

// =======================
// FINAL ASSEMBLY
// =======================
union() {

    // Outer protective shell
    shell();

    // P2P network frame
    node_frame();

    // KMS processing layer
    kms_ring();

    // Identity core
    core();

    // Status indicators
    pins();
}
