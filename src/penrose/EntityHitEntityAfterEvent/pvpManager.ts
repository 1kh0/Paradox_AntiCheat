import { world, Player, EntityHitEntityAfterEvent } from "@minecraft/server";
import { sendMsg, sendMsgToPlayer } from "../../util.js";
import { MinecraftEffectTypes } from "../../node_modules/@minecraft/vanilla-data/lib/index";

let counter = 0;
let lastAttackedName: string;

function pvp(obj: EntityHitEntityAfterEvent) {
    // Properties from class
    const { damagingEntity, hitEntity } = obj;
    // If not a player entity then ignore
    if (!(hitEntity instanceof Player) || !(damagingEntity instanceof Player)) {
        return;
    }
    if (hitEntity.hasTag("pvpDisabled")) {
        sendMsgToPlayer(damagingEntity, `§f§4[§6Paradox§4]§f This player has PVP Disabled!`);
        // Add Effects
        const effectsToAdd = [MinecraftEffectTypes.InstantHealth];
        for (const effectType of effectsToAdd) {
            hitEntity.addEffect(effectType, 5, { amplifier: 255, showParticles: false });
        }
        if (hitEntity.name === lastAttackedName) {
            counter++;
        } else {
            lastAttackedName = hitEntity.name;
            counter = 0;
        }
        if (counter == 10) {
            sendMsg("@a[tag=paradoxOpped]", `§f§4[§6Paradox§4]§f §7${damagingEntity.name}§f has attacked §7${hitEntity.name}§f while §7${hitEntity.name}§f has PVP disabled.`);
            counter = 0;
        }
    }
}
export const PVP = () => {
    world.afterEvents.entityHitEntity.subscribe(pvp);
};
