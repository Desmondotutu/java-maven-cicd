FROM maven as build
WORKDIR src
COPY . .

FROM build step as --builld
