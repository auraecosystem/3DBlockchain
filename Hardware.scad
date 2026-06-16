$fn = 80;

// ======================
// PARAMETERS
// ======================
core_r = 18;
shell_r = 60;

// ======================
// INNER IDENTITY CORE
// ======================
module identity_core() {
    color("cyan")
    sphere(r=core_r);
}

// ======================
// KMS RING
// ======================
module kms_ring() {
    difference() {
        color("gold")
        cylinder(h=12, r=38, center=true);
        cylinder(h=14, r=30, center=true);
    }
}

// ======================
// PCB PLATFORM (FLAT BASE)
// ======================
module pcb_base() {
    translate([0,0,-25])
    color("green")
    cube([70,70,6], center=true);
}

// ======================
// LED NODE RING
// ======================
module led_ring() {
    for (i = [0:45:315]) {
        rotate([0,0,i])
        translate([45,0,10])
        color("red")
        cube([4,4,8], center=true);
    }
}

// ======================
// OUTER SHELL (SPLIT HALVES)
// ======================
module shell_half(z) {
    intersection() {
        translate([0,0,z])
        sphere(r=shell_r);

        translate([0,0,z])
        cube([120,120,120], center=true);
    }
}

// ======================
// ASSEMBLY
// ======================
union() {

    // base electronics platform
    pcb_base();

    // identity core
    identity_core();

    // kms processing ring
    kms_ring();

    // LED network indicators
    led_ring();

    // shell bottom half
    shell_half(-20);

    // shell top half
    shell_half(20);
}
