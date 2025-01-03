
up:
	docker compose up -d --remove-orphans

down:
	docker compose down

secret:
	@[ -n "$(PASSWORD)" ] && \
		docker run --rm authelia/authelia:latest authelia crypto hash generate argon2 --password '$(PASSWORD)' \
		|| echo "Usage: make secret PASSWORD=<your_password>"

# Reload the photos in nextcloud.
rescan:
	# No need to exec as another user (-u flag). occ can be used as a standalone.
	docker exec -it nextcloud occ files:scan --all
