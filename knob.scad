$fa=0.5;
$fs = 0.25;
//$fa=2;
//$fs = 1;

rounding= 2.5;

knobDiameter = 50; 
knobRadius = knobDiameter/2; 
knobHeight =  25;
wallThickness = 3;
centerPostOuterRadius = 8;
centerPostInnerRadius = 2.875;
gusset = 10;

difference()
{
	minkowski()
	{
		sphere(rounding);
		cylinder(knobHeight - rounding, knobRadius - rounding, knobRadius - rounding);
	}
	
	translate([-50, -50, -100])
	cube([100,100,100]);
	
	difference()
	{
		
		union()
		{
			cylinder(knobHeight - wallThickness -  gusset, knobRadius - wallThickness ,knobRadius - wallThickness);
			translate([0,0,knobHeight - wallThickness -  gusset])
			cylinder(gusset, knobRadius - wallThickness, knobRadius - wallThickness - (gusset/2));
		}
	
		
		translate([0,0,2])
		cylinder(knobHeight-wallThickness-2, centerPostOuterRadius, centerPostOuterRadius);
		
		
		
		
		translate([0,0,knobHeight - wallThickness - gusset])
		cylinder(gusset, centerPostOuterRadius, centerPostOuterRadius+(gusset/2));
	}
	
	cylinder(knobHeight-wallThickness-5, centerPostInnerRadius+0.15, centerPostInnerRadius-0.1);
	
}

			