# # CREATE
curl -H "Content-Type: application/json" -XPOST http://127.0.0.1:9200/logstash-2021.02.18/testPOST -d  '{
    "userName" : "yang",
    "@timestamp" : "2021-02-18T16:52:54.550Z",
    "message" : "This is a meaage for testing POST"
}'

# # READ
# curl -XGET http://127.0.0.1:9200/logstash-2021.02.18/testPOST/JaJRtHcBFfG4LKHAz41t?pretty

# # UPDATE
# curl -H "Content-Type: application/json" -XPOST http://127.0.0.1:9200/logstash-2021.02.18/testPOST/JaJRtHcBFfG4LKHAz41t/_update  -d '{
#     "doc" : {
#     "userName" : "yang"
#     }
# }'

# # DELETE
# curl -XDELETE http://127.0.0.1:9200/logstash-2021.02.18

# # 刪除多筆 index
# curl -XDELETE http://127.0.0.1:9200/logstash-2021.02.*
