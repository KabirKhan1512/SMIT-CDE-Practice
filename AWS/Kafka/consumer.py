from kafka import KafkaConsumer
from json import loads, dump
from s3fs import S3FileSystem

consumer = KafkaConsumer(
    'demo_testing2',
    bootstrap_servers=['34.203.227.212:9092'],
    value_deserializer=lambda x: loads(x.decode('utf-8'))
)

s3 = S3FileSystem()

for count, message in enumerate(consumer):
    if count >= 10:
        print("✅ Uploaded 10 files to S3. Stopping consumer.")
        break
    file_path = f"s3://kafka-stocks-project-kk/stock_market_{count}.json"
    print(f"Uploading to {file_path}: {message.value}")
    with s3.open(file_path, 'w') as file:
        dump(message.value, file)
