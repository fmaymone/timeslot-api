# -*- coding: utf-8 -*-

import re
import sys
import cloudinary
import cloudinary.uploader
import cloudinary.api

reload(sys)
sys.setdefaultencoding('utf-8')


def bulk_delete(cloud_name, api_key, api_secret):
    prompt = "Are you %s sure you want to delete up to 1000 resources in cloudinary account '%s'? [y/N] "
    extra = "really"
    for i in range(2):
        yn = raw_input(prompt % (extra, cloud_name))
        if not yn == "y":
            print("operation aborted by user...")
            exit(1)
        extra = "REALLY"

    cloudinary.config(
        cloud_name=cloud_name,
        api_key=api_key,
        api_secret=api_secret
    )

    response_str = cloudinary.api.delete_all_resources()
    print(response_str)


if __name__ == "__main__":

    api_key_rgx = "^\d+$"
    api_secret_rgx = "^[a-zA-Z0-9_\-]+$"

    usage_info = "Usage: %s <cloud_name> <api_key> <api_secret>" % sys.argv[0]
    if not len(sys.argv) == 4:
        print(usage_info)
        exit(1)
    elif not re.match(api_key_rgx, sys.argv[2]):
        print("Invalid api_key, does not match regex: '%s'" % api_key_rgx)
        exit(1)
    elif not re.match(api_secret_rgx, sys.argv[3]):
        print("Invalid api_secret, does not match regex: '%s'" % api_secret_rgx)
        exit(1)

    cloud_name = sys.argv[1]
    api_key = sys.argv[2]
    api_secret = sys.argv[3]

    bulk_delete(cloud_name, api_key, api_secret)
