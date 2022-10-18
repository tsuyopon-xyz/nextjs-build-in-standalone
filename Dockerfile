FROM node:16 AS builder

WORKDIR /app
COPY package.json ./
COPY package-lock.json ./
RUN npm install
COPY . .
RUN npm run build

# ---------------------------------------------------

FROM node:16-stretch-slim AS runner
# FROM node:16-alpine AS runner
ENV NODE_ENV=production
ENV PORT=8080

WORKDIR /app

# standalone モードを利用すると、publicと.next/staticはデフォルトでは含まれないので明示的にコピーする必要があります
COPY --from=builder /app/next.config.js ./
COPY --from=builder /app/public ./public
COPY --from=builder /app/.next/static ./.next/static

COPY --from=builder /app/.next/standalone ./
CMD ["node", "server.js"]

# ---------------------------------------------------

FROM node:16-stretch-slim AS dev
WORKDIR /app
CMD ["npm", "run", "dev"]
