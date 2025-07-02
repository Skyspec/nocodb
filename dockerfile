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
RUN pnpm run build
EXPOSE 8080
RUN printenv > /app/env.log
CMD ["pnpm", "start"]
