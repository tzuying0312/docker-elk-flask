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

#### logstash.conf

- 路徑 docker-elk/logstash/pipeline/logstash.conf
- 管理 log，logstash 的配置主要分為三部分
    - input 預先做簡單的類別判斷
    - filter 使用不同的規則進行切割
    - output 選擇輸出的方式與位置
- filter：grok、json、mutate、geoip
- grok example
    - `cd example`
    - `nc localhost < test_filter.log`


#### port 

- 透過 docker-compose.yml 設定
- 路徑 docker-elk/docker-compose.yml
```
5000: Logstash TCP input
9200: Elasticsearch HTTP
9300: Elasticsearch TCP transport
5601: Kibana
```

## Elastic CRUD
- example 路徑 example/elastic_crud.sh

#### CREATE
```
curl -H "Content-Type: application/json" -XPOST http://127.0.0.1:9200/logstash-2021.02.18/testPOST -d  '{
    "userName" : "user1",
    "@timestamp" : "2021-02-18T16:52:54.550Z",
    "message" : "This is a meaage for testing POST"
}'
```
- http://127.0.0.1:9200/  server:IP位址
- logstash-2016.02.18/  index:database
- testPOST  type:table
- TABLE testPOST 新增了 userNme, @timestamp, message 的資料
- 透過回傳內容的其中資訊 _id 作為後續更新或刪除的依據

#### READ
- 取得單筆紀錄
```
curl -XGET http://127.0.0.1:9200/logstash-2021.02.18/testPOST/JaJRtHcBFfG4LKHAz41t?pretty
```

- 取得特定 type 所有紀錄
```
curl -XGET http://127.0.0.1:9200/logstash-2021.02.18/testPOST/_search?pretty
```

#### UPDATE
- doc：修改 documents 下的 userName 欄位
- 回傳結果其中資訊 _version 為此 id 被異動的次數

```
curl -H "Content-Type: application/json" -XPOST http://127.0.0.1:9200/logstash-2021.02.18/testPOST/JaJRtHcBFfG4LKHAz41t/_update  -d '{
    "doc" : {
    "userName" : "user2"
     }
 }'
```

#### DELETE
- 刪除單筆 index
```
curl -XDELETE http://127.0.0.1:9200/logstash-2021.02.18
```

- 刪除多筆 index
```
curl -XDELETE http://127.0.0.1:9200/logstash-2021.02.*
```

## Note

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
- [logstash 輸入配置](https://ithelp.ithome.com.tw/articles/10186351)
- [grok debug](https://grokdebug.herokuapp.com/)