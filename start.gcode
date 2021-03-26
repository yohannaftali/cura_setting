; Script based on an original created by tjjfvi (https://github.com/tjjfvi)
; An up-to-date version of the tjjfvi's original script can be found
; here:  https://csi.t6.fyi/
; Note - This script will only work in Cura V4.2 and above!
; --- Global Settings
; layer_height = {layer_height}
; smooth_spiralized_contours = {smooth_spiralized_contours}
; magic_mesh_surface_mode = {magic_mesh_surface_mode}
; machine_extruder_count = {machine_extruder_count}
; --- Single Extruder Settings
; speed_z_hop = {speed_z_hop}
; retraction_amount = {retraction_amount}
; retraction_hop = {retraction_hop}
; retraction_hop_enabled = {retraction_hop_enabled}
; retraction_enable = {retraction_enable}
; retraction_speed = {retraction_speed}
; retraction_retract_speed = {retraction_retract_speed}
; retraction_prime_speed = {retraction_prime_speed}
; speed_travel = {speed_travel}

M420 S ;Enable ABL using saved Mesh

M150 B30
M117 Preparing...

G21 ; set units to Millimetres
G90 ; absolute positioning

M117 Start heating Bed...
M140 S{material_bed_temperature} ; heat bed, nonblocking

; start melody
M300 S294 P220 ;N1 D4 1/8
M300 S20000 P20
M300 S311 P220 ;N2 D#4 1/8
M300 S20000 P20
M300 S330 P220 ;N3 E4 1/8
M300 S20000 P20
M300 S523 P460 ;N4 C5 1/4
M300 S20000 P20
M300 S330 P220 ;N5 E4 1/8
M300 S20000 P20
M300 S523 P230 ;N6 C5 1/8
M300 S20000 P10
M300 S330 P220 ;N7 E4 1/8
M300 S20000 P20
M300 S523 P230 ;N8 C5 1/8
M300 S20000 P10
M300 S523 P950 ;N9 C5 1/2
M300 S20000 P10
M300 S523 P220 ;N10 C5 1/8
M300 S20000 P20
M300 S523 P220 ;N11 C5 1/8
M300 S20000 P20
M300 S587 P220 ;N12 D5 1/8
M300 S20000 P20
M300 S622 P220 ;N13 D#5 1/8
M300 S20000 P20
M300 S659 P220 ;N14 E5 1/8
M300 S20000 P20
M300 S523 P220 ;N15 C5 1/8
M300 S20000 P20
M300 S587 P220 ;N16 D5 1/8
M300 S20000 P20
M300 S659 P230 ;N17 E5 1/8
M300 S20000 P10
M300 S659 P230 ;N11 E5 1/8
M300 S20000 P10
M300 S494 P220 ;N19 B4 1/8
M300 S20000 P20
M300 S587 P460 ;N20 D5 1/2
M300 S20000 P20
M300 S523 P1420; C5 1/2+1/4
M300 S20000 P20
M300 S20000 P1920; pause one measure

M150 U45
M117 Start heating Hotend...
M104 S{material_print_temperature} ; heat hotend in parallel ;

M190 S{material_bed_temperature} ; heat bed, blocking

M117 Autohome...
M117 Home All Axes...

M300 S440 P200
M300 S660 P250
M300 S880 P300

G28 ; Home all axes
M82 ; set extruder to absolute mode
G92 E0 ; set extruder position to 0
M420 S1 ; Enable ABL using saved Mesh

M150 R45
M117 Continue Heating hot end...

M109 S{material_print_temperature} ; heat hot end, blocking

M150 R255

M300 S440 P200
M300 S660 P250
M300 S880 P300
M300 S440 P200
M300 S660 P250
M300 S880 P300

M117 Draw 2 lines...

G1 Z5.0 F3000 ; Move Z Axis up little to prevent scratching of Heat Bed
G1 X0.1 Y20 Z0.3 F5000.0 ; Move to start position
G1 X0.1 Y200.0 Z0.3 F1500.0 E15 ; Draw the first line
G1 X0.4 Y200.0 Z0.3 F5000.0 ; Move to side a little
G1 X0.4 Y20 Z0.3 F1500.0 E30 ; Draw the second line
G92 E0 ; Reset Extruder
G1 Z5.0 F3000 ; Move Z Axis up little to prevent scratching of Heat Bed
G1 X5 Y20 Z0.3 F5000.0 ; Move over to prevent blob squish

;FinalFan
M300 S987 P150
M300 S0 P75
M300 S880 P150
M300 S0 P75
M300 S987 P150
M300 S0 P75
M300 S880 P75
M300 S2349 P150
M300 S0 P75
M300 S2349 P75
M300 S2217 P150
M300 S0 P75
M300 S2349 P75
M300 S2217 P300
M300 S987 P150
M300 S0 P75
M300 S880 P150
M300 S0 P75
M300 S1661 P150
M300 S0 P75
M300 S880 P75
M300 S1479 P300
M300 S0 P600
M300 S987 P150
M300 S0 P75
M300 S880 P150
M300 S0 P75
M300 S987 P150
M300 S0 P75
M300 S880 P75
M300 S2349 P150
M300 S0 P75
M300 S2349 P75
M300 S2217 P150
M300 S0 P75
M300 S2349 P75
M300 S2217 P300
M300 S987 P150
M300 S0 P75
M300 S880 P150
M300 S0 P75
M300 S987 P150
M300 S0 P75
M300 S2349 P75
M300 S2637 P300
M300 S0 P300

M150 B60
M117 Printing...
