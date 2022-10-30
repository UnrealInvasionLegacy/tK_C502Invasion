class C5Mulcher extends C5Skaarj;

event PostBeginPlay()
{
	Super.PostBeginPlay();
	MyAmmo.ProjectileClass = class'tk_C502Invasion.C5IceSkaarjProjectile';
}

defaultproperties
{
     FireSound=SoundGroup'WeaponSounds.PulseRifle.PulseRifleFire'
     Skins(0)=Texture'tk_C502Invasion.C5Alien.C5Alien1'
     Skins(1)=Texture'tk_C502Invasion.C5Alien.C5Alien1'
}
