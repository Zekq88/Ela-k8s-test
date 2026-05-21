FROM node:20-alpine

WORKDIR /app

# Installing depencies with less lines of code, makes the container smaller
COPY package*.json ./
RUN npm install --omit=dev

COPY . .

EXPOSE 3000

CMD [ "npm", "start" ]