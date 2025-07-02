FROM node:18

WORKDIR /app
COPY . .

RUN npm install -g pnpm
RUN pnpm install

# Bootstrap the monorepo (builds SDK, GUI, backend)
RUN pnpm run bootstrap

WORKDIR /app/packages/nocodb
RUN pnpm install
RUN pnpm add mysql

EXPOSE 8080
CMD ["pnpm", "start"]
