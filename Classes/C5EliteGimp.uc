class C5EliteGimp extends Krall;

event PostBeginPlay()
{
	Super.PostBeginPlay();

	MyAmmo.ProjectileClass = class'C5GimpProjectile';
}

defaultproperties
{
     FireSound=SoundGroup'WeaponSounds.FlakCannon.FlakCannonFire'
     ScoringValue=5
     Skins(0)=Texture'tk_C502Invasion.EliteGimp.EliteGimp'
}
