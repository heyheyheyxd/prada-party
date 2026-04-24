FROM alpine:3.18

WORKDIR /app

RUN apk add --no-cache ca-certificates

# Копируем бинарник PocketBase
COPY pocketbase /app/pocketbase

# Копируем миграции и базу
COPY pb_migrations /app/pb_migrations
COPY pb_data /app/pb_data

RUN chmod +x /app/pocketbase

ENV PORT=8080
EXPOSE 8080

CMD ["/app/pocketbase", "serve", "--http=0.0.0.0:8080"]
