def test_index(client):
    response = client.get("/api/")
    data = response.get_json()
    assert "This is the /api endpoint" == data["message"]
