class DamTypeMulcher extends WeaponDamageType
	abstract;

static function GetHitEffects(out class<xEmitter> HitEffects[4], int VictemHealth )
{
    HitEffects[0] = class'HitSmoke';
}

defaultproperties
{
     WeaponClass=Class'XWeapons.ShockRifle'
     DeathString="Is Everscerated even a word? OH WELL, %o your dead."
     FemaleSuicide="Is Everscerated even a word? OH WELL, %o your dead."
     MaleSuicide="Is Everscerated even a word? OH WELL, %o your dead."
     bDetonatesGoop=True
}
