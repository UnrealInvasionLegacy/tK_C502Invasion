class C5DamTypeRocket extends WeaponDamageType
	abstract;

static function GetHitEffects(out class<xEmitter> HitEffects[4], int VictemHealth )
{
    HitEffects[0] = class'HitSmoke';
    
    if( VictemHealth <= 0 && FRand() < 0.2 )
        HitEffects[1] = class'HitFlameBig';
    else if ( FRand() < 0.8 )
        HitEffects[1] = class'HitFlame';
}

defaultproperties
{
     WeaponClass=Class'XWeapons.RocketLauncher'
     DeathString="%o rode %k's Ion Bomb into oblivion."
     FemaleSuicide="%o fired her STICK prematurely."
     MaleSuicide="%o fired his STICK prematurely."
     bDetonatesGoop=True
     KDamageImpulse=20000.000000
}
