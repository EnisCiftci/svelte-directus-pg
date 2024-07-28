import getDirectusInstance from "$lib/directus.js";
import { readItems } from "@directus/sdk";

export async function load({ fetch }) {
    const directus = getDirectusInstance(fetch);
    return {
        global: await directus.request(readItems("global")),
    };
}
