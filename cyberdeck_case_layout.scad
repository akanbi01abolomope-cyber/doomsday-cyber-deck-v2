// Doomsday Cyberdeck modular internal tray / layout CAD — REV A
// Units mm. Designed as a layout and mounting-tray prototype, NOT a whole case or final fit.
// Set show_layout=false to export only the flat mounting plate. Verify purchased component dimensions.
$fn=48;
plate_w=340; plate_d=230; plate_t=4; corner_r=6;
show_layout=true;
module round_plate(w,d,t,r){ linear_extrude(height=t) offset(r=r) offset(delta=-r) square([w,d]); }
module plate(){
 difference(){
  round_plate(plate_w,plate_d,plate_t,corner_r);
  // perimeter mounting holes for tray attachment
  for(x=[12,plate_w-12],y=[12,plate_d-12]) translate([x,y,-.1]) cylinder(d=4.2,h=plate_t+.2);
  // general-purpose cable tie slots around component bays
  for(x=[100,125,150,175,200,225,250], y=[48,180]) translate([x,y,-.1]) hull(){translate([-4,0,0]) cylinder(d=3,h=plate_t+.2);translate([4,0,0]) cylinder(d=3,h=plate_t+.2);}
 }
}
module pi_mount(){
 // Raspberry Pi 5 nominal board envelope 85 x 56 mm; 58 x 49 mm mounting-hole pattern assumption.
 translate([20,plate_d-75,plate_t]) { color("darkgreen") cube([85,56,2]); for(x=[13.5,71.5],y=[3.5,52.5]) translate([x,y,-1]) color("silver") cylinder(d=2.75,h=7); }
}
module keyboard_envelope(){ translate([28,20,plate_t]) color("dimgray") cube([270,105,12]); }
module display_bezel(){
 // Separate flat bezel for a generic 7-inch HDMI screen; opening must be redrawn to selected display's active area.
 translate([plate_w+12,0,0]) difference(){
  round_plate(190,130,3,4);
  translate([8,8,-.1]) cube([174,114,3.2]);
  for(x=[7,183],y=[7,123]) translate([x,y,-.1]) cylinder(d=3.2,h=3.2);
 }
}
module switch_panel(){ translate([plate_w+12,145,0]) difference(){
  round_plate(180,45,3,4);
  for(x=[7,173],y=[7,38]) translate([x,y,-.1]) cylinder(d=3.2,h=3.2);
  translate([35,22.5,-.1]) cylinder(d=12.2,h=3.2);
  translate([80.5,16,-.1]) cube([19,13,3.2]);
  translate([145,22.5,-.1]) cylinder(d=16.2,h=3.2);
 }}
if(show_layout){ plate(); pi_mount(); keyboard_envelope(); display_bezel(); switch_panel(); } else plate();
