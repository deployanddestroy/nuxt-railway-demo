export default defineEventHandler(async () => {
    const factResponse = await fetch('https://catfact.ninja/facts');
    if (factResponse.ok) {
        return await factResponse.json();
    }
    throw createError({
        statusCode: 400,
        statusMessage: `Couldn't get all cat facts due to an error: ${factResponse.status} - ${await factResponse.text()}`,
    })
})