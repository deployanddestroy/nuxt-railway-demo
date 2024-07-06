# Define args to use throughout the file
ARG NODE_VERSION=20.15.0
ARG PORT=3000

# Define the base image to use for the build
FROM node:${NODE_VERSION}-slim as base
ENV NODE_ENV=production
WORKDIR /src

# First, copy over the package.json files and run npm install
# --link produces a separate layer
FROM base as build
COPY --link package.json .
RUN npm install --omit=dev

# Then we copy the rest of the application and run the build command
COPY --link . .
RUN npm run build

# Delete unused packages to reduce image size
RUN npm prune

# Finally, using the base image, copy the build output
FROM base
ENV PORT=${PORT}
COPY --from=build /src/.output /src/.output
# And expose the port
EXPOSE 3000

# And run the server!
CMD ["node", ".output/server/index.mjs"]