FROM ghcr.io/collectivexyz/foundry:latest

COPY --from=oven/bun:1.3.14 /usr/local/bin/bun /usr/local/bin/bun
USER root
RUN ln -s bun /usr/local/bin/bunx
USER foundry

RUN python3 -m pip install slither-analyzer --break-system-packages

ARG PROJECT=solcrucible
WORKDIR /workspaces/${PROJECT}
RUN chown -R foundry:foundry .
COPY --chown=foundry:foundry . .
ENV USER=foundry
USER foundry
ENV PATH=${PATH}:~/.cargo/bin
RUN bun install --frozen-lockfile
