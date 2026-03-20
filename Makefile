.PHONY: up down logs ps test

up:
	docker compose up -d --build

down:
	docker compose down -v

logs:
	docker compose logs -f

ps:
	docker compose ps

test:
	@echo "Running smoke checks..."
	curl -fsS http://localhost:${GRAFANA_PORT:-3000}/api/health >/dev/null
	curl -fsS http://localhost:${INFLUXDB_HTTP_PORT:-8086}/ping >/dev/null
