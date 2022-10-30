class C5Alien extends C5Skaarj;

event PostBeginPlay()
{
	Super.PostBeginPlay();
	MyAmmo.ProjectileClass = class'tk_C502Invasion.C5AlienProjectile';
}

defaultproperties
{
     Skins(0)=Texture'tk_C502Invasion.C5Alien.C5Alien'
     Skins(1)=Texture'tk_C502Invasion.C5Alien.C5Alien'
}
