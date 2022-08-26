FROM golang:latest

RUN go install github.com/codesenberg/bombardier/releases/tag/v1.2.5

# Prepare for install
RUN apt-get update -y && apt-get upgrade -y

# Get all needed binaries
RUN apt-get install curl -y

COPY . .

CMD ./attack.sh