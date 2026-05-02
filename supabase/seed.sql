-- ============================================================
-- SUPERGRIT — Seed Data
-- ============================================================

-- frameworks
insert into public.frameworks (name) values
  ('Elemental'),
  ('Gadgeteer'),
  ('Generic'),
  ('Magician'),
  ('Mentalist'),
  ('Mover'),
  ('Powerhouse'),
  ('Shape Changer'),
  ('Telepathy');

-- passive_skills
insert into public.passive_skills (name, level_gate, frameworks, roleplay_effect, implementation_notes, tags) values
  ('Flight', '2', ARRAY['Generic']::text[], 'Can fly', null, null),
  ('Healing', '4', ARRAY['Generic']::text[], 'Accelerated Healing out of Combat', null, null),
  ('Invisibility', '3', ARRAY['Generic']::text[], 'Can turn invisible', null, null),
  ('Strength', 'Base', ARRAY['Powerhouse']::text[], 'Can lift heavy things and do strong things in roleplay', null, null),
  ('Invulnerability', '5', ARRAY['Powerhouse']::text[], 'Cannot be damaged in roleplay', null, null),
  ('Extrasensory', 'Base', ARRAY['Powerhouse']::text[], 'Keen sight, sensitive hearing', null, null),
  ('Chemistry', 'Base', ARRAY['Gadgeteer']::text[], 'Medicine, Potions, Self-augmentation', null, null),
  ('Mechanics', 'Base', ARRAY['Gadgeteer']::text[], 'Robotics, Projectiles, Propulsion, Rockets', null, null),
  ('Intellect', '5', ARRAY['Gadgeteer']::text[], 'Leadership, Foresight, Preparedness, Planning', null, null),
  ('Durable', 'Base', ARRAY['Mover']::text[], null, null, null),
  ('Speed', 'Base', ARRAY['Mover']::text[], null, null, null),
  ('Teleportation', '5', ARRAY['Mover']::text[], null, null, null),
  ('Telepathy', 'Base', ARRAY['Mentalist']::text[], null, null, null),
  ('Mind Control', '5', ARRAY['Mentalist']::text[], null, null, null),
  ('Telekinesis', 'Base', ARRAY['Mentalist']::text[], null, null, null),
  ('Channel Energy', 'Base', ARRAY['Elemental']::text[], null, null, null),
  ('Absorb Energy', 'Base', ARRAY['Elemental']::text[], null, null, null),
  ('Dynokinesis', '5', ARRAY['Elemental']::text[], 'Redirecting Kinetic or Potential Energy', null, null),
  ('Flying Form', 'Base', ARRAY['Shape Changer']::text[], 'Unlocks Flight', 'Whenever a skill card is played in combat with any of the shape changer prerequisites, the Shape Changer will be assumed to gain relevant rollplay (and in certain cases, combat) abilities associated with the form of the most recent skill card. E.g. water form grants gills, flying form cards make Flyby card reachable for the Shape Changer, etc.', null),
  ('Land Form', 'Base', ARRAY['Shape Changer']::text[], null, null, null),
  ('Water Form', '5', ARRAY['Shape Changer']::text[], null, null, null);

