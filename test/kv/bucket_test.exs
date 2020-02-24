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

  test "deletes values by key", %{bucket: bucket} do
    key = "bread"
    value = 3
    KV.Bucket.put(bucket, key, value)
    assert KV.Bucket.get(bucket, key) == value

    KV.Bucket.delete(bucket, key)
    assert KV.Bucket.get(bucket, value) == nil
  end

  test "buckets are temporary workers" do
    assert Supervisor.child_spec(KV.Bucket, []).restart == :temporary
  end
end
