## Usage

#### Docker ELK 環境建立

- `cd docker-elk`
- `docker-compose up`

#### 設定 index pattern

- `bash index_pattern.sh`

#### 傳送傳文字檔至 ELK

- `cd example`
- `nc 127.0.0.1 5000 < helloworld.txt`

#### 透過 python 送 log 至 ELK

- `cd example`
- `pip install python-logstash`
- `python test_logging.py`

## Note

#### 透過 docker-compose.yml 設定 port

```
5000: Logstash TCP input
9200: Elasticsearch HTTP
9300: Elasticsearch TCP transport
5601: Kibana
```

#### TCP VS UDP

TCP(通訊控制協定)
- 網際網路上最常用的協定、封包按順序傳輸
- 優點：較穩定、有助於流量控制和資料壅塞問題、容易發現及修正錯誤
- 缺點：建立連線和交換資料耗時

UDP(用戶資料包協定)
- 不需要唯一識別碼、不斷發送封包
- 優點：速度快
- 缺點：幾乎無修正錯誤、易出錯


## REF

- [docker-elk-tutorial](https://github.com/twtrubiks/docker-elk-tutorial/tree/master)