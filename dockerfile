FROM node:18

FROM node:18

WORKDIR /app
COPY . .

RUN npm install -g pnpm
RUN pnpm install
RUN pnpm add mysql -w

WORKDIR /app/packages/nocodb

RUN pnpm install

EXPOSE 8080
CMD ["pnpm", "start"]
