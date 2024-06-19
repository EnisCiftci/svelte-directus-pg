FROM node:20-alpine AS sveltekit

WORKDIR /app

COPY . .

RUN npm install --force

RUN npm run build 

RUN rm -rf src/ static/ docker-compose.yml

USER node:node

EXPOSE 3000

CMD ["node", "build/index.js"]