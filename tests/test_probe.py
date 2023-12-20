def test_readiness_probe(client):
    response = client.get("/probe/ready")
    data = response.get_json()
    assert "I'm ready!" == data["message"]


def test_liveness_probe(client):
    response = client.get("/probe/live")
    data = response.get_json()
    assert "I'm alive!" == data["message"]
