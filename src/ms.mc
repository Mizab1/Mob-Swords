function load{
    scoreboard objectives add LANG_MC_INTERNAL dummy
    tellraw @a [{"text": "Console=>","color": "green"},{"text": " Loaded","color": "white"}]
}

function tick{
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

    execute as @e[nbt={HurtTime:1s}] at @s run{
        execute if entity @a[distance=1..4,predicate=ms:evoker_sword] run function ms:effect/evoker_sword
    }

    execute as @e[nbt={HurtTime:10s}] at @s run{
        execute if entity @a[distance=1..4,predicate=ms:creeper_sword] run function ms:effect/creeper_sword

        execute if entity @a[distance=1..4,predicate=ms:enderman_sword] run function ms:effect/enderman_sword

        execute if entity @a[distance=1..4,predicate=ms:shulker_sword] run function ms:effect/shulker_sword

        execute if entity @a[distance=1..4,predicate=ms:wither_skeleton_sword] run function ms:effect/wither_skeleton_sword

        execute if entity @a[distance=1..4,predicate=ms:slime_sword] run function ms:effect/slime_sword

        execute if entity @a[distance=1..4,predicate=ms:evoker_sword] run function ms:effect/evoker_sword

        execute if entity @a[distance=1..4,predicate=ms:squid_sword] run function ms:effect/squid_sword

        execute if entity @a[distance=1..4,predicate=ms:dragon_sword] run function ms:effect/dragon_sword
    }
}

dir give_swords{
    function give_all{
        function ms:give_swords/horse_sword
        function ms:give_swords/creeper_sword
        function ms:give_swords/enderman_sword
        function ms:give_swords/shulker_sword
        function ms:give_swords/wither_skeleton_sword
        function ms:give_swords/slime_sword
        function ms:give_swords/evoker_sword
        function ms:give_swords/blaze_sword
        function ms:give_swords/dragon_sword
        function ms:give_swords/squid_sword
    }

    function horse_sword{
        give @s diamond_sword{display:{Name:'{"text":"Horse Sword","color":"#ABD8FF","italic":false}'},CustomModelData:110001,AttributeModifiers:[{AttributeName:"generic.movement_speed",Name:"generic.movement_speed",Amount:0.1,Operation:0,UUID:[I;-1523225609,412306935,-1597740971,-15377870],Slot:"mainhand"}],HideFlags:1,Enchantments:[{id:"minecraft:knockback",lvl:3s}]} 1
    }

    function creeper_sword{
        give @s diamond_sword{display:{Name:'{"text":"Creeper Sword","color":"#ABD8FF","italic":false}'},CustomModelData:110002}
    }

    function enderman_sword{
        give @s diamond_sword{display:{Name:'{"text":"Enderman Sword","color":"#ABD8FF","italic":false}'},CustomModelData:110003,AttributeModifiers:[{AttributeName:"generic.max_health",Name:"generic.max_health",Amount:6,Operation:0,UUID:[I;870907595,936266847,-1708026208,-326309129],Slot:"mainhand"}]} 1
    }

    function shulker_sword{
        give @s diamond_sword{display:{Name:'{"text":"Shulker Sword","color":"#ABD8FF","italic":false}'},CustomModelData:110004}
    }

    function wither_skeleton_sword{
        give @s diamond_sword{display:{Name:'{"text":"Wither Sword","color":"#ABD8FF","italic":false}'},AttributeModifiers:[{AttributeName:"generic.max_health",Name:"generic.max_health",Amount:10,Operation:0,UUID:[I;870907595,936266847,-1708026208,-326309129],Slot:"mainhand"}],CustomModelData:110005}
    }

    function slime_sword{
        give @s diamond_sword{display:{Name:'{"text":"Slime Sword","color":"#ABD8FF","italic":false}'},CustomModelData:110006}
    }

    function evoker_sword{
        give @s diamond_sword{display:{Name:'{"text":"Evoker Sword","color":"#ABD8FF","italic":false}'},CustomModelData:110007}
    }

    function blaze_sword{
        give @s diamond_sword{display:{Name:'{"text":"Blaze Sword","color":"#ABD8FF","italic":false}'},HideFlags:1,CustomModelData:110008,Enchantments:[{id:"minecraft:fire_aspect",lvl:2s}]} 1
    }

    function dragon_sword{
        give @s diamond_sword{display:{Name:'{"text":"Dragon Sword","color":"#ABD8FF","italic":false}'},HideFlags:1,CustomModelData:110009,AttributeModifiers:[{AttributeName:"generic.max_health",Name:"generic.max_health",Amount:20,Operation:0,UUID:[I;870907595,936266847,-1708026208,-326309129],Slot:"mainhand"}],Enchantments:[{id:"minecraft:knockback",lvl:5s}]} 1
    }

    function squid_sword{
        give @s diamond_sword{display:{Name:'{"text":"Squid Sword","color":"#ABD8FF","italic":false}'},CustomModelData:110010} 1
    }
}

