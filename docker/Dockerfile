FROM node:16.20.2-alpine3.17

RUN apk add bash --no-cache

RUN npm install -g typescript

COPY ./wait-for-it.sh /usr/local/bin/wait-for-it

RUN chmod +x /usr/local/bin/wait-for-it

CMD ["npm","install"]
