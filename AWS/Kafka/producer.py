from kafka import KafkaProducer
from json import dumps
import pandas as pd
from time import sleep

producer = KafkaProducer(
    bootstrap_servers=['34.203.227.212:9092'],  # your EC2 IP
    value_serializer=lambda x: dumps(x).encode('utf-8')
)

df = pd.read_csv("indexProcessed.csv")

for i in range(10):  # send only 10 records
    dict_stock = df.sample(1).to_dict(orient="records")[0]
    print(f"Sending record {i+1}: {dict_stock}")
    producer.send('demo_testing2', value=dict_stock)
    sleep(1)  # optional: slow down for stability
