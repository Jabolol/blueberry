FROM ghcr.io/epitech/coding-style-checker:latest

RUN dnf install -y unzip

RUN curl -fsSL https://deno.land/x/install/install.sh | sh

ENV HOME=/root

ENV PATH="$HOME/.deno/bin:$PATH"

COPY . .

ENTRYPOINT [ "/main.sh" ]
