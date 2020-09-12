FROM node:10.15.1

EXPOSE 3000

RUN mkdir /app
WORKDIR /app
COPY . /app/

# Only install production dependencies
#RUN npm install --only=prod
RUN npm install
RUN npm run build

CMD bash -c "npm run start"
#CMD bash -c "nuxt dev"
