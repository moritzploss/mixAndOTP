defmodule KV.BucketTest do
  use ExUnit.Case, async: true

  test "stores values by key" do
    {:ok, bucket} = KV.Bucket.start_link([])
    assert KV.Bucket.get(bucket, "bread") == nil

    KV.Bucket.put(bucket, "bread", 3)
    assert KV.Bucket.get(bucket, "bread") == 3
  end
end
