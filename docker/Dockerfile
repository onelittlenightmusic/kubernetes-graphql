ARG tag=latest-all-alpine
FROM hiroyukiosaki/graphql-mesh:${tag} as build
#FROM hiroyukiosaki/graphql-mesh:${tag}
RUN yarn add deepmerge graphql-fields

FROM node:15-alpine
COPY --from=build /work/ /work/
WORKDIR /work
CMD if [ -f "init.sh" ]; then sh init.sh; fi && yarn start