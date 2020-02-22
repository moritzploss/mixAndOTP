defmodule KV.BucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket} = KV.Bucket.start_link([])
    %{bucket: bucket}
  end

  test "stores values by key", %{bucket: bucket} do
    assert KV.Bucket.get(bucket, "bread") == nil

    KV.Bucket.put(bucket, "bread", 3)
    assert KV.Bucket.get(bucket, "bread") == 3
  end
end
