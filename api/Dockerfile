FROM golang:alpine as builder
RUN apk add --no-cache bash git openssh
RUN mkdir /build
ADD . /build/
WORKDIR /build
RUN go get -d -v
RUN go build -o main .
FROM alpine
RUN adduser -S -D -H -h /app appuser
USER appuser
COPY --from=builder /build/main /app/
WORKDIR /app
CMD ["./main"]
