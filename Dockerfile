FROM ghcr.io/collectivexyz/foundry:latest

COPY --from=oven/bun:1.3.14 /usr/local/bin/bun /usr/local/bin/bun
USER root
RUN ln -s bun /usr/local/bin/bunx

RUN apt-get update \
 && apt-get install -y --no-install-recommends curl gnupg ca-certificates \
 && install -d -m 0755 /etc/apt/keyrings \
 && curl -fsSL https://downloads.claude.ai/keys/claude-code.asc -o /etc/apt/keyrings/claude-code.asc \
 && gpg --show-keys /etc/apt/keyrings/claude-code.asc | grep -q 31DDDE24DDFAB679F42D7BD2BAA929FF1A7ECACE \
 && echo "deb [signed-by=/etc/apt/keyrings/claude-code.asc] https://downloads.claude.ai/claude-code/apt/stable stable main" > /etc/apt/sources.list.d/claude-code.list \
 && apt-get update \
 && apt-get install -y --no-install-recommends claude-code \
 && rm -rf /var/lib/apt/lists/*

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
