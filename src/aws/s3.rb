Aws.config.update({
  region: 'ap-northeast-1',
  endpoint: 'http://localstack:4572'
})

s3 = Aws::S3::Client.new

resp = s3.create_bucket({
  bucket: "examplebucket",
})

resp = s3.put_object({
  body: "aaa",
  bucket: "hogebucket",
  key: "exampleobject",
  tagging: "key1=value1&key2=value2",
})

resp = s3.list_buckets


