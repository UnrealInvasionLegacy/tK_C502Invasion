class DamTypeBrick extends WeaponDamageType
	abstract;

static function GetHitEffects(out class<xEmitter> HitEffects[4], int VictemHealth )
{
    HitEffects[0] = class'HitSmoke';
}

defaultproperties
{
     WeaponClass=Class'XWeapons.ShockRifle'
     DeathString="%o was DIDDLED AWAY by the Bricks Bricks."
     FemaleSuicide="%o was DIDDLED AWAY by the Bricks Bricks."
     MaleSuicide="%o was DIDDLED AWAY by the Bricks Bricks."
     bDetonatesGoop=True
}
