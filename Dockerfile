FROM nginx

WORKDIR /app

RUN curl -fsSL https://deb.nodesource.com/setup_17.x | bash -
RUN apt-get install -y nodejs

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

RUN rm -r  C:\nginx-1.26.1\html\*

RUN cp -a build/. C:\nginx-1.26.1\html
