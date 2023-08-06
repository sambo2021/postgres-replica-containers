docker-compose up -d  postgres_slave

echo "Starting postgres_slave node..."
sleep 20  # Waits for master note start complete
