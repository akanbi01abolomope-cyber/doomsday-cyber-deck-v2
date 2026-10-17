// Doomsday Cyberdeck switch faceplate — REV A prototype
// Units mm. Assumed cutouts only; check selected switch datasheets before final print.
$fn=72;
panel_w=180; panel_h=45; panel_t=3; corner_r=4; mount_d=3.2;
module rounded_plate_2d(w,h,r){ offset(r=r) offset(delta=-r) square([w,h]); }
difference(){
  linear_extrude(height=panel_t) rounded_plate_2d(panel_w,panel_h,corner_r);
  for(x=[7,panel_w-7],y=[7,panel_h-7]) translate([x,y,-0.1]) cylinder(d=mount_d,h=panel_t+0.2);
  // Guarded toggle assumed 12.2 mm hole
  translate([35,22.5,-0.1]) cylinder(d=12.2,h=panel_t+0.2);
  // Rocker assumed 19 x 13 mm rectangle
  translate([90-19/2,22.5-13/2,-0.1]) cube([19,13,panel_t+0.2]);
  // Momentary pushbutton assumed 16.2 mm hole
  translate([145,22.5,-0.1]) cylinder(d=16.2,h=panel_t+0.2);
}
