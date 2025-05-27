FROM golang:1.23-alpine

# Set maintainer label: maintainer=[YOUR-EMAIL]
LABEL maintainer=thomas.wagner@students.fh-hagenberg.at

# Set working directory: `/src`
WORKDIR /src

COPY *.go go.mod /src/

# List items in the working directory (ls)
RUN ls

RUN go mod tidy

# Build the GO app as myapp binary and move it to /usr/
RUN go build -o myapp . && mv myapp /usr/

#Expose port 8010
EXPOSE 8010

# Run the service myapp when a container of this image is launched
CMD ["/usr/myapp"]
