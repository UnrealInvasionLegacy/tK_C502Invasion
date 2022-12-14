class C5AlienProjectile extends Projectile;

var xEmitter SparkleTrail;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();

    if ( Level.NetMode != NM_DedicatedServer )
    {
		SparkleTrail = Spawn(class'SkaarjSparkles', self);
		SparkleTrail.Skins[0] = Texture;
	}

	Velocity = Speed * Vector(Rotation);
}

simulated function Destroyed()
{
    if (SparkleTrail != None)
    {
        SparkleTrail.mStartParticles = 10;
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
     Speed=1000.000000
     MaxSpeed=1000.000000
     Damage=40.000000
     DamageRadius=150.000000
     MomentumTransfer=70000.000000
     MyDamageType=Class'tk_C502Invasion.DamTypeAlien'
     ImpactSound=Sound'WeaponSounds.ShockRifle.ShockRifleExplosion'
     ExplosionDecal=Class'XEffects.LinkBoltScorch'
     LightType=LT_Steady
     LightEffect=LE_QuadraticNonIncidence
     LightHue=100
     LightSaturation=85
     LightBrightness=255.000000
     LightRadius=4.000000
     DrawType=DT_Sprite
     bDynamicLight=True
     AmbientSound=Sound'WeaponSounds.ShockRifle.ShockRifleProjectile'
     LifeSpan=10.000000
     Texture=Texture'XEffectMat.Link.link_ring_green'
     DrawScale=0.200000
     Skins(0)=Texture'XEffectMat.Link.link_ring_green'
     Style=STY_Translucent
     SoundVolume=29
     SoundRadius=65.000000
}