-- skill_cards
insert into public.skill_cards (name, cost, frameworks, phase_of_play, prerequisite_passives, prerequisite_raw, proposed_effect, implementation_notes, tags) values
  ('Chill Out', '2', ARRAY['Elemental']::text[], 'On Leave Contest', ARRAY['Absorb Energy']::text[], 'Absorb Energy', 'You absorb the kinetic energy from your opponent, slowing them down drastically. 
Remove two (2) of your opponent''s pips.', null, null),
  ('Conduct Self', '1', ARRAY['Elemental']::text[], 'On Contest / On Continuance', ARRAY['Channel Energy']::text[], 'Channel Energy', 'You are able to touch a conductive surface, like a metal wall or floor, you can transform into raw energy capable of being conducted like heat or electricity and move through the material. 

On Contest: If you have won at least one Contest Roll and have lost no Contest Rolls on this round of Combat, you can play this card to immediately win the Contest Rolls against all remaining opponents in this Combat Zone.

On Continuance: You immediately succeed on your Escape Attempt and become Unreachable to all opponents that have not played Conduct Self this Combat', null, null),
  ('Energy Blast', '2', ARRAY['Elemental']::text[], 'On Damage', ARRAY['Channel Energy']::text[], 'Cannel Energy', 'You unleash a concussive blast of energy in a wide area. Add +5 Damage to your Damage Roll.

AOE', null, 'AOE: Affects all actors in your Combat Zone. Opponents who won their Contest Phase receive half damage. Allies always receive the full damage unless a played card or specific status indicate otherwise.'),
  ('Energy Vortex', '2', ARRAY['Elemental']::text[], 'On Damage', ARRAY['Channel Energy']::text[], 'Channel Energy', 'You channel your energy into a concentrated destructive vortex. Your opponent must decide between Exiling his current hand or taking 15 damage.', null, 'Exile: Instead of adding this card to the discard pile when played, it is instead Exiled and cannot be reshuffled back into your deck (as the cards from your discard pile would be when your draw pile runs out of cards).'),
  ('Frenetic Shield', '1', ARRAY['Elemental']::text[], 'On Leave Contest', ARRAY['Channel Energy','Absorb Energy']::text[], 'Channel Energy and Absorb Energy', 'You surround yourself with a barrier of flames, spikey ice, or static electricity. Each separate damage roll made against you in the damage phase will deal 1d4 of damage back to your opponent.', null, null),
  ('Natural Disaster', '3', ARRAY['Elemental']::text[], 'On Damage', ARRAY['Dynokinesis']::text[], 'Dynokinesis', 'Play this card to summon a storm, volcano, or other natural disaster centered on your opponent.

Deal an additional 50% additional damage from your damage roll.
Disrupt. You Take Control of the Situation for the new Situation Phase regardless of any cards that are played.', null, 'Disrupt: Triggers a new Situation Phase'),
  ('Ohm... Ohm...', '1', ARRAY['Elemental']::text[], 'On Contest', ARRAY['Absorb Energy']::text[], 'Absorb Energy', null, null, null),
  ('Power Bank', '0', ARRAY['Elemental']::text[], 'On Leave Continuance', ARRAY['Dynokinesis']::text[], 'Dynokinesis', 'Any pips still in your bank cannot be spent and are added to your bank at the start of the next round. They fade automatically at the end of the next round.', null, null),
  ('Supernova', '4', ARRAY['Elemental']::text[], 'On Damage', ARRAY['Dynokinesis']::text[], 'Dynokinesis', 'You channel all your stored energy into an explosive burst centered on your opponents that creates a noise that can be heard from miles away.

Your damage roll this turn is equal to the maximum number on your damage dice, plus 50% additional damage.

AOE', null, 'AOE: Affects all actors in your Combat Zone. Opponents who won their Contest Phase receive half damage.'),
  ('Things are Heating Up', '2', ARRAY['Elemental']::text[], 'On Damage', ARRAY['Channel Energy']::text[], 'Channel Energy', 'You gain one (1) Heat for each opponent you''ve damaged in this Combat. For every Heat you have, your Skill Cards with the prerequisite Channel Energy or Dynokinesis deal an additional +3 damage per Heat.', null, 'Buff'),
  ('Warm Ups', '2', ARRAY['Elemental']::text[], 'On Damage', ARRAY['Absorb Energy']::text[], 'Absorb Energy', 'All Skill Cards with the prerequisite Channel Energy or Dynokinesis deal an additional +3 Damage for the rest of the Combat', 'Absorb Energy is intentionally a different prerequisite than Channel Energy for this.', 'Buff'),
  ('Color Vision Goggles', '1 (to swap modes)', ARRAY['Gadgeteer']::text[], 'On Contest / On Situation', ARRAY['Chemistry']::text[], 'Chemistry', 'You developed a special type of goggle that is capable of night, infrared, x-ray, and invisibility-proof and illusion-proof goggles that can be dynamically set to the correct mode when you need them.

One mode at a time:
Night Vision: See Deep Sea Vision
Infrared: Not defined yet
X-Ray: Not defined yet
Invisibility-Proof: You can see Invisible Actors and objects. Invisible Actors do not gain any benefits or suffer any disadvantage caused by invisibility against you.
Illusion-Proof: You are immune to Mind Controlled - Illusion.', null, 'Tool'),
  ('Grapple Hook', '1', ARRAY['Gadgeteer']::text[], 'On Contest / On Enter Continuance', ARRAY['Mechanics']::text[], 'Mechanics', 'Play this card to gain the Grapple Hook status.', null, 'Weapon, Graple Hook: Lasts until you lose a Contest Roll. Each round, you can gain advantage on one Contest Roll. When you win a Contest Phase, you can move to another Combat Zone. When you move in this way, you cannot be the target of any Damage Roll from any opponent in the Combat Zone you leave and can deal Damage to an opponent in any Combat Zone who lost their Contest Phase. You then enter that Combat Zone for the next round of combat.'),
  ('Jetpack', '0', ARRAY['Gadgeteer']::text[], 'All', ARRAY['Mechanics']::text[], 'Mechanics', 'Play this card to gain the Flying status.', 'Need input from group on this one, unsure what to do. Feel like it should be similar to Grapple Hook, somehow, but also feel like maybe it should just be a reflavored Flight prerequisite.', 'Tool'),
  ('Orbital Solar Death Ray', '3', ARRAY['Gadgeteer']::text[], 'On Damage', ARRAY['Mechanics','Intellect']::text[], 'Mechanics && Intellect', 'Summon your orbital satellite to deploy a concentrated, magnified, solar laserbeam at an opponent in your current Combat Zone to immediately incinerate your opponent. The opponent takes an immediate 60 Damage, unless they possess the Absorb Energy prerequisite, in which case they only take 10 Damage.', null, null),
  ('Orbital Tractor Beam', '3', ARRAY['Gadgeteer']::text[], 'On Damage', ARRAY['Mechanics','Intellect']::text[], 'Mechanics && Intellect', 'Summon your orbital satelite to deploy its Tractor Beam against an opponent in your current Combat Zone. The opponent is forcefully pulled miles upwards in seconds, gain the Unreachable status to all actors in the Combat, and will begin to plummet towards the Earth. If they do not possess the Flight prerequisite or are Grounded, at the end of the next round they will collide with the ground and take 40 Damage. Else, they can return to the Combat Zone at the end of the next round without taking Damage.', null, null),
  ('Pedal to the Metal', '1', ARRAY['Gadgeteer']::text[], 'On Enter Damage', ARRAY['Mechanics']::text[], 'Mechanics', 'Using your propulsion or vehicle, blast or run over an opponent that lost the Contest Phase in this Combat Zone. Add +3 to your Damage Roll, and then move Escape to another Combat Zone.', 'Idea is you can only play this card if you won your Contest Phase (since it''s On Enter Damage) so only way Escape actually would negate any blows here is in a 2v1 or more with mixed results.', 'Escape: Escape Cards move you out of your current Combat Zone and make you untargetable by opponents in your current Combat Zone regardless of the outcome of the Contest Phase.'),
  ('Quick Draw', '1', ARRAY['Gadgeteer']::text[], 'On Situation / On Contest', ARRAY['Mechanics']::text[], 'Mechanics', 'The next skill card with a Weapon tag that you play costs 0 pips.', null, null),
  ('Catch Off Gaurd', '1', ARRAY['Generic']::text[], 'On Enter Damage', null, '-', 'Play this card to target an opponent in any Combat Zone who lost their Contest Phase.', null, null),
  ('Flyby', '1', ARRAY['Generic']::text[], 'On Continuance', ARRAY['Flight']::text[], 'Flight', 'Automatically succeed an Escape Attempt and become Unreachable if your opponent does not have Flight', null, null),
  ('Knife', '1', ARRAY['Generic']::text[], 'On Enter Damage', null, '-', 'Adds a flat +3 damage to your damage roll on this turn if your opponent is not bulletproof.', null, 'Weapon, Reusable: After you play this card, return it to your hand instead of discarding it.'),
  ('Rifle', '1', ARRAY['Generic']::text[], 'On Enter Damage', null, '-', 'Adds a flat +10 damage to your damage roll on this turn if your opponent is not bulletproof.', 'Had thought that doubling damage as previously discussed may be a bit OP)', 'Bullet-like, Weapon, Reusable: After you play this card, return it to your hand instead of discarding it.'),
  ('Brainstorm', '1', ARRAY['Mentalist']::text[], 'On Contest', ARRAY['Telepathy']::text[], 'Telepathy', 'You release the barriers on your psychic defenses and allow the surrounding thoughts to flood in. Take three (3) damage and remove the Stilled Mind status if you have it. Then gain the Brainstorm status.', null, 'Brainstorm: Skill Cards with the Telepathy prerequisite cost 1 fewer pips to play. An opponent may reveal a Mind-Controlling card in their hand to impose disadvantage on a Contest Roll against an Actor with this status.'),
  ('Echo Chamber', '3', ARRAY['Mentalist']::text[], 'On Damage', ARRAY['Telepathy']::text[], 'Telepathy', 'You force the opponent into a cycle of their previous thought patterns. Look at the most recent skill card that they have discarded and write down its name. The opponent gains the Mind Controlled - Echo Chamber status. They are prohibited from playing any skill card with a different name from the discarded card until they play a skill card with the same name as the discarded card.', 'Even though the status is Mind Controlled, the prerequisite is intentionally Telepathy. The intent is that certain cards will free or protect others from all Mind Controlled statuses, so this actually makes it weaker than if it were its own status', 'Mind Controlled - Echo Chamber'),
  ('Flow State', '2', ARRAY['Mentalist']::text[], 'On Contest', ARRAY['Telepathy']::text[], 'Telepathy', 'Every idea you have flows seemlessly into the next. Play this card to gain the Flow State status.', null, 'Flow State: Whenever you play a card, draw another card. This status ends when you take damage.'),
  ('Full Battle Precognition', '2', ARRAY['Mentalist']::text[], 'On Contest', ARRAY['Telepathy']::text[], 'Telepathy', 'You see and react to your opponent''s moves before they happen.
Look at your opponent''s hand, then select up to 3 cards from their hand and write their names down. 

If any of those cards are played during the Contest Phase, your oppent will have disadvantage on all remaining Contest Rolls. If any of those cards are played during the Damage Phase, all damage that you would receive from that opponent is negated for this round.', null, null),
  ('Limited Battle Precognition', '1', ARRAY['Mentalist']::text[], 'On Enter Contest', ARRAY['Telepathy']::text[], 'Telepathy', 'You catch brief glimpses into the future while your adrenaline is spiked. Play to reveal the Skill Cards in the opponent’s hand, and get advantage on the first Contest Roll.', null, null),
  ('Meditate', '1', ARRAY['Mentalist']::text[], 'On Contest', ARRAY['Telepathy']::text[], 'Telepathy', 'Your exert control over your own mind to reduce anxiety even in the midst of chaos. Play this card to gain the Stilled Mind status. If you have the Brainstorm status, this card has no effect.', null, 'Stilled Mind: You gain immunity to skill cards that rely on the prerequisite Mind Control or Telepathy. Whenever you a target of an ally''s skill card you can draw a skill card.'),
  ('Phantasmagoria', '2', ARRAY['Mentalist']::text[], 'On Damage', ARRAY['Mind Control']::text[], 'Mind Control', 'You hypnotize your opponent and trap them in a trance filled of illusions. They gain the Mind Controlled: Illusions status.', 'Think like Mysterio, except it''s not drones', 'Mind Controlled - Illusions:'),
  ('Synaptic Jolt', '2', ARRAY['Mentalist']::text[], 'All', ARRAY['Mind Control']::text[], 'Mind Control', 'Remotely scramble an opponent’s mental state before a critical moment. Play to negate the effect of the opponent’s Skill Card. The Skill Card has no effect this turn and is immediately discarded.

If the target is flying, the target falls to the ground uncontrollably and gains the Grounded status until the end of the next round.', null, 'Reative: When opponent plays Contest or Damage

Grounded: Cannot play skill cards with the prerequisite flight.'),
  ('Thought Crime', '1', ARRAY['Mentalist']::text[], 'On Contest', ARRAY['Mind Control']::text[], 'Mind Control', 'You inundate your opponent''s brain with a rush of Glutamate, triggering their fear response.

Look at your opponent''s hand, then choose a card and Exile it. Then your opponent draws a new card from their deck.', 'This is intentionally a better version of Limited Battle Precognition', 'Exile: Instead of adding this card to the discard pile when played, it is instead Exiled and cannot be reshuffled back into your deck (as the cards from your discard pile would be when your draw pile runs out of cards).'),
  ('Why are you hitting yourself?', '3', ARRAY['Mentalist']::text[], 'On Enter Contest', ARRAY['Mind Control']::text[], 'Mind Control', 'You exert complete control over an opponent''s mind. Look at the target''s skill cards. This target automatically loses the contest phase. Then use one of the target''s skill cards against itself or against another target.', null, null),
  ('Pre-show Work', '1', ARRAY['Mentalist','Gadgeteer','Magician']::text[], 'On Situation Phase', ARRAY['Telepathy','Intellect']::text[], 'Telepathy / Intellect /', 'You come prepared for any situation. Play to search your custom deck for a Skill Card and add it to your hand, then shuffle your custom deck and discard Pre-show Work.', null, 'Flexible: If you draw this card after the outcome of the Situation Phase has already been determined, at any time you can show this card to the table and then discard it and draw another card from your deck at no cost. You can also play this card when an environmental change re-triggers the Situation Phase.'),
  ('Gravity Well', '2', ARRAY['Mentalist','Magician']::text[], 'On Damage', ARRAY['Telekinesis']::text[], 'Telekinesis', 'You magnify the gravity in a region surrounding your opponents. Add +5 to your Damage Roll this turn. Your opponents automatically fail any Attempt Escape checks and cannot play or benefit from Escape cards except World Traveler.

AOE', null, 'AOE: Affects all actors in your Combat Zone. Opponents who won their Contest Phase receive half damage. Allies always receive the full damage unless a played card or specific status indicate otherwise.'),
  ('Blink Dance', '3', ARRAY['Mover']::text[], 'On Contest', ARRAY['Teleportation']::text[], 'Teleportation', 'Play this card to gain the Blink Dance status.', null, 'Blink Dance: Lasts until you take Damage. Each round, you can gain advantage on one Contest Roll. When you win a Contest Phase, you can teleport to another Combat Zone. When you teleport in this way, you cannot be the target of any Damage Roll this round and can deal Damage to an opponent in any Combat Zone who lost their contest phase. You then enter that Combat Zone.'),
  ('Cut in Line', '2', ARRAY['Mover']::text[], 'On Contest', ARRAY['Speed']::text[], 'Speed', 'Once you see an opportunity, it is impossible to stop you.

If you have won at least one (1) Contest Roll and have lost zero (0) Contest Rolls, you can immediately win the Contest and proceed to the Damage Phase.', null, null),
  ('Eke Out', '0', ARRAY['Mover']::text[], 'On Enter Contest', ARRAY['Speed']::text[], 'Speed', 'You move fast enough to eke out additional moves in the time it would take others to execute a full move. Play to add +1 pips to your bank for the remainder of this turn.', null, null),
  ('Hamster Wheel', '1', ARRAY['Mover']::text[], 'On Damage', ARRAY['Speed','Durable']::text[], 'Speed, Durable', 'Your strength is proportional to your speed. 
For each Speed card you played this round, add an additional +3 Damage to your Damage Roll.', null, null),
  ('Punch, Punch, Punch, Punch', '3', ARRAY['Mover']::text[], 'On Damage', ARRAY['Speed','Durable']::text[], 'Speed, Durable', 'You put all of your speed behind every punch, striking multiple times.

Make four (4) Damage Rolls this turn and treat each as a separate blow.', null, null),
  ('Run Away', '1 or 2', ARRAY['Mover']::text[], 'On Leave Contest / On Continuance', ARRAY['Speed']::text[], 'Speed', 'Your ability to maneuver quickly and evasively is unmatched. 

On Leave Contest (2): Escape
On Continuance (1): Play this card to immediately succeed your Escape Attempt.', 'This is a powerful card on Leave Contest because it''s essentially a get out of jail free card for when you lose Contest', 'Escape: Move you out of your current Combat Zone, and make you untargetable by opponents in your current Combat Zone. You appear in the target Combat Zone On Enter Continuance Phase'),
  ('Snap Out of It', '1', ARRAY['Mover']::text[], 'On Contest', ARRAY['Speed']::text[], 'Speed', 'You quickly slap a Mind Controlled ally in your same Combat Zone. Roll your Damage Dice. They take damage equal to 50% of the amount showed on the dice and are no longer Mind Controlled', null, null),
  ('Take it in Stride', '1', ARRAY['Mover']::text[], 'On Continuance', ARRAY['Durable']::text[], 'Durable', 'If you took damage during the damage phase of this round,', null, null),
  ('The Jump', '1', ARRAY['Mover']::text[], 'On Situation', ARRAY['Speed']::text[], 'Speed', 'Your reaction to new threats is lightning quick. Play this card to Take Control of the Situation.', null, 'Flexible: If you draw this card after the outcome of the Situation Phase has already been determined, at any time you can show this card to the table and then discard it and draw another card from your deck at no cost. You can also play this card when an environmental change re-triggers the Situation Phase.'),
  ('World Traveler', '2', ARRAY['Mover']::text[], 'On Damage / On Continuance', ARRAY['Teleportation']::text[], 'Teleportation', 'Shuffle an Instant Death Card into your deck. Deal', null, null),
  ('Adrenaline Rush', '0', ARRAY['Powerhouse']::text[], 'On Leave Continuance', ARRAY['Extrasensory']::text[], 'Extrasensory', 'Your feel your blood pumping. The capilaries in your corneas constrict and you gain focus. If this card remains in your hand at the end of Continuance Phase, this card is automatically played and you draw three (3) additional cards at the start of the next round.', null, null),
  ('Bulletproof', '0', ARRAY['Powerhouse']::text[], 'On Situation / On Contest', ARRAY['Invulnerability']::text[], 'Invulnerability', 'You are coated in metal, concrete, chitinous exoskeleton, or other hard mineral. Play this card to gain the Bulletproof status.', null, 'Bulletproof: You gain immunity to skill cards that have the tag Weapon (and also Puncture in the Retractable Claws skill card)'),
  ('Deep Tissue Massage', '2', ARRAY['Powerhouse']::text[], 'On Contest', ARRAY['Strength','Extrasensory']::text[], 'Stength && Extrasesensory', 'Quickly deliver a massage to an ally''s pressure points to restore their energy. Select an ally in your Combat Zone. The targeted ally restores +2 pips.

Exile', null, 'Exile: Instead of adding this card to the discard pile when played, it is instead Exiled and cannot be reshuffled into your deck.'),
  ('Elbow Grease', '3 (to start)', ARRAY['Powerhouse']::text[], 'On Damage', ARRAY['Strength']::text[], 'Strength', 'You know how to put in the effort to deal with stubborn obstacles. Add an additional +10 to your damage roll this turn. Reduce the cost of this skill card by one (1) pip for every Skill Card you played this turn that had the Strength prerequisite. Minimum Cost: 0', 'Stole this idea from Slay the Spire', null),
  ('Flying Wheelbarrow', '3', ARRAY['Powerhouse']::text[], 'On Damage', ARRAY['Flight','Strength']::text[], 'Flight, Strength', 'You pick up and drag an opponent violently across a long strip of land.

You can add +10 to your Damage Roll. Select another Combat Zone, or optionally create a new Combat Zone. You and your opponent enter that Combat Zone. You may select an opponent in the new Combat Zone to also receive the damage from your Damage Roll.', null, null),
  ('Growing Fury', '2', ARRAY['Powerhouse']::text[], 'On Damage', ARRAY['Strength','Extrasensory']::text[], 'Strength, Extrasensory', 'Your fury builds and builds. Immediately gain one (1) fury. Add +5 Damage for each stack of fury that you have.', 'Stole idea from Slay the Spire technically, but actually they stole it from Pokemon first IMO.', null),
  ('Healing Factor', '1', ARRAY['Powerhouse']::text[], 'On Leave Contest Phase or Enter Continuance Phase', ARRAY['Healing']::text[], 'Healing', 'Heal an amount equal to a roll on your damage die.', null, null),
  ('Last Stand', '2', ARRAY['Powerhouse']::text[], 'On Enter Damage', ARRAY['Invulnerability','Strength']::text[], 'Invulnerable && Strength', 'You push yourself to the edge of your power’s limit. If your current hp is below half of your maximum hp when you play this card, you are blocked from drawing cards for the remainder of the fight. Your damage rolls increase for the remainder of the fight by +15.', null, null),
  ('Meteor Punch', '3', ARRAY['Powerhouse']::text[], 'On Damage', ARRAY['Flight','Strength']::text[], 'Flight, Strength', 'You fly into an opponent with all your mass and with gravity on your side, landing a direct punch.

You can add +25 to your Damage Roll.', null, null),
  ('Stand Against the Tide', '1', ARRAY['Powerhouse']::text[], 'On Enter Damage', ARRAY['Invulnerability']::text[], 'Invulnerable', 'Reduce all incoming damage rolls by 3hp.', '(Note: Idea is that this would be played against multiple opponents at the same time or against speedsters so that the -3 incoming damage is applied more than once)', null),
  ('Tank it on the Chin', '1', ARRAY['Powerhouse']::text[], 'On Continuance', ARRAY['Invulnerability']::text[], 'Invulnerable', 'If you took damage during the damage phase of this round,', null, null),
  ('Roll with the Punches', '2', ARRAY['Powerhouse','Gadgeteer']::text[], 'On Enter Damage', ARRAY['Strength','Intellect']::text[], 'Strength || Intellect', 'You are skilled in pugilism and battle tactics. You can draw a card from your custom deck whenever you take damage from a damage roll.', null, null),
  ('Acute Vision', '1', ARRAY['Shape Changer']::text[], 'On Situation / On Damage', ARRAY['Flying Form']::text[], 'Flying Form', 'Your flying adaptations have increased your ability to discern detail, including picking out the weak points on enemies. 

You can play this card during the Situation Phase to Take Control of the Situation when one or more of your opponents is far away, but still within line of sight. 

You can also play this card during Damage Phase to roll an additional damage dice and add an additional +5 to your Damage Roll. Your next Damage Roll also gains an additional +5 Damage.', null, null),
  ('Bloodhound', '1', ARRAY['Shape Changer']::text[], 'On Situation / On Continuance', null, 'Land Form', 'Your land adaptations have increased your ability to pick up and track the scents of living creatures. 

You can play this card during the Situation Phase to Take Control of the Situation when your opponent is hiding from your vision.

You can also play this card during the Continuance Phase to immediately succeed in preventing your opponent from Escaping Combat and block them from playing Escape Cards, unless that card would make your opponent Unreachable. 

If you block your opponent from Escaping or block them from playing a Continuance Phase card that would allow them to Escape, you Take Control of the Situation during the next round of combat.', null, 'Unreachable: Your opponent is Unreachable and automatically succeeds in an Escape Attempt.'),
  ('Deep Sea Sight', '1', ARRAY['Shape Changer']::text[], 'On Situation / On Enter Contest', ARRAY['Water Form']::text[], 'Water Form', 'Your underwater adaptations allow you to see better in darkness. You can play this card during the Situation Phase to Take Control of the Situation in Dim Light or Darkness.

You can also play this card during the Contest Phase in Dim Light or Darkness to gain advantage on two (2) Contest Rolls.', null, null),
  ('Devour', '3', ARRAY['Shape Changer']::text[], 'On Enter Damage', null, 'Land Form', 'You transform into a beast capable of quickly gorging on a weakened opponent and incorporating their body into yours. If you reduce an opponent to 0hp this turn, you quickly eat them and regain hit points equal to one half of their maximum hp.', 'Stole this idea from Cho''Gath League of Legends', null),
  ('Gouge', '2', ARRAY['Shape Changer']::text[], 'On Damage', ARRAY['Flying Form']::text[], 'Flying Form', 'You lash out at your opponent''s with sharp talons from above. In addition to your normal Damage Roll, your opponent becomes Blinded until the end of the next round.', null, 'Blinded:'),
  ('Go With The Flow', '0', ARRAY['Shape Changer']::text[], 'On Contest', ARRAY['Water Form']::text[], 'Water Form', 'When you lose a Contest Roll, play this card to gain advantage on the next Contest Roll.', null, null),
  ('Goopify', '1', ARRAY['Shape Changer']::text[], 'On Leave Contest', ARRAY['Water Form']::text[], 'Water Form', 'You melt away into a viscous liquid. Block one blow on this turn''s Damage Phase.', null, null),
  ('Increased Metabolism', '0', ARRAY['Shape Changer']::text[], 'On Contest', ARRAY['Water Form']::text[], 'Water Form', 'If you have 0 pips remaining, you can play this card to regain +2 pips for the remainder of this round. Then Exile this card for the rest of combat.', 'Exile is an idea stolen from Magic / stolen from Slay the Spire''s "Exhaust". Basically intent is this card is only ever played once per Combat.', 'Exile: Instead of adding this card to the discard pile when played, it is instead Exiled and cannot be reshuffled into your deck.'),
  ('Melt Away', '2', ARRAY['Shape Changer']::text[], 'On Contest Phase', ARRAY['Water Form']::text[], 'Water Form', 'When you have only lost one (1) or fewer Contest Rolls in this round, you can play this card to melt into a watery or goopy form, then move to another Combat Zone avoiding incoming blows.

Escape', 'This is a worse version of Run Away now', 'Escape: Escape Cards move you out of your current Combat Zone, and make you untargetable by opponents in your current Combat Zone. You appear in the target Combat Zone On Enter Continuance Phase'),
  ('Pecking Order', '3', ARRAY['Shape Changer']::text[], 'On Contest', ARRAY['Flying Form']::text[], 'Flying Form', 'When fighting multiple opponents, dive bomb the group and create a cascading extra damage effect. The first opponent takes standard damage from your damage roll. Each subsequent opponent takes 2x the damage of the previous opponent.', null, null),
  ('Portuguese Man Of War', '2', ARRAY['Shape Changer']::text[], 'On Damage', ARRAY['Water Form']::text[], 'Water Form', 'You lash out with a wet tentacle that stings an opponent. Roll your Damage Roll normally. Look at the amount shown on the die. Then reference this table for the affect:

1 - 4: No Effect
5 - 8: One of the opponent''s limbs is partially disabled. They automatically fail all Escape Attempts.
9 - 12: Your oppenent is partially paralyzed. In addition to the above affects, they have disadvantage on their next Contest Roll.
>13: Your opponent is partially incapacitated. Select up to four cards to bind and add them to a seperate Bound Hand for your opponent. When 1 bound card is played, no other Bound cards can be played this round.', null, null),
  ('Pull Yourself Together', '1', ARRAY['Shape Changer']::text[], 'On Continuance Phase', ARRAY['Water Form']::text[], 'Water Form', 'Play to end all Mind Controlled statuses on yourself.', null, 'Mind Controlled: Has various types of effects depending on the type of Mind Control'),
  ('Retractable Claws', '(3 Damage, 1 Continuance)', ARRAY['Shape Changer']::text[], 'On Damage / On Continuance', null, 'Land Form', 'Your retractable claws are of indestructible metallic material. 

Play this card during the Continuance Phase to immediately succeed in an Escape Attempt and gain the Climbing status. If you are near a steep or vertical surface. You become Unreachable if no opponent you are facing has flight, the Grapple Hook status, or the Climbing status. 

Play this card during Damage Phase to Slash or Puncture as described: 

Slash: You violently slash with both arms. Roll your damage dice twice, and deal damage once for each blow.

Puncture: You strike an opponent before quickly extending your retractable claw to puncture their skin. Roll your Damage Dice. If your opponent is not bulletproof, double your damage from the blow.', 'Trying to make Wolverine into a single card', null),
  ('Swarm', '1', ARRAY['Shape Changer']::text[], 'On Damage', ARRAY['Flying Form']::text[], 'Flying Form', 'You divide yourself into a swarm of wasps, piranhas, termites, or other swarming animal to sting your opponent. Instead of dealing one blow with your damage roll this turn, you instead deal a number of blows equal to the number rolled on your damage dice, each dealing one (1) hp of damage.', null, null),
  ('Trample', '2', ARRAY['Shape Changer']::text[], 'On Damage', null, 'Land Form', null, null, null),
  ('Underdog', '2', ARRAY['Shape Changer']::text[], 'On Contest', ARRAY['Flying Form']::text[], 'Land Form && Flying Form', 'You do well when up against a stronger opponent. If your opponent has a higher Max HP than you, Damage Rolls against that opponent gain +1 damage against that opponent for the rest of the Combat.', null, null),
  ('Venomous', '2', ARRAY['Shape Changer']::text[], 'On Damage', null, 'Land Form', 'You lash out at your opponent with venomous fangs, claws, or a venemous stinger. Inflict the Poisoned status on your opponent for 5 rounds.', 'I stole this idea from somewhere, unsure if it was Slay the Spire', 'Poisoned: A poisoned Actor takes poison damage equal to the number of rounds remaining of Poisoned On Enter Continuance Phase.'),
  ('Glass Cannon', '2', ARRAY['Generic']::text[], 'On Damage', null, '-', 'Gain the Glass Cannon Status', null, 'Glass Cannon: All damage you deal is tripled, but all damage you receive is also tripled.'),
  ('Pass the Torch', '1', ARRAY['Elemental']::text[], 'On Contest', ARRAY['Absorb Energy']::text[], 'Absorb Energy', null, null, null),
  ('Conditioning', '2', ARRAY['Generic']::text[], 'On Damage', null, '-', 'Increase your max hand size by 2', null, null),
  ('Bulking', null, ARRAY['Powerhouse']::text[], null, null, null, null, null, null),
  ('Hulk Out', '2', ARRAY['Powerhouse']::text[], null, ARRAY['Strength','Invulnerability']::text[], 'Strength, Invulnerable', 'You grow to massive size. You gain the Bulletproof Status if you do not already have it. In addition, you add +5 to all damage rolls for the remainder of this Combat.', null, null),
  ('Magic Mirror', '1', ARRAY['Magician']::text[], null, null, null, 'Copy the effect of the last card you played', null, null),
  ('Heroic Sacrifice', '3', ARRAY['Generic']::text[], 'On Damage', null, '-', 'Shuffle an Instant Death card into your deck. Deal 100 Damage to an opponent.', null, null),
  ('Clarvoyance', '1', ARRAY['Telepathy']::text[], 'On Situation', ARRAY['Telepathy']::text[], 'Telepathy', null, null, null);