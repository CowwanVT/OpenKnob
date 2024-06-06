$fa=0.5;
$fs = 0.25;

knobDiameter = 60;
knobGap = 0.5;
knobRadius = knobDiameter/2;
knobHoleRadius = knobRadius+knobGap;
knobRecess = 5;

rounding = 2.5;

wallThickness = 3;

potShaftDiameter = 6.9;
potShaftGap = 0.25;
potShaftRadius = potShaftDiameter/2;
potShaftHoleRadius = potShaftRadius + potShaftGap;

bodyDiamter = 70; //or 66? or 80?
bodyRadius = bodyDiamter/2;
bodyHeight = 30;

jackChannelWidth = 15;
jackChannelHeight = 15;
jackWallThickness = 1.8;

jackChannelLength = ((bodyDiamter^2 - jackChannelWidth^2)^0.5)- jackWallThickness*2;

jackHoleDiameter = 6.5;
jackHoleRadius = jackHoleDiameter/2;

internalHoleDiameter = 20;
internalHoleRadius = internalHoleDiameter/2;

jackBodyDiameter = 10;
jackBodyRadius = jackBodyDiameter/2;

indexHoleDiameter = 4;
indexHoleRadius = indexHoleDiameter/2;

indexHoleOffset = 9.5 - indexHoleRadius;

shoulder = 0;

textDepth = 1;

difference()
{
	minkowski()
	{
		union()
		{
			cylinder(bodyHeight - shoulder-rounding, bodyRadius-rounding, bodyRadius-rounding);
			translate([0,0,bodyHeight - shoulder-rounding])
			cylinder(shoulder, bodyRadius-rounding, bodyRadius - shoulder-rounding);
			
			
		}
		sphere(rounding);
	}
	//knob
	translate([0,0,bodyHeight - knobRecess])
	cylinder(100, knobHoleRadius, knobHoleRadius);
		
	//pot hole
	
	cylinder(bodyHeight - knobRecess - wallThickness, internalHoleRadius, internalHoleRadius);
	
	translate([0, -(internalHoleDiameter/2), 0])
	cube([internalHoleDiameter, internalHoleDiameter, bodyHeight - knobRecess - wallThickness]);
	
	//pot shaft
	
	cylinder(100, potShaftHoleRadius, potShaftHoleRadius);
	
	translate([0, -indexHoleOffset, 0])
	cylinder(100, indexHoleRadius, indexHoleRadius);
	
	
	translate([-jackChannelWidth/2, -(jackChannelLength-10)/2, 0])
	cube([jackChannelWidth, jackChannelLength-10, jackChannelHeight/2]);

	translate([0 ,(jackChannelLength-10)/2, jackChannelHeight/2])
	rotate([90, 0, 0])
	cylinder(jackChannelLength-10, jackChannelHeight/2, jackChannelHeight/2);

	translate([0 ,100, jackChannelHeight/2])
	rotate([90, 0, 0])
	cylinder(200, jackHoleRadius, jackHoleRadius);
	
	
	translate([0 ,(jackChannelLength)/2, jackChannelHeight/2])
	rotate([90, 0, 0])
	cylinder(jackChannelLength, jackBodyRadius, jackBodyRadius);
	
	
	translate([0 ,-(jackChannelLength/2) -  jackWallThickness , jackChannelHeight/2])
	rotate([90, 0, 0])
	cylinder(20, jackBodyRadius, jackBodyRadius);
	
		
	translate([0 ,(jackChannelLength/2) +  jackWallThickness + 20 , jackChannelHeight/2])
	rotate([90, 0, 0])
	cylinder(20, jackBodyRadius, jackBodyRadius);
	
	translate([-100, -100, -50]) 
	cube([200, 200, 50]);
	
	translate([0,bodyRadius-textDepth,  jackChannelHeight-1])
	rotate([90, 0, 180])
	linear_extrude(10)
	text("IN", halign="center", size=5, font="Helvetica:style=Bold");
	
	translate([0,-bodyRadius+textDepth,  jackChannelHeight-1])
	rotate([90, 0, 0])
	linear_extrude(10)
	text("OUT", halign="center", size=5, font="Helvetica:style=Bold");
}