dir effect{
    
    function creeper_sword{
        effect give @a[distance=1..4] resistance 1 225 true 
        summon creeper ~ ~ ~ {Fuse:0,ExplosionRadius:1b}
    }

    function enderman_sword{
        spreadplayers ~ ~ 8 9 false @s
    }

    function shulker_sword{
        effect give @s levitation 1 10 true
        particle totem_of_undying ~ ~ ~ 0.5 0.5 0.5 0.1 250 normal @a
    }

    function wither_skeleton_sword{
        effect give @s wither 6 1 true
    }

    function slime_sword{
        effect give @s slowness 3 5 true
        LOOP(50,i){
            particle block slime_block ~ ~ ~ 0 0 0 1 50 normal @a
        }
    }

    function evoker_sword{
        summon evoker_fangs ~ ~ ~

        summon evoker_fangs ~1 ~ ~-1
        summon evoker_fangs ~-1 ~ ~1

        summon evoker_fangs ~1 ~ ~1
        summon evoker_fangs ~-1 ~ ~-1

        summon evoker_fangs ~ ~ ~1
        summon evoker_fangs ~ ~ ~-1

        summon evoker_fangs ~1 ~ ~
        summon evoker_fangs ~-1 ~ ~
    }

    function dragon_sword{
        summon dragon_fireball ~ ~ ~ {life:0,direction:[0.0,-10.0,0.0],power:[0.0,-10.0,0.0]}
    }

    function squid_sword{
        effect give @s blindness 4 1 true
        particle dust 0.000 0.000 0.000 4 ~ ~ ~ 1.5 1.5 1.5 0.1 250 normal
    }
}

dir particle{
    function horse_sword{
        particle dust 0.753 1.000 0.169 2 ~ ~ ~ 0.459 0.533 1.000 1 0 normal @a
    }

    function squid_sword{
        particle minecraft:dolphin ~ ~ ~ 0.5 0.5 0.5 1 100 normal @a
    }

    function blaze_sword{
        particle flame ~ ~ ~ 0 0 0 0.05 5 normal
        effect give @s fire_resistance 1 2 true
    }

    function blaze_sword_fly{
        particle flame ~ ~ ~ 0 0 0 0.05 5 normal @a
        effect give @s levitation 1 4 true
        effect give @s resistance 5 4 true
    }

    function evoker_sword{
        replaceitem entity @p weapon.offhand totem_of_undying 1
    }

    function creeper_sword{
        effect give @s minecraft:resistance 1 3 true
    }

    function shulker_sword{
        effect give @s minecraft:resistance 1 3 true
    }

    function squid_sword{
        effect give @s dolphins_grace 1 1 true
        effect give @s water_breathing 1 3 true
    }

    function slime_sword{
        effect give @s jump_boost 1 3 true
    }

    function enderman_sword{
        particle minecraft:reverse_portal ~ ~ ~ 0.5 0.5 0.5 0 10 normal @a
    }

    function dragon_sword{
        effect give @s resistance 1 2 true
        effect give @s regeneration 3 1 true
         
    }
    function wither_skeleton_sword{
        effect give @s resistance 1 2 true
         
    }
    function wither_skeleton_sword_fly{
        particle dust 0.094 0.09 0.09 2 ~ ~ ~ 0 0 0 0.1 5 normal
        effect give @s levitation 1 5 true
        effect give @s resistance 5 4 true
    }
}

