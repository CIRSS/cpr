all: build test install

clean:
	go clean ./...

build:
	go build ./...

# disable test result caching using: -count 1
# disable parallel execution of tests using: -p 1 
test:
	go test ./... -count 1 -p 1

install:
	go install ./...   
