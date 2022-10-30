class C5GruntProjectile extends Projectile;

var xEmitter SparkleTrail;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();

    if ( Level.NetMode != NM_DedicatedServer )
    {
		SparkleTrail = Spawn(class'C5Sparkles', self);
		SparkleTrail.Skins[0] = Texture;
	}

	Velocity = Speed * Vector(Rotation);
}

simulated function Destroyed()
{
    if (SparkleTrail != None)
    {
        SparkleTrail.mStartParticles = 15;
        SparkleTrail.mLifeRange[0] *= 1.8;
        SparkleTrail.mLifeRange[1] *= 1.8;
        SparkleTrail.mRegen = false;
    }
	Super.Destroyed();
}

simulated function DestroyTrails()
{
    if (SparkleTrail != None)
        SparkleTrail.Destroy();
}

simulated function ProcessTouch (Actor Other, vector HitLocation)
{
    local Vector X, RefNormal, RefDir;

	if (Other == Instigator) return;
    if (Other == Owner) return;

    if (xPawn(Other)!=None && xPawn(Other).CheckReflect(HitLocation, RefNormal, Damage*0.25))
    {
        if (Role == ROLE_Authority)
        {
            X = Normal(Velocity);
            RefDir = X - 2.0*RefNormal*(X dot RefNormal);
            RefDir = RefNormal;
            Spawn(Class, Other,, HitLocation+RefDir*30, Rotator(RefDir));
        }
        DestroyTrails();
        Destroy();
    }
    else if ( Projectile(Other)==None || Other.bProjTarget )
    {
		Explode(HitLocation, Normal(HitLocation-Other.Location));
    }
}

simulated function Explode(vector HitLocation,vector HitNormal)
{
    if ( Role == ROLE_Authority )
        HurtRadius(Damage, DamageRadius, MyDamageType, MomentumTransfer, HitLocation );

   	PlaySound(ImpactSound, SLOT_Misc);
	Destroy();
}

defaultproperties
{
     DamageRadius=150.000000
     MomentumTransfer=70000.000000
     MyDamageType=Class'tk_C502Invasion.DamTypeGrunt'
     ImpactSound=Sound'WeaponSounds.ShockRifle.ShockRifleExplosion'
     ExplosionDecal=Class'tk_C502Invasion.C5LinkBoltScorch'
     LightType=LT_Steady
     LightEffect=LE_QuadraticNonIncidence
     LightSaturation=35
     LightBrightness=220.000000
     LightRadius=2.000000
     DrawType=DT_Sprite
     bDynamicLight=True
     AmbientSound=SoundGroup'WeaponSounds.BioRifle.BioRifleFire'
     LifeSpan=10.000000
     Texture=Texture'tk_C502Invasion.Ammo.GruntAmmo'
     DrawScale=0.100000
     Skins(0)=Texture'tk_C502Invasion.Ammo.GruntAmmo'
     Style=STY_Translucent
     SoundVolume=194
     SoundRadius=200.000000
     Speed=650.000000
     MaxSpeed=1100.000000
     Damage=25.000000
     LightHue=75
}
