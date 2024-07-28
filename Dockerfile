FROM node:20-alpine AS builder
ARG PUBLIC_DIRECTUS_URL
ENV PUBLIC_DIRECTUS_URL $PUBLIC_DIRECTUS_URL
WORKDIR /app
COPY package*.json .
RUN npm i --force
COPY . .
RUN npm run build

FROM node:20-alpine
WORKDIR /app
COPY --from=builder /app/build build/
COPY --from=builder /app/node_modules node_modules/
COPY package.json .
EXPOSE 3000
ENV NODE_ENV=production
CMD [ "node", "build" ]