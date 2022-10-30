class DamTypeAlien extends WeaponDamageType
	abstract;

static function GetHitEffects(out class<xEmitter> HitEffects[4], int VictemHealth )
{
    HitEffects[0] = class'HitSmoke';
}

defaultproperties
{
     WeaponClass=Class'XWeapons.ShockRifle'
     DeathString="%o was FOILED by the Alien."
     FemaleSuicide="%o was FOILED by the Alien"
     MaleSuicide="%o was FOILED by the Alien"
     bDetonatesGoop=True
}
