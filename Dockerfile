FROM golang:latest as lab3build

WORKDIR /app

COPY go.mod go.sum /app/

RUN go mod download

COPY . /app

RUN CGO_ENABLED=0 go build -o build/fizzbuzz

FROM scratch

COPY --from=lab3build /app/build/fizzbuzz fizzbuzz

COPY --from=lab3build /app/templates/index.html /templates/

EXPOSE 8080

CMD ["/fizzbuzz", "serve"]