
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental C:/Users/amsin/Desktop/project_1/project_1.srcs/utils_1/imports/synth_1/vga_top.dcpZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2U
SC:/Users/amsin/Desktop/project_1/project_1.srcs/utils_1/imports/synth_1/vga_top.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
c
Command: %s
53*	vivadotcl22
0synth_design -top vga_top -part xc7a100tcsg324-1Z4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
{
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2

xc7a100tZ17-347h px� 
k
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2

xc7a100tZ17-349h px� 
E
Loading part %s157*device2
xc7a100tcsg324-1Z21-403h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
M
#Helper process launched with PID %s4824*oasys2
8980Z8-7075h px� 
�
%s*synth2{
yStarting RTL Elaboration : Time (s): cpu = 00:00:03 ; elapsed = 00:00:04 . Memory (MB): peak = 1043.637 ; gain = 469.535
h px� 
�
.identifier '%s' is used before its declaration4750*oasys2
	TILE_SIZE2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
1098@Z8-6901h px� 
�
.identifier '%s' is used before its declaration4750*oasys2
	TILE_SIZE2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
1098@Z8-6901h px� 
�
.identifier '%s' is used before its declaration4750*oasys2
	TILE_SIZE2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
1098@Z8-6901h px� 
�
synthesizing module '%s'%s4497*oasys2	
vga_top2
 2+
'C:/Users/amsin/Desktop/src/A7_vga_top.v2
248@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
display_controller2
 23
/C:/Users/amsin/Desktop/src/display_controller.v2
248@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
display_controller2
 2
02
123
/C:/Users/amsin/Desktop/src/display_controller.v2
248@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
vga_bitchange2
 2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
278@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
ground_tile2
 22
.C:/Users/amsin/Desktop/src/tiles_sprite_load.v2
88@Z8-6157h px� 
�
,$readmem data file '%s' is read successfully3426*oasys2
./tiles/24x24_ground.mem22
.C:/Users/amsin/Desktop/src/tiles_sprite_load.v2
188@Z8-3876h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
ground_tile2
 2
02
122
.C:/Users/amsin/Desktop/src/tiles_sprite_load.v2
88@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
mario_idle_right2
 22
.C:/Users/amsin/Desktop/src/mario_sprite_load.v2
838@Z8-6157h px� 
�
,$readmem data file '%s' is read successfully3426*oasys2*
(./32x32_mario/32x32_mario_idle_right.mem22
.C:/Users/amsin/Desktop/src/mario_sprite_load.v2
938@Z8-3876h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
mario_idle_right2
 2
02
122
.C:/Users/amsin/Desktop/src/mario_sprite_load.v2
838@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
mario_idle_left2
 22
.C:/Users/amsin/Desktop/src/mario_sprite_load.v2
1028@Z8-6157h px� 
�
,$readmem data file '%s' is read successfully3426*oasys2)
'./32x32_mario/32x32_mario_idle_left.mem22
.C:/Users/amsin/Desktop/src/mario_sprite_load.v2
1128@Z8-3876h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
mario_idle_left2
 2
02
122
.C:/Users/amsin/Desktop/src/mario_sprite_load.v2
1028@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
mario_walk_right2
 22
.C:/Users/amsin/Desktop/src/mario_sprite_load.v2
648@Z8-6157h px� 
�
,$readmem data file '%s' is read successfully3426*oasys2*
(./32x32_mario/32x32_mario_walk_right.mem22
.C:/Users/amsin/Desktop/src/mario_sprite_load.v2
748@Z8-3876h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
mario_walk_right2
 2
02
122
.C:/Users/amsin/Desktop/src/mario_sprite_load.v2
648@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
mario_walk_left2
 22
.C:/Users/amsin/Desktop/src/mario_sprite_load.v2
458@Z8-6157h px� 
�
,$readmem data file '%s' is read successfully3426*oasys2)
'./32x32_mario/32x32_mario_walk_left.mem22
.C:/Users/amsin/Desktop/src/mario_sprite_load.v2
558@Z8-3876h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
mario_walk_left2
 2
02
122
.C:/Users/amsin/Desktop/src/mario_sprite_load.v2
458@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
mario_jump_left2
 22
.C:/Users/amsin/Desktop/src/mario_sprite_load.v2
268@Z8-6157h px� 
�
,$readmem data file '%s' is read successfully3426*oasys2)
'./32x32_mario/32x32_mario_jump_left.mem22
.C:/Users/amsin/Desktop/src/mario_sprite_load.v2
368@Z8-3876h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
mario_jump_left2
 2
02
122
.C:/Users/amsin/Desktop/src/mario_sprite_load.v2
268@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
mario_jump_right2
 22
.C:/Users/amsin/Desktop/src/mario_sprite_load.v2
78@Z8-6157h px� 
�
,$readmem data file '%s' is read successfully3426*oasys2*
(./32x32_mario/32x32_mario_jump_right.mem22
.C:/Users/amsin/Desktop/src/mario_sprite_load.v2
178@Z8-3876h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
mario_jump_right2
 2
02
122
.C:/Users/amsin/Desktop/src/mario_sprite_load.v2
78@Z8-6155h px� 
�
evariable '%s' is written by both blocking and non-blocking assignments, entire logic could be removed4426*oasys2

jumpWait2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
2638@Z8-6090h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
vga_bitchange2
 2
02
12.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
278@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2	
counter2
 2(
$C:/Users/amsin/Desktop/src/counter.v2
218@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2	
counter2
 2
02
12(
$C:/Users/amsin/Desktop/src/counter.v2
218@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2	
vga_top2
 2
02
12+
'C:/Users/amsin/Desktop/src/A7_vga_top.v2
248@Z8-6155h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
sprite_pixel_color_reg2
vga_bitchange2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
1718@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
marioDirection_reg2
vga_bitchange2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
1708@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
marioSpeed_reg2
vga_bitchange2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
1848@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
movement_counter_reg2
vga_bitchange2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
1898@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
walkAnimation_reg2
vga_bitchange2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
1958@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
jumpWait_reg2
vga_bitchange2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
2378@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
jumpSpeed_reg2
vga_bitchange2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
2498@Z8-7137h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
score2
vga_bitchange2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
368@Z8-3848h px� 
d
+design %s has port %s driven by constant %s3447*oasys2	
vga_top2
An42
1Z8-3917h px� 
d
+design %s has port %s driven by constant %s3447*oasys2	
vga_top2
An52
1Z8-3917h px� 
d
+design %s has port %s driven by constant %s3447*oasys2	
vga_top2
An62
1Z8-3917h px� 
d
+design %s has port %s driven by constant %s3447*oasys2	
vga_top2
An72
1Z8-3917h px� 
c
+design %s has port %s driven by constant %s3447*oasys2	
vga_top2
Dp2
1Z8-3917h px� 
o
+design %s has port %s driven by constant %s3447*oasys2	
vga_top2
QuadSpiFlashCS2
1Z8-3917h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
	score[15]2
vga_bitchangeZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
	score[14]2
vga_bitchangeZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
	score[13]2
vga_bitchangeZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
	score[12]2
vga_bitchangeZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
	score[11]2
vga_bitchangeZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
	score[10]2
vga_bitchangeZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

score[9]2
vga_bitchangeZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

score[8]2
vga_bitchangeZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

score[7]2
vga_bitchangeZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

score[6]2
vga_bitchangeZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

score[5]2
vga_bitchangeZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

score[4]2
vga_bitchangeZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

score[3]2
vga_bitchangeZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

score[2]2
vga_bitchangeZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

score[1]2
vga_bitchangeZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

score[0]2
vga_bitchangeZ8-7129h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:04 ; elapsed = 00:00:05 . Memory (MB): peak = 1158.059 ; gain = 583.957
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:04 ; elapsed = 00:00:05 . Memory (MB): peak = 1158.059 ; gain = 583.957
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:04 ; elapsed = 00:00:05 . Memory (MB): peak = 1158.059 ; gain = 583.957
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0082

1158.0592
0.000Z17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
m
Parsing XDC File [%s]
179*designutils2,
(C:/Users/amsin/Desktop/src/A7_nexys7.xdc8Z20-179h px� 
�
No ports matched '%s'.
584*	planAhead2
RamCS2,
(C:/Users/amsin/Desktop/src/A7_nexys7.xdc2
1138@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2,
(C:/Users/amsin/Desktop/src/A7_nexys7.xdc2
1138@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
RamCS2,
(C:/Users/amsin/Desktop/src/A7_nexys7.xdc2
1148@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2,
(C:/Users/amsin/Desktop/src/A7_nexys7.xdc2
1148@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
MemOE2,
(C:/Users/amsin/Desktop/src/A7_nexys7.xdc2
1168@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2,
(C:/Users/amsin/Desktop/src/A7_nexys7.xdc2
1168@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
MemOE2,
(C:/Users/amsin/Desktop/src/A7_nexys7.xdc2
1178@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2,
(C:/Users/amsin/Desktop/src/A7_nexys7.xdc2
1178@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
MemWR2,
(C:/Users/amsin/Desktop/src/A7_nexys7.xdc2
1198@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2,
(C:/Users/amsin/Desktop/src/A7_nexys7.xdc2
1198@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
MemWR2,
(C:/Users/amsin/Desktop/src/A7_nexys7.xdc2
1208@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2,
(C:/Users/amsin/Desktop/src/A7_nexys7.xdc2
1208@Z17-55h px�
v
Finished Parsing XDC File [%s]
178*designutils2,
(C:/Users/amsin/Desktop/src/A7_nexys7.xdc8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2*
(C:/Users/amsin/Desktop/src/A7_nexys7.xdc2
.Xil/vga_top_propImpl.xdcZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1247.3202
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
 Constraint Validation Runtime : 2

00:00:002
00:00:00.0032

1247.3202
0.000Z17-268h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:09 ; elapsed = 00:00:11 . Memory (MB): peak = 1247.320 ; gain = 673.219
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
%s
*synth2,
*Start Loading Part and Timing Information
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Loading part: xc7a100tcsg324-1
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:09 ; elapsed = 00:00:11 . Memory (MB): peak = 1247.320 ; gain = 673.219
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
%s
*synth20
.Start Applying 'set_property' XDC Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:09 ; elapsed = 00:00:11 . Memory (MB): peak = 1247.320 ; gain = 673.219
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:10 ; elapsed = 00:00:11 . Memory (MB): peak = 1247.320 ; gain = 673.219
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Detailed RTL Component Info : 
h p
x
� 
(
%s
*synth2
+---Adders : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   50 Bit       Adders := 4     
h p
x
� 
F
%s
*synth2.
,	   2 Input   32 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   3 Input   11 Bit       Adders := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input   10 Bit       Adders := 7     
h p
x
� 
F
%s
*synth2.
,	   2 Input    7 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   3 Input    5 Bit       Adders := 2     
h p
x
� 
+
%s
*synth2
+---Registers : 
h p
x
� 
H
%s
*synth20
.	               50 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	               12 Bit    Registers := 4     
h p
x
� 
H
%s
*synth20
.	               10 Bit    Registers := 3     
h p
x
� 
H
%s
*synth20
.	                7 Bit    Registers := 7     
h p
x
� 
H
%s
*synth20
.	                2 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	                1 Bit    Registers := 7     
h p
x
� 
&
%s
*synth2
+---ROMs : 
h p
x
� 
>
%s
*synth2&
$	                    ROMs := 6     
h p
x
� 
'
%s
*synth2
+---Muxes : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   50 Bit        Muxes := 8     
h p
x
� 
F
%s
*synth2.
,	 577 Input   12 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   12 Bit        Muxes := 6     
h p
x
� 
F
%s
*synth2.
,	   2 Input   10 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	   2 Input    7 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   4 Input    4 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    2 Bit        Muxes := 18    
h p
x
� 
F
%s
*synth2.
,	   2 Input    1 Bit        Muxes := 13    
h p
x
� 
F
%s
*synth2.
,	   5 Input    1 Bit        Muxes := 1     
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Finished RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
q
%s
*synth2Y
WPart Resources:
DSPs: 240 (col length:80)
BRAMs: 270 (col length: RAMB18 80 RAMB36 40)
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
E
%s
*synth2-
+Start Cross Boundary and Area Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
d
+design %s has port %s driven by constant %s3447*oasys2	
vga_top2
An42
1Z8-3917h px� 
d
+design %s has port %s driven by constant %s3447*oasys2	
vga_top2
An52
1Z8-3917h px� 
d
+design %s has port %s driven by constant %s3447*oasys2	
vga_top2
An62
1Z8-3917h px� 
d
+design %s has port %s driven by constant %s3447*oasys2	
vga_top2
An72
1Z8-3917h px� 
c
+design %s has port %s driven by constant %s3447*oasys2	
vga_top2
Dp2
1Z8-3917h px� 
o
+design %s has port %s driven by constant %s3447*oasys2	
vga_top2
QuadSpiFlashCS2
1Z8-3917h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
	score[15]2
vga_bitchangeZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
	score[14]2
vga_bitchangeZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
	score[13]2
vga_bitchangeZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
	score[12]2
vga_bitchangeZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
	score[11]2
vga_bitchangeZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
	score[10]2
vga_bitchangeZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

score[9]2
vga_bitchangeZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

score[8]2
vga_bitchangeZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

score[7]2
vga_bitchangeZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

score[6]2
vga_bitchangeZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

score[5]2
vga_bitchangeZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

score[4]2
vga_bitchangeZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

score[3]2
vga_bitchangeZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

score[2]2
vga_bitchangeZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

score[1]2
vga_bitchangeZ8-7129h px� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2

score[0]2
vga_bitchangeZ8-7129h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
vbc/posX_reg[9]/Q2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
2968@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
2968@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
2968@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
vbc/posX_reg[6]/Q2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
2968@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
2968@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
2968@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
vbc/posX_reg[4]/Q2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
2968@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
2968@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
2968@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
vbc/posX_reg[3]/Q2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
2968@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
VCC2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
2968@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
2968@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
vbc/posX_reg[2]/Q2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
2968@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
VCC2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
2968@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
2968@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
vbc/posX_reg[1]/Q2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
2968@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
2968@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
2968@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
vbc/posX_reg[0]/Q2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
2968@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
2968@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
2968@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
vbc/posX_reg[8]__0/Q2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
778@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
VCC2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
778@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
778@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
vbc/posX_reg[7]__0/Q2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
778@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
778@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
778@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st2
vbc/posX_reg[5]__0/Q2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
778@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
VCC2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
778@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2.
*C:/Users/amsin/Desktop/src/vga_bitchange.v2
778@Z8-6858h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[49]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[49]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[48]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[48]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[47]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[47]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[46]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[46]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[45]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[45]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[44]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[44]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[43]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[43]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[42]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[42]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[41]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[41]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[40]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[40]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[39]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[39]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[38]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[38]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[37]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[37]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[36]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[36]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[35]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[35]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[34]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[34]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[33]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[33]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[32]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[32]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[31]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[31]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[30]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[30]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[29]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[29]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[28]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[28]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[27]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[27]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[26]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[26]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[25]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[25]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[24]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[24]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[23]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[23]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[22]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[22]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[21]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[21]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[20]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[20]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[19]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[19]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[18]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[18]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[17]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[17]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[16]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[16]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[15]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[15]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[14]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[14]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[13]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[13]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[12]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[12]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[11]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[11]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[10]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[10]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[9]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[9]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[8]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[8]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[7]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[7]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[6]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[6]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[5]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[5]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[4]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[4]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[3]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[3]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[2]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[2]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[1]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[1]_C2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[0]_LDC2
vga_bitchangeZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
jumpWait_reg[0]_C2
vga_bitchangeZ8-3332h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2
Synth 8-33322
100Z17-14h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:14 ; elapsed = 00:00:16 . Memory (MB): peak = 1247.320 ; gain = 673.219
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Start ROM, RAM, DSP, Shift Register and Retiming Reporting
h px� 
l
%s*synth2T
R---------------------------------------------------------------------------------
h px� 
;
%s*synth2#
!
ROM: Preliminary Mapping Report
h px� 
r
%s*synth2Z
X+--------------+-------------------------------------+---------------+----------------+
h px� 
s
%s*synth2[
Y|Module Name   | RTL Object                          | Depth x Width | Implemented As | 
h px� 
r
%s*synth2Z
X+--------------+-------------------------------------+---------------+----------------+
h px� 
s
%s*synth2[
Y|vga_bitchange | marioWalkLeftSprite/pixel_data_reg  | 1024x7        | Block RAM      | 
h px� 
s
%s*synth2[
Y|vga_bitchange | marioWalkRightSprite/pixel_data_reg | 1024x7        | Block RAM      | 
h px� 
s
%s*synth2[
Y|vga_bitchange | marioJumpLeftSprite/pixel_data_reg  | 1024x7        | Block RAM      | 
h px� 
s
%s*synth2[
Y|vga_bitchange | marioJumpRightSprite/pixel_data_reg | 1024x7        | Block RAM      | 
h px� 
s
%s*synth2[
Y|vga_bitchange | marioIdleRightSprite/pixel_data_reg | 1024x7        | Block RAM      | 
h px� 
s
%s*synth2[
Y|vga_bitchange | marioIdleLeftSprite/pixel_data_reg  | 1024x7        | Block RAM      | 
h px� 
s
%s*synth2[
Y+--------------+-------------------------------------+---------------+----------------+

h px� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Finished ROM, RAM, DSP, Shift Register and Retiming Reporting
h px� 
l
%s*synth2T
R---------------------------------------------------------------------------------
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
@
%s
*synth2(
&Start Applying XDC Timing Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:18 ; elapsed = 00:00:20 . Memory (MB): peak = 1351.070 ; gain = 776.969
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
4
%s
*synth2
Start Timing Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2
}Finished Timing Optimization : Time (s): cpu = 00:00:19 ; elapsed = 00:00:21 . Memory (MB): peak = 1400.262 ; gain = 826.160
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
3
%s
*synth2
Start Technology Mapping
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2(
&vbc/marioWalkLeftSprite/pixel_data_reg2
BlockZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2)
'vbc/marioWalkRightSprite/pixel_data_reg2
BlockZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2(
&vbc/marioJumpLeftSprite/pixel_data_reg2
BlockZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2)
'vbc/marioJumpRightSprite/pixel_data_reg2
BlockZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2)
'vbc/marioIdleRightSprite/pixel_data_reg2
BlockZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2(
&vbc/marioIdleLeftSprite/pixel_data_reg2
BlockZ8-7052h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2~
|Finished Technology Mapping : Time (s): cpu = 00:00:19 ; elapsed = 00:00:21 . Memory (MB): peak = 1407.137 ; gain = 833.035
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
-
%s
*synth2
Start IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
?
%s
*synth2'
%Start Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
B
%s
*synth2*
(Finished Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2y
wFinished IO Insertion : Time (s): cpu = 00:00:21 ; elapsed = 00:00:24 . Memory (MB): peak = 1583.168 ; gain = 1009.066
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Start Renaming Generated Instances
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:21 ; elapsed = 00:00:24 . Memory (MB): peak = 1583.168 ; gain = 1009.066
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start Rebuilding User Hierarchy
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:21 ; elapsed = 00:00:24 . Memory (MB): peak = 1583.168 ; gain = 1009.066
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Renaming Generated Ports
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:21 ; elapsed = 00:00:24 . Memory (MB): peak = 1583.168 ; gain = 1009.066
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:21 ; elapsed = 00:00:24 . Memory (MB): peak = 1583.215 ; gain = 1009.113
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Start Renaming Generated Nets
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:21 ; elapsed = 00:00:24 . Memory (MB): peak = 1583.215 ; gain = 1009.113
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Writing Synthesis Report
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
/
%s
*synth2

Report BlackBoxes: 
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
| |BlackBox name |Instances |
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
4
%s*synth2
+------+---------+------+
h px� 
4
%s*synth2
|      |Cell     |Count |
h px� 
4
%s*synth2
+------+---------+------+
h px� 
4
%s*synth2
|1     |BUFG     |     1|
h px� 
4
%s*synth2
|2     |CARRY4   |   121|
h px� 
4
%s*synth2
|3     |LUT1     |    24|
h px� 
4
%s*synth2
|4     |LUT2     |   161|
h px� 
4
%s*synth2
|5     |LUT3     |    98|
h px� 
4
%s*synth2
|6     |LUT4     |    82|
h px� 
4
%s*synth2
|7     |LUT5     |    94|
h px� 
4
%s*synth2
|8     |LUT6     |   168|
h px� 
4
%s*synth2
|9     |MUXF7    |    22|
h px� 
4
%s*synth2
|10    |MUXF8    |     8|
h px� 
4
%s*synth2
|11    |RAMB18E1 |     6|
h px� 
4
%s*synth2
|17    |FDCE     |    13|
h px� 
4
%s*synth2
|18    |FDPE     |     5|
h px� 
4
%s*synth2
|19    |FDRE     |   234|
h px� 
4
%s*synth2
|20    |IBUF     |     5|
h px� 
4
%s*synth2
|21    |OBUF     |    31|
h px� 
4
%s*synth2
+------+---------+------+
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:21 ; elapsed = 00:00:24 . Memory (MB): peak = 1583.215 ; gain = 1009.113
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
c
%s
*synth2K
ISynthesis finished with 0 errors, 30 critical warnings and 123 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:17 ; elapsed = 00:00:23 . Memory (MB): peak = 1583.215 ; gain = 919.852
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:22 ; elapsed = 00:00:24 . Memory (MB): peak = 1583.215 ; gain = 1009.113
h p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0062

1583.2152
0.000Z17-268h px� 
U
-Analyzing %s Unisim elements for replacement
17*netlist2
157Z29-17h px� 
X
2Unisim Transformation completed in %s CPU seconds
28*netlist2
0Z29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1583.2152
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

158214b9Z4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
572
1632
362
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
synth_design: 2

00:00:252

00:00:292

1583.2152

1214.270Z17-268h px� 
c
%s6*runtcl2G
ESynthesis results are not added to the cache due to CRITICAL_WARNING
h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0032

1583.2152
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2E
CC:/Users/amsin/Desktop/project_1/project_1.runs/synth_1/vga_top.dcpZ17-1381h px� 
�
Executing command : %s
56330*	planAhead2Y
Wreport_utilization -file vga_top_utilization_synth.rpt -pb vga_top_utilization_synth.pbZ12-24828h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Tue Apr 22 16:41:13 2025Z17-206h px� 


End Record