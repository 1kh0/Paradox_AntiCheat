import { getPrefix, sendMsg, sendMsgToPlayer } from "../../util.js";
import config from "../../data/config.js";
import { BeforeChatEvent, Player, world } from "@minecraft/server";
import { NukerA } from "../../penrose/blockbreakevent/nuker/nuker_a.js";
import { dynamicPropertyRegistry } from "../../penrose/worldinitializeevent/registry.js";

function antinukeraHelp(player: Player, prefix: string, antiNukerABoolean: string | number | boolean) {
    let commandStatus: string;
    if (!config.customcommands.antinukera) {
        commandStatus = "§6[§4DISABLED§6]§r";
    } else {
        commandStatus = "§6[§aENABLED§6]§r";
    }
    let moduleStatus: string;
    if (antiNukerABoolean === false) {
        moduleStatus = "§6[§4DISABLED§6]§r";
    } else {
        moduleStatus = "§6[§aENABLED§6]§r";
    }
    return sendMsgToPlayer(player, [
        `\n§4[§6Command§4]§r: antinukera`,
        `§4[§6Status§4]§r: ${commandStatus}`,
        `§4[§6Module§4]§r: ${moduleStatus}`,
        `§4[§6Usage§4]§r: antinukera [optional]`,
        `§4[§6Optional§4]§r: help`,
        `§4[§6Description§4]§r: Checks player's for nuking blocks.`,
        `§4[§6Examples§4]§r:`,
        `    ${prefix}antinukera`,
        `    ${prefix}antinukera help`,
    ]);
}

/**
 * @name antinukerA
 * @param {BeforeChatEvent} message - Message object
 * @param {string[]} args - Additional arguments provided (optional).
 */
export function antinukerA(message: BeforeChatEvent, args: string[]) {
    // validate that required params are defined
    if (!message) {
        return console.warn(`${new Date()} | ` + "Error: ${message} isnt defined. Did you forget to pass it? (./commands/settings/antinukera.js:36)");
    }

    message.cancel = true;

    const player = message.sender;

    // Get unique ID
    const uniqueId = dynamicPropertyRegistry.get(player?.id);

    // Make sure the user has permissions to run the command
    if (uniqueId !== player.name) {
        return sendMsgToPlayer(player, `§r§4[§6Paradox§4]§r You need to be Paradox-Opped to use this command.`);
    }

    // Get Dynamic Property Boolean
    const antiNukerABoolean = dynamicPropertyRegistry.get("antinukera_b");

    // Check for custom prefix
    const prefix = getPrefix(player);

    // Was help requested
    const argCheck = args[0];
    if ((argCheck && args[0].toLowerCase() === "help") || !config.customcommands.antinukera) {
        return antinukeraHelp(player, prefix, antiNukerABoolean);
    }

    if (antiNukerABoolean === false) {
        // Allow
        dynamicPropertyRegistry.set("antinukera_b", true);
        world.setDynamicProperty("antinukera_b", true);
        sendMsg("@a[tag=paradoxOpped]", `§r§4[§6Paradox§4]§r ${player.nameTag}§r has enabled §6AntiNukerA§r!`);
        NukerA();
    } else if (antiNukerABoolean === true) {
        // Deny
        dynamicPropertyRegistry.set("antinukera_b", false);
        world.setDynamicProperty("antinukera_b", false);
        sendMsg("@a[tag=paradoxOpped]", `§r§4[§6Paradox§4]§r ${player.nameTag}§r has disabled §4AntiNukerA§r!`);
    }
}
