#create replicator user
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER replicator WITH REPLICATION ENCRYPTED PASSWORD 'replicator';
    SELECT * FROM pg_create_physical_replication_slot('replication_slot_slave1');
EOSQL
