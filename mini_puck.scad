// Create a half-pyramid from a single linear extrusion
module halfpyramid(base, height) {
   linear_extrude(height, scale=0.01)
      translate([-base/2, 0, 0]) square([base, base/2]);
}

halfpyramid(20, 10);