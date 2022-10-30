class C5Zeeblo extends C5Skaarj;

event PostBeginPlay()
{
	Super.PostBeginPlay();
	MyAmmo.ProjectileClass = class'tk_C502Invasion.C5ZeebloProjectile';
}

defaultproperties
{
     FireSound=SoundGroup'WeaponSounds.PainterRifle.PainterRifleFire'
     GroundSpeed=300.000000
     WaterSpeed=100.000000
     Skins(0)=Texture'tk_C502Invasion.Zeeblo.Zeeblo'
     Skins(1)=Texture'tk_C502Invasion.Zeeblo.Zeeblo'
}
