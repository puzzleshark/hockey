$fn = 100; // Smoothness

module hockey_puck(diameter = 25, height = 12, chamfer = 1) {
    difference() {
        cylinder(d = diameter, h = height, center = true);
        // Chamfer bottom
        translate([0, 0, -height/2]) 
            cylinder(d1 = diameter, d2 = diameter - 2*chamfer, h = chamfer, center = false);
        // Chamfer top
        translate([0, 0, height/2 - chamfer]) 
            cylinder(d1 = diameter - 2*chamfer, d2 = diameter, h = chamfer, center = false);
    }
}

hockey_puck();