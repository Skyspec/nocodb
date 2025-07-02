FROM node:18

WORKDIR /app
COPY . .
RUN npm install
RUN npm install mysql

EXPOSE 8080
CMD ["npm", "run", "start"]
