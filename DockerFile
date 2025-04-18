FROM golang:1.19.10-alpine

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN mkdir -p /app/uploads/profiles /app/uploads/scanned

RUN go build -o main .

EXPOSE 8080

CMD ["./main"]