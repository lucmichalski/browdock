docker ps -q | xargs docker inspect --format '{{ .Id }}: User={{.Config.User}}'
