FROM node:18

WORKDIR /app
COPY . .

RUN npm install -g pnpm

# Install all workspace dependencies at the root
RUN pnpm install

# Add mysql to the backend workspace specifically (best practice for monorepo)
WORKDIR /app/packages/nocodb
RUN pnpm add mysql

EXPOSE 8080
CMD ["pnpm", "start"]
