FROM golang:latest

WORKDIR /app

COPY go.mod go.sum /app/

RUN go mod download

COPY . /app

RUN go build -o build/fizzbuzz

EXPOSE 8080

CMD ["./build/fizzbuzz", "serve"]