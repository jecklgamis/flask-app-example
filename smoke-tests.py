#!/usr/bin/env python3

import logging as log
import sys
import unittest

import requests
import urllib3


class SmokeTests(unittest.TestCase):

    def setUp(self) -> None:
        SmokeTests.init()

    def testEndPointsExist(self):
        log.info("Ensuring endpoints exists")
        self.assertEqual(SmokeTests.get("https://localhost:8443/").status_code, 200)
        self.assertEqual(SmokeTests.get("https://localhost:8443/server_info").status_code, 200)
        self.assertEqual(SmokeTests.get("https://localhost:8443/api").status_code, 200)

    @staticmethod
    def get(url):
        return requests.get(url, verify=False)

    @staticmethod
    def init():
        urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)
        stdout_handler = log.StreamHandler(sys.stdout)
        log.basicConfig(level=log.INFO,
                        format='[%(asctime)s] {%(filename)s:%(lineno)d} %(levelname)s - %(message)s',
                        handlers=[stdout_handler])


if __name__ == '__main__':
    unittest.main()
