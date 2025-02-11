FROM node:18-alpine3.14

ENV MARKDOWNLINT_CLI2_VERSION=v0.5.0

RUN npm install -g "markdownlint-cli2@$MARKDOWNLINT_CLI2_VERSION"

ENV REVIEWDOG_VERSION=v0.14.1

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh \
    | sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
RUN apk --no-cache -U add git

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD []
