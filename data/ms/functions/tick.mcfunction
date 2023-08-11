#built using mc-build, Datapack By Mizab

execute as @a[predicate=ms:horse_sword] at @s run function ms:particle/horse_sword
execute as @a[predicate=ms:blaze_sword] at @s run function ms:particle/blaze_sword
execute as @a[predicate=ms:blaze_sword,predicate=ms:is_sneaking] at @s run function ms:particle/blaze_sword_fly
execute as @a[predicate=ms:blaze_sword,predicate=!ms:is_sneaking] at @s run effect clear @s levitation
execute as @a[predicate=ms:squid_sword] at @s run function ms:particle/squid_sword
execute as @a[predicate=ms:creeper_sword] at @s run function ms:particle/creeper_sword
execute as @a[predicate=ms:shulker_sword] at @s run function ms:particle/shulker_sword
execute as @a[predicate=ms:squid_sword] at @s run function ms:particle/squid_sword
execute as @a[predicate=ms:slime_sword] at @s run function ms:particle/slime_sword
execute as @a[predicate=ms:enderman_sword] at @s run function ms:particle/enderman_sword
execute as @a[predicate=ms:dragon_sword] at @s run function ms:particle/dragon_sword
execute as @a[predicate=ms:wither_skeleton_sword] at @s run function ms:particle/wither_skeleton_sword
execute as @a[predicate=ms:wither_skeleton_sword,predicate=ms:is_sneaking] at @s run function ms:particle/wither_skeleton_sword_fly
execute as @a[predicate=ms:wither_skeleton_sword,predicate=!ms:is_sneaking] at @s run effect clear @s levitation
execute as @a[predicate=ms:evoker_sword] at @s run function ms:particle/evoker_sword
execute as @a if predicate ms:has_totem unless predicate ms:evoker_sword run replaceitem entity @s weapon.offhand air
execute as @e[nbt={HurtTime:1s}] at @s run function ms:__generated__/execute/0
execute as @e[nbt={HurtTime:10s}] at @s run function ms:__generated__/execute/1