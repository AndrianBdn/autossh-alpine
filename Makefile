
.PHONY: image hub all

image:
	docker build -t andrianbdn/autossh-alpine .
	
hub: 
	docker push andrianbdn/autossh-alpine
	
all: image hub
