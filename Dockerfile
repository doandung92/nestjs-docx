FROM node

WORKDIR /home/node

COPY ./package.json /home/node/package.json
RUN npm i

ENV DATABASE_URL=postgresql://dungdh7:password@52.74.218.73:5432/demo

COPY . /home/node

RUN chown -R node /home/node
USER node
RUN npm run migrate

ENTRYPOINT ["npm", "start"]
