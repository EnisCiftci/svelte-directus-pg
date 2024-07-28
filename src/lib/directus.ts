import { PUBLIC_DIRECTUS_URL } from "$env/static/public";
import { createDirectus, rest } from "@directus/sdk";

function getDirectusInstance(
    fetch:
        | ((input: URL | RequestInfo, init?: RequestInit | undefined) => Promise<Response>)
        | undefined
) {
    const options = fetch ? { globals: { fetch } } : {};
    const directus = createDirectus(PUBLIC_DIRECTUS_URL, options).with(rest());
    return directus;
}

export default getDirectusInstance;
