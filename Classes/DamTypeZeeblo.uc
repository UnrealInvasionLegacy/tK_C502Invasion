class DamTypeZeeblo extends WeaponDamageType
	abstract;

static function GetHitEffects(out class<xEmitter> HitEffects[4], int VictemHealth )
{
    HitEffects[0] = class'HitSmoke';
}

defaultproperties
{
     WeaponClass=Class'XWeapons.ShockRifle'
     DeathString="%o was VANQUISHED by the Zeeblo Monster."
     FemaleSuicide="%o was VANQUISHED by the Zeeblo Monster"
     MaleSuicide="%o was VANQUISHED by the Zeeblo Monster"
     bDetonatesGoop=True
}
