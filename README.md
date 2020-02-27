### ![SWWM GZ](https://raw.githubusercontent.com/OrdinaryMagician/swwmgz_m/master/graphics/SWWMGZLogo.png)
### Revived through Doom Tournament

---

SWWM GZ brings to GZDoom a "best of" collection of custom weapons I've made for
Unreal Tournament, plus many new things that didn't make the cut there.

It also features A LOT of lore from the UnSX multiverse. I pretty much went
wild here with all the stuff you can read.

This is the very first fully original mod based on Doom Tournament code.

---

## The Player

You are an Akari Labs Demolitionist Bot, one of the very first units, fresh off
the factory. You are the company's greatest achievement in AI-controlled combat
units, trained to efficiently use all sorts of weaponry, built with premium
quality armor plating and robust but flexible joints. In order to show off your
capabilities, your creator has decided to send you out to fight the demonic
invasion brought upon by "those big stinkin' idiots at the UAC".

Additional features:
 - Programmable colour tags: Located around various parts of your body, allows
   quick and easy differentiation between multiple units (not available due to
   engine limitations™, so they're always green).
 - Lucky Collar: A little something that your creator gives to all of her
   creations. Reduces incoming damage by 75% when you're below 25% health.
 - User Menu: With the press of a button, open a dedicated menu to see all your
   stats in detail, info on carried items and weapons, check out a grand
   library of information on things you come across, and access the store for
   buying extra items with your score points.
 - Magnetic Utility Belt: Makes some weapons easier to reload while on the go.
 - Keychain: For carrying all your keys around, and other valuable things.
 - Pocket Hammerspace™ containers: These will store and deploy your ammunition
   and weapons on demand. The capacity for ammo storage can be increased by
   finding Hammerspace™ Embiggener modules.
 - Forx JetBurst™ Units: Can be used for quick dashes in any direction, or even
   for short bursts of flight.
 - Targetting Array: Tracks nearby foes and provides basic information on their
   health. Compatible with Omnisight™ mapping modules for tracking key items
   and nearby exits.
 - Akari Labs CuteEmotion™ Display: Equipped onto your visor to show a wide
   range of predefined facial expressions in order to convey simple emotions
   to others.
 - Akari Labs LoudBoi™ Voicebox: Allows you to ｅｍｉｔ. Additional voice
   options will be available through add-ons. Note that the default voice is in
   Japanese, but subtitles will be provided when available.

Note: Since you're a robutt you pretty much can swim indefinitely and are also
inmune to poison.

---

## The weapons

The arsenal this mod brings to the table is composed mainly of stupidly
overpowered weapons, which has been my specialty for years.

Some weapons may have extra functions attached to the reload or zoom buttons,
so don't forget to bind those too.

All weapons also have a quick melee attack using the Weapon State 1 button,
this is optional but may help to have it bound too.

If a weapon has no actions on either the reload or zoom buttons, it may be
replaced with some special idle action, such as spinning or fiddling around
with it.

For now these are all the weapons planned for the first release. More will be
added afterwards (until then I'll tease you with some empty zscript files :P).

### Pusher (slot 1), replaces Chainsaw, Gauntlets, Timon's Axe

What was going to be the new melee weapon in Ultra Suite 2, but it never
happened. A pimped up jackhammer.

Primary fire drills at whatever you're facing.

Secondary fire pulls the drill bit back all the way in, then on button release
pushes it back out with immense force. This will pretty much pierce a hole
through anything, but if you miss there's a chance you'll lose grip on the
weapon and it'll go flying until it hits something.

### Deep Impact (slot 1), replaces Fist, Staff, Hexen starting weapons

The signature SWWM melee weapon, an Impact Hammer on steroids.

Primary fire is your usual compressed air push, you can use it to deflect
projectiles or push away enemies that block your path.

Secondary fire is a charged shot. The device compresses air as hard as it can,
then releases a massive airblast at Mach 3 that will tear apart everything on
its way.

Reload pumps up more compressed air, for use by the primary fire. Note that
after using secondary fire you will always be without any air for primary.

Equipped by default on spawned players.

### Explodium Gun (slot 2), replaces Pistol, Elven Wand, Hexen starting weapons

Primary firearm, another staple of the series, but more volatile than ever.
A pocket rocket, a trusty ol' gun that uses Explodium-filled bullets to wreak
some havoc.

Primary fire is the usual good ol' explosive shot. Has considerable knockback,
but not really lethal damage.

Secondary fire is an "explosive reload". Rather than just discarding the mag as
usual, pulling the pin at the bottom arms it as a grenade that you can fling at
enemies for increased damage. The yield will be proportional to the ammo left
in it.

Reload is just a plain ol' reload, nothing else, no explosions or anything.

Equipped by default on spawned players. Cannot be dual wielded, that'd just be
too much. Has infinite ammo.

### Spreadgun (slot 3), replaces Shotgun, Ethereal Crossbow, Serpent Staff

Coming from the Doom modding side of things, this gun really packs a punch, but
is kind of unwieldy to use.

Primary fire fires, duh. Depending on the loaded ammo the effects may vary.

Secondary fire switches ammo type for the next shot to be loaded.

Reload unloads the current shell and loads a new one. Unspent shells are
re-added to their respective ammo type pool.

The Spreadgun uses 10 gauge ammunition (like the Quadshot).

### 10Ga shells, replaces Clip / Shells, Wand Crystal / Ethereal Arrows, Flechette, Chaos Device/Banishment Device

Available in the following types, with varying chances of appearing depending
on replaced item, may also come in bundles:
 - Standard shotshell (red). Lots of tiny pellets ready to tear enemies to
   shreds. Most common.
 - Slug (green). Concentrated damage in a single, large projectile. Common.
 - Dragon's breath (white). Fiery pain in one shot for everything in front of
   you. Not very effective underwater, but still deals some small heat damage.
   Somewhat rare.
 - Kinylum saltshot (blue). Highly volatile pieces of Kinylum that leave behind
   a trail of burning plasma. Rare.
 - "Fuck your shit" round (black). A special home-made incendiary ammo type
   that only an absolute madman would have come up with. Sets everything on
   fire (potentially including yourself). Very rare.
 - "The ball" (purple). A big lead ball, 'nuff said. Somewhat rare.
 - Golden shell (self-explanatory color). An extremely rare, but very valuable
   type. Fires a sabot packed with a very dense, high-grade Explodium charge,
   the shell also contains some gold glitter, but it's just for show. Clearly
   designed by someone completely insane, and definitely guaranteed to not
   fail catastrophically and blow up your gun, your hands, your arms, and the
   rest of your upper body. Unlike the others, this one is only available as a
   rare drop from boss monsters, and as a rare spawn for chaos/banishment
   devices in Heretic and Hexen.

The two first standard types will also pop up in Hammerspace Embiggeners and
Ammo Fabricators.

### Wallbuster (slot 4), replaces SSG, Ethereal Crossbow, Frost Shards

A ludicrously overkill weapon, courtesy of the always-overkill Blackmann Arms.
Sporting 5 groups of 5 barrels, for a grand total of 25. Everything in front
of you is pretty much dead. Cannot use incendiary ammo types or golden shells.

Primary fire shoots one barrel at a time.

Secondary fire shoots five barrels at once, watch out for the recoil.

Press the zoom button to fire all barrels at the same time, but keep in mind
this might kill you too if you're not well protected.

Reload reloads (obviously). The process is very complicated so I'll explain it
better as a list:
 - Press fire to change the ammo type to load.
 - Press altfire to queue reloads, if the selected ammo is exhausted, you will
   be prompted to reselect one.
 - Press zoom to undo the last action (or cancel if there's nothing to undo).
 - In single player, the game is paused when you're in the queueing process, so
   you can take your time, but in coop you better have someone to cover you
   while you micromanage this beast.
 - Since it's actually just a menu, you can also cancel by closing it.
 - The reload menu can also be helpful to see the current status of all loaded
   barrels.
 - Press reload again to start filling it up (or cancel if there's no queue).
 - While loading shells, you can stop the reload by pressing any weapon button.
 - For a skilled combat robot like you, reloading this should be very fast.
 - The barrels have a mechanism that prevents unspent shells from being
   ejected, so those will stay there until they're fired.

People like to nickname it the "Ballbuster". You'll see why.

### Eviscerator (slot 5), replaces Chaingun, Dragon Claw, Hammer of Retribution

The pleasure of shrapnel spamming. Make hot steaming pain rain upon your
enemies.

Primary fire deploys a curtain of hot lead, it covers a rather wide angle.

Secondary fire unleashes the shitstorm bomb. If you thought primary fire was
spammy, think again.

Reload toggles between wide spread (default) and tight spread for primary.

This weapon made the Unreal Engine cry, so GZDoom may suffer a lot too.

### Eviscerator shells, replaces Ammo Box, Claw Orb

Little bundles of fun (in hot lead form) coming in various sizes, either single
units or six-packs.

### Hellblazer (slot 6), replaces Rocket Launcher, Phoenix Rod, Firestorm

Another signature weapon of the SWWM series. Rebranded to distance itself from
its original inspiration.

Primary fire shoots a hot flaming rocket that unleashes hell in a wide area.

Secondary fire lobs it as a grenade that will bounce around.

Reload changes the ammo type, there are four options (see ammo section below).

This thing is more explosive than it looks, so if you're reading this, Icarus,
DO NOT use it at close range.

### Hellblazers, replaces Rockets, Flame Orb

Ammo for the Hellblazer, comes in various types, and some of them can come in
packs. There are four types:
 - Hellblazer missiles. The standard ammunition, highly explosive.
 - Hellblazer crackshots. Cluster bombs, all sorts of little bits that fly
   around after the initial blast, and have some heatseeking to them.
 - Hellblazer ravagers. Wide range incendiary missiles, the flames will engulf
   pretty much everything around itself.
 - Hellblazer warheads. Frickin' nukes, keep your distance.

### Legacy Sparkster (slot 7), replaces Plasma Rifle, Hellstaff, Arc of Death

No dicking around with model numbers here. This is a legacy model that uses
what's best described as "sentient lightning".

Primary fire releases small blobs of energy that have some slight seeking
abilities.

Secondary fire is a concentrated beam shot, a very old thing from the original
UnSX 1 incarnation. The beam can penetrate multiple solid targets.

Reload deploys a capsule that releases a massive sphere of pure energy
that tracks down any hostile targets. It has a rather limited lifespan, and can
be even shot down.

If the beam hits either of the other energy blobs, they will detonate with
highly amplified damage and range.

### Spark Unit, replaces Cells, Runes

Ammunition for the Sparkster. These capsules contain a lot of energy despite
their small size.

### Silver Bullet JET (slot 8), replaces Plasma Rifle, Hellstaff, Quietus (hilt)

A lighter (43kg), higher caliber (1.150 XSB) variant of the original Silver
Bullet, with built-in recoil compensation. A joint project of Blackmann Arms
and Forx Industries. This thing kills almost everything in one shot, provided
you can aim straight.

Primary fire shoots, duh.

Secondary fire toggles the recoil compensators. These small jet engines can
potentially deal damage to yourself if you don't have any armor, so be careful.

Reload reloads (what else is new).

Zoom uses the scope. Can be held to go up to 16x.

This weapon is generally not recommended for human use outside of power armor.
Good thing you're not a human, then.

### 1.150 XSB Bullets, replaces Cells, Runes

The 1.150 caliber Extreme Super Burst bullets employ an explodium microcharge
to be shot with enough energy to reach a relatively high, although still
subsonic speed. They are hard to come by, so spawns are scarce, and they won't
even pop up in Hammerspace Embiggeners, only on higher tier Fabricators.

### Candy Gun (slot 9), replaces BFG9000, Firemace, Bloodscourge (stub)

Coming from an old unreleased weapon mini-mod, the candy gun is like an
explodium gun on steroids.

Primary fire releases explosive candy bullets. The blasts are a tasty treat of
pain.

Secondary fire works exactly like the explodium gun, the mag is armed and
yeeted with extreme prejudice.

Reload does what you'd expect.

Holding primary fire during the first few moments of altfire will throws the
weapon away, armed and ready to explode if it hits anyone or anything. The
blast area for this is pretty ridiculous. You can hold spare guns, by the way.

### Ynykron Artifact (slot 0), replaces BFG9000, Firemace, Wraithverge (arc)

Popularly known as the "Death Cannon". One of the four ultimate weapons
commissioned by the mad dictator god Nedoshiaan, before his defeat.

Primary fire initiates the charge process for one shot. Once it has completed
charging, using either fire button will release the shot. Make sure to keep
some distance from your targets, because the resulting blast has a pretty
nasty amount of splash damage.

Secondary fire initiates a reverse charge process for another shot. The result
of this is an implosion of massive strength located at a singular point, which
temporarily creates a miniature black hole that will eat up anything that's not
bolted down, including yourself.

Reloading cancels the charge. Ammo will not be wasted, but it will have to vent
for a while longer than after firing normally. Note that you can't cancel if
it's already full.

Unlike its previous incarnation in SWWM Platinum, this one doesn't have such an
obscene pre-fire delay, so it's much easier to land a shot.

### Puronokorokinylum Crystal

Additional ammo charge for the Ynykron Artifact. These don't spawn, so you'll
have to get more ammo by finding additional weapon pickups (at least until the
store is implemented).

---

## The pickups

Of course some powerups are needed, too.

Healing items restore health (duh).

Armor does exactly what you'd expect.

All of these items can be carried in your inventory indefinitely before use,
except in deathmatch, where they're activated immediately. Healing items are
always used immediately if they can heal you or you're about to die (with the
lowest tier healing items taking priority). Armor is immediately carried if you
don't have any of that type on you, or if your existing armor drains and you
have a spare. Most powerups can be toggled, unless specified otherwise.

### Health Nugget, replaces Health Bonus, Crystal Vial

Health nuggets increase health by 5% up to a cap of 200.

### Health Tetrahedron, replaces Stimpak, Quartz Flask

Health tetrahedrons provide a 15% health boost up to a cap of 100.

### Health Cube, replaces Medkit, Mystic Urn (Hexen), Quartz Flask (Heretic)

Health cubes provide a 30% health boost up to a cap of 100.

### Refresher, replaces Soulsphere, Mystic Urn (Heretic), Mystic Ambit Incant

This artifact provides a massive boost of health to 500, plus a regeneration
effect that heals 5% every 2 seconds, for up to 60 seconds, thus it doubles
as a powerup. Like other health items, the Refresher is auto-activated if
you're about to die, though it sometimes won't be enough to save you.

### Armor Nugget, replaces Armor Bonus, Timebomb of the Ancients, Disc of Repulsion

Cumulative armor items that can increase resistance to all damage by as much
as you can find. Each nugget adds 5% to the total. Above 100%, damage gets
turned into additional health (up to the standard 100% cap).
The upper cap for these is 200%.

### Blast Suit, replaces Green Armor, Silver Shield, Mesh Armor

The blast suit is a nice little light armor which provides a 75% reduction to
damage and an additional 50% to splash damage.

Can handle a total of 200 damage before breaking.

### War Armor, replaces Blue Armor, Enchanted Shield, Falcon Shield

Decent armor, protects very well against all damage. Reduction factors are as
follows:
 * 90% reduction for elemental (fire, ice, electric, etc.)
 * 80% reduction to everything else
 * 70% reduction for all splash damage (multiplicative on top of the other two)

The armor can eat up a total of 600 damage before breaking.

### Grilled Cheese Sandwich, replaces Megasphere, Morph Ovum, Platinum Helm

The ultimate meal. Grants a full 1000 health and magically gives you a full
stack of armor nuggets, a blast suit and a war armor. In addition it prevents
you from dying at all if it autoactivates on low health.

### Ghost Artifact, replaces Blur Sphere, Shadowsphere, Amulet of Warding

Actual 100% invisibility guaranteed, a relic from the old UnSX days.

The ghost artifact is capable of turning you absolutely invisible. However, it
does not prevent you from making noise, so it's best to use it to sneak past
certain encounters, or prepare surprise attacks.

This powerup lasts 60 seconds and cannot be toggled.

### Ragekit, replaces Berserk, Tome of Power, Dark Servant, Dragonskin Bracers

The ragekit is a special item that has some... interesting effects.

Octuples melee damage, doubles movement speed, quarters damage taken... and has
the side effect of turning you into a screaming beast.

Ragequit happens after 30 seconds.

### Gravity suppressor, replaces Radsuit, Wings of Wrath, Boots of Speed

Continuing with the "replace jump boots with flight" decision in previous mods,
this time you'll be getting a proper easy to control antigravity powerup.

For 60 seconds, you can fly around in the air at 2x your normal walking speed.
Just be careful with height when the effect is about to run out.

### Fucking Invinciball, replaces Invulnerability, Ring of Invincibility, Icon of the Defender

This thing makes you impervious to pretty much everything excluding the Ynykron
Artifact.

You're fucking invincible for a total of 30 seconds.

### Hammerspace Embiggener, replaces Backpack, Bag of Holding, Porkalator

Each of these you pick up increase ammo capacity by half of its base value, up
to 5x, and also give you some extra ammo like a normal backpack.

### Universal Ammo Fabricator, replaces Mana / Krater of Might in Hexen

Separated into four tiers, they work pretty much like the ammo cubes in Doom
Tournament, except they try to "balance" the total ammo given. The max tier
fabricator is the only one capable of producing ammo for superweapons.

### Lamp, replaces Lite-Amp, Torch

A floating lamp companion, may attract moths. The moths will disperse and
attack nearby enemies when toggling it off.

### Omnisight, replaces Computer Map, Map Scroll

Reveals the entire layout of the map and shows key locations in the HUD.

---

## The HUD

Pretty simplistic so it doesn't get in the way of the action. Some things may
be configurable.

### Top left corner

Message display. Can be configured to show different numbers of messages
depending on whether the chat prompt is open. Chat messages take much longer to
expire than others, so there's less of a chance to miss them, as they might pop
back up when the less important ones expire. A full chat history can also be
read at any time in the Demolitionist Menu. Repeated messages are compressed
with a multiplier suffix.

### Top right corner

Current score.

The scoring system is pretty straightforward. Each thing you kill (even if not
an enemy) will give you points according to half of its base health, rounded up
to the nearest multiple of 10 and capped to 2000, plus these bonuses (in order
of application):
 * x1.25 for an overkill (enemy was gibbed or killed in one shot).
 * x1.5 for each combo level, up to x8 in steps of x0.5. Kills are considered
   combos if multiple enemies are killed within 5 seconds of each other.
 * +100 for killing an enemy without having taken damage since last spawn, with
   extra +50 boosts for consecutive kills.
 * +10000 if the enemy killed is a boss.
 * +5000 if you've killed the last enemy in the map.

You are also given +500 points for each secret found, +5000 if it's the final
secret. Countable items give +25 points each or +2500 if it's the final item.

Score can be used to buy items on the in-game store, and it is preserved
between hubs.

In Doom and Heretic, collected keys will be displayed below the score box.

### Bottom left corner

Your health, armor and fuel, along with an inventory bar, and all active
armors and powerups (with their respective durability/duration).

### Bottom border

Pickup messages. Repeated pickups will have a multiplier suffix added. Total
messages shown are also configurable.

### Bottom right corner

Current equipped weapon stats. Ammo(s) and such. Below it, the weapon slots.

### Targeter

Because in the middle of the chaos that is this mod you might have a hard time
trying to figure out where everything is in between explosions and massive
smoke clouds, a targeter has been implemented, which will show the following:

* Players and monsters: Draws an identificative label and a health bar. The bar
  can display overhealing on players, and also indicate when someone is
  invulnerable. When they take damage or get healed, numbers (either red or
  green) will pop up around them. The targeter only picks up enemies in your
  direct line of sight, gradually fading once you lose sight of them, and can
  only display up to 40 individual bars, giving priority first to players, then
  the nearest enemies. The Omnisight increases the time out-of-sight targets
  remain targetted.
* Keys and map exits: If you've picked up an Omnisight, key items and any exit
  lines will be marked and labeled, along with a little distance indicator in
  map units. Note that this doesn't work for script-triggered exits.

These components are toggleable.

---

## The End

This is all the information I can provide on this Readme file for now, stay
tuned for more stuff to happen later on.
