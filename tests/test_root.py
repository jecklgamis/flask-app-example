def test_index(client):
    response = client.get("/")
    data = response.get_json()
    assert "flask-example-app" == data["name"]
    assert "It works in my machine!" == data["message"]


def test_server_info(client):
    response = client.get("/server_info")
    data = response.get_json()
    assert "flask-example-app" == data["name"]
    assert "master" == data["branch"]
    assert data["version"] is not None
