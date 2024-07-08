#!/usr/bin/env python3

import requests


def test_endpoint_exists():
    assert requests.get("http://localhost:8080/").status_code == 200
    assert requests.get("http://localhost:8080/build-info").status_code == 200
    assert requests.get("http://localhost:8080/probe/ready").status_code == 200
    assert requests.get("http://localhost:8080/probe/live").status_code == 200


if __name__ == '__main__':
    try:
        test_endpoint_exists()
        print("OK")
    except:
        print("NG")
