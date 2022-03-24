BINARY_NAME=dkpswitch

build:
	GOARCH=amd64 GOOS=darwin go build -o ${BINARY_NAME}-darwin main.go
	GOARCH=amd64 GOOS=linux go build -o ${BINARY_NAME}-linux main.go

run:
	./${BINARY_NAME}

build_and_run: build run

dep:
	go mod download

vet:
	go vet

lint:
	golangci-lint run --enable-all

clean:
	go clean
	rm ${BINARY_NAME}-darwin
	rm ${BINARY_NAME}-linux