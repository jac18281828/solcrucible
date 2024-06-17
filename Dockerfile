FROM ghcr.io/collectivexyz/foundry:latest

ARG PROJECT=solcrucible
WORKDIR /workspaces/${PROJECT}
RUN chown -R foundry:foundry .
COPY --chown=foundry:foundry . .
ENV USER=foundry
USER foundry
ENV PATH=${PATH}:~/.cargo/bin
RUN npm ci --frozen-lockfile
RUN forge fmt --check
RUN npm run lint
RUN forge test -v

