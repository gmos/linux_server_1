IFS=',' read -ra INIT_ARRAY <<< "$MARIADB_INIT"

for INIT in "${INIT_ARRAY[@]}"; do
    IFS=':' read -r USER PASSWORD DB_NAME <<< "$INIT"

    # Strip leading and trailing whitespace
    USER=$(echo "$USER" | xargs)
    PASSWORD=$(echo "$PASSWORD" | xargs)
    DB_NAME=$(echo "$DB_NAME" | xargs)

    if [[ -n "$USER" && -n "$PASSWORD" && -n "$DB_NAME" ]]; then
        echo "Creating database '$DB_NAME' and user '$USER' with the specified password."
        mariadb -u root -p"$MARIADB_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS \`$DB_NAME\`;"
        mariadb -u root -p"$MARIADB_ROOT_PASSWORD" -e "CREATE USER IF NOT EXISTS '$USER'@'%' IDENTIFIED BY '$PASSWORD';"
        mariadb -u root -p"$MARIADB_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO '$USER'@'%';"
        mariadb -u root -p"$MARIADB_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"
    else
        echo "Skipping invalid entry: $INIT"
    fi
done