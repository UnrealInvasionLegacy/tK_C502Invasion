//=============================================================================
// Fire effect.
//=============================================================================
class C5Fire extends Projectile;

var	xEmitter SmokeTrail;
var vector Dir;

simulated function Destroyed()
{
	if ( SmokeTrail != None )
		SmokeTrail.mRegen = False;
	Super.Destroyed();
}

simulated function PostBeginPlay()
{
	if ( Level.NetMode != NM_DedicatedServer)
	{
		if ( !Level.bDropDetail )
			spawn(class'RocketSmokeRing',,,Location, Rotation );
		SmokeTrail = Spawn(class'BelchFlames',self);
	}
	Dir = vector(Rotation);
	Velocity = speed * Dir;
    if ( Level.bDropDetail )
	{
		bDynamicLight = false;
		LightType = LT_None;
	}
}

simulated function Landed( vector HitNormal )
{
	Explode(Location,HitNormal);
}

simulated function ProcessTouch (Actor Other, Vector HitLocation)
{
	if ( (Other != instigator) && (Projectile(Other)==None || Other.bProjTarget) )
		Explode(HitLocation,Vect(0,0,1));
}

function BlowUp(vector HitLocation)
{
	HurtRadius(Damage, DamageRadius, MyDamageType, MomentumTransfer, HitLocation );
	MakeNoise(1.0);
}

simulated function Explode(vector HitLocation, vector HitNormal)
{
	PlaySound(sound'WeaponSounds.BExplosion3',,2.5*TransientSoundVolume);
	spawn(class'FlakExplosion',,,HitLocation + HitNormal*16 );
	spawn(class'FlashExplosion',,,HitLocation + HitNormal*16 );
	if ( (ExplosionDecal != None) && (Level.NetMode != NM_DedicatedServer) )
		Spawn(ExplosionDecal,self,,Location, rotator(-HitNormal));

	BlowUp(HitLocation);
	Destroy();
}

defaultproperties
{
     Speed=900.000000
     MaxSpeed=1000.000000
     Damage=50.000000
     DamageRadius=140.000000
     MomentumTransfer=50000.000000
     MyDamageType=Class'tk_C502Invasion.DamTypeGrunt'
     ExplosionDecal=Class'XEffects.RocketMark'
     LightType=LT_Steady
     LightEffect=LE_QuadraticNonIncidence
     LightHue=28
     LightBrightness=255.000000
     LightRadius=5.000000
     DrawType=DT_Sprite
     bHidden=True
     bDynamicLight=True
     AmbientSound=Sound'WeaponSounds.RocketLauncher.RocketLauncherProjectile'
     LifeSpan=6.000000
     Texture=Texture'tk_C502Invasion.Ammo.GruntAmmo'
     DrawScale=0.200000
     AmbientGlow=96
     Style=STY_Translucent
     SoundVolume=113
     SoundRadius=100.000000
     bFixedRotationDir=True
     RotationRate=(Roll=50000)
     DesiredRotation=(Roll=30000)
     ForceType=FT_Constant
     ForceRadius=100.000000
     ForceScale=5.000000
}
