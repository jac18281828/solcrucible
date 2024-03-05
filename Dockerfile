FROM ghcr.io/collectivexyz/foundry:latest

ARG PROJECT=colcrucible
WORKDIR /workspaces/${PROJECT}
RUN chown -R foundry:foundry .
COPY --chown=foundry:foundry . .
ENV USER=foundry
USER foundry
ENV PATH=${PATH}:~/.cargo/bin
#RUN yarn install
#RUN yarn prettier:check
#RUN yarn hint
#RUN forge test -vvv


