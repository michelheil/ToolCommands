sudo apt-get update
sudo apt-get install mosquitto mosquitto-clients

sudo service mosquitto status
sudo service mosquitto start
sudo service mosquitto stop

# Configuration
/etc/mosquitto.mosquitto.conf

# PubSub
mosquitto_sub -t "/arbeitszimmer/temperatur/ergebnis"
mosquitto_sub -t "/arbeitszimmer/temperatur"

mosquitto_pub -t "/arbeitszimmer/temperatur" -m "Hello World!"
mosquitto_pub -t "/arbeitszimmer/temperatur/ergebnis" -m "read"

# IP Address
hostname -I
