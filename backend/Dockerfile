FROM node:16-alpine

WORKDIR /app

COPY package*.json ./


RUN npm install -g nodemon \
    && npm install

# RUN npm ci
# RUN npm install -g nodemon

COPY . .

EXPOSE 5000

CMD ["npm","start"]