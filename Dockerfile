FROM ghcr.io/epitech/coding-style-checker:latest

RUN sed -i \
    -e 's|http://archive.ubuntu.com/ubuntu|http://old-releases.ubuntu.com/ubuntu|g' \
    -e 's|http://security.ubuntu.com/ubuntu|http://old-releases.ubuntu.com/ubuntu|g' \
    /etc/apt/sources.list

RUN apt update && apt install -y unzip curl

RUN curl -fsSL https://deno.land/x/install/install.sh | sh

ENV HOME=/root

ENV PATH="$HOME/.deno/bin:$PATH"

WORKDIR /app

COPY . .

RUN chmod +x main.sh

ENTRYPOINT [ "/app/main.sh" ]