dir recipes{
    function blaze_sword{
        recipe take @s ms:blaze_sword
        advancement revoke @s only ms:blaze_sword
        function ms:give_swords/blaze_sword
        clear @s minecraft:knowledge_book
    }
    function horse_sword{
        recipe take @s ms:horse_sword
        advancement revoke @s only ms:horse_sword
        function ms:give_swords/horse_sword
        clear @s minecraft:knowledge_book
    }
    function enderman_sword{
        recipe take @s ms:enderman_sword
        advancement revoke @s only ms:enderman_sword
        function ms:give_swords/enderman_sword
        clear @s minecraft:knowledge_book
    }
    function shulker_sword{
        recipe take @s ms:shulker_sword
        advancement revoke @s only ms:shulker_sword
        function ms:give_swords/shulker_sword
        clear @s minecraft:knowledge_book
    }
    function wither_skeleton_sword{
        recipe take @s ms:wither_skeleton_sword
        advancement revoke @s only ms:wither_skeleton_sword
        function ms:give_swords/wither_skeleton_sword
        clear @s minecraft:knowledge_book
    }
    function slime_sword{
        recipe take @s ms:slime_sword
        advancement revoke @s only ms:slime_sword
        function ms:give_swords/slime_sword
        clear @s minecraft:knowledge_book
    }
    function evoker_sword{
        recipe take @s ms:evoker_sword
        advancement revoke @s only ms:evoker_sword
        function ms:give_swords/evoker_sword
        clear @s minecraft:knowledge_book
    }
    function dragon_sword{
        recipe take @s ms:dragon_sword
        advancement revoke @s only ms:dragon_sword
        function ms:give_swords/dragon_sword
        clear @s minecraft:knowledge_book
    }
    function creeper_sword{
        recipe take @s ms:creeper_sword
        advancement revoke @s only ms:creeper_sword
        function ms:give_swords/creeper_sword
        clear @s minecraft:knowledge_book
    }
    function squid_sword{
        recipe take @s ms:squid_sword
        advancement revoke @s only ms:squid_sword
        function ms:give_swords/squid_sword
        clear @s minecraft:knowledge_book
    }
}

function rule_1{
    tellraw @s {"text": "1. You have to kill the mob to Get their Heads","color": "gold"}
    tellraw @s {"text": "2. You can find the End Portal in the Ice Spike","color": "gold"}
    tellraw @s {"text": "3. You can find the wat leading Nether Portal in front the Ice Spike or at -60 65 225","color": "gold"}
}

dir prop{
    function enderman_sword{
        tellraw @s {"text": "1. Tp the enemy you hit","color": "green"}
        tellraw @s {"text": "2. Give the Holder 3 extra Hearts","color": "green"}
    }
    function horse_sword{
        tellraw @s {"text": "1. Have Attack Knockback","color": "green"}
        tellraw @s {"text": "2. Give the Holder Speed Boost","color": "green"}
    }
    function creeper_sword{
        tellraw @s {"text": "1. Deal damage with Explosion","color": "green"}
        tellraw @s {"text": "2. Give the Holder Explosion Resistance","color": "green"}
    }
    function squid_sword{
        tellraw @s {"text": "1. Give Blindness and smoke to the enemy","color": "green"}
        tellraw @s {"text": "2. Give the Holder Dolphin and Underwater Breathing effect","color": "green"}
    }
    function shulker_sword{
        tellraw @s {"text": "1. Gives levitation to the enemy","color": "green"}
        tellraw @s {"text": "2. Give the Holder Resistance Effect","color": "green"}
    }
    function dragon_sword{
        tellraw @s {"text": "1. Create Dragon Breath where the enemy is standing and give very high knowback","color": "green"}
        tellraw @s {"text": "2. Give the Holder 10 extra Hearts","color": "green"}
        tellraw @s {"text": "3. Give Resistance","color": "green"}
        tellraw @s {"text": "4. Give Regeneration","color": "green"}
    }
    function slime_sword{
        tellraw @s {"text": "1. Gives the enemy Slowness Effect when hit","color": "green"}
        tellraw @s {"text": "2. Give the Holder Jump Boost Effect","color": "green"}
    }
    function evoker_sword{
        tellraw @s {"text": "1. Summon an Evoker Frangs at the foots of the rival","color": "green"}
        tellraw @s {"text": "2. Spawns a totem on the left hand of the Holder","color": "green"}
    }
    function blaze_sword{
        tellraw @s {"text": "1. Have Fire Aspect","color": "green"}
        tellraw @s {"text": "2. Give the Holder Flying Ability when Sneak","color": "green"}
    }
    function wither_sword{
        tellraw @s {"text": "1. Give the Holder 5 extra Hearts","color": "green"}
        tellraw @s {"text": "2. Give the Holder Flying Ability when Sneak","color": "green"}
        tellraw @s {"text": "3. Give Resistance to the Holder","color": "green"}
    }
}