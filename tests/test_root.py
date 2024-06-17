def test_index(client):
    response = client.get("/")
    data = response.get_json()
    assert "flask-app-example" == data["name"]
    assert "It works on my machine!" == data["message"]


def test_build_info(client):
    response = client.get("/build-info")
    data = response.get_json()
    assert "flask-app-example" == data["name"]
    assert data["version"] is not None
