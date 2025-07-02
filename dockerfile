FROM node:18

WORKDIR /app
COPY . .

# Install pnpm
RUN npm install -g pnpm

# Install dependencies with pnpm
RUN pnpm install

# Install mysql (add to devDependencies if you want, or force here)
RUN pnpm add mysql

EXPOSE 8080
CMD ["pnpm", "run", "start"]
