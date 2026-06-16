$fn = 100;

// ===== PARAMETERS =====
r_outer = 65;
r_inner = 25;

// ===== OUTER SHELL =====
module shell() {
    difference() {
        sphere(r = r_outer);
        sphere(r = r_outer - 5);
    }
}

// ===== INNER CORE CHAMBER =====
module core() {
    color("cyan")
    sphere(r = r_inner);
}

// ===== PCB HOLDER PLATFORM =====
module pcb_holder() {
    translate([0,0,-30])
    cube([80,80,6], center=true);
}

// ===== LED RING HOLES =====
module led_holes() {
    for (i = [0:30:330]) {
        rotate([0,0,i])
        translate([45,0,0])
        cylinder(h=10, r=3);
    }
}

// ===== FULL ASSEMBLY =====
difference() {
    union() {
        shell();
        pcb_holder();
        core();
    }

    led_holes();
}
