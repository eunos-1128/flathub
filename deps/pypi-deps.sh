#!/usr/bin/env bash

./flatpak-builder-tools/pip/flatpak-pip-generator \
    --runtime='org.freedesktop.Sdk//24.08' \
    --requirements-file='requirements.txt' \
    --output pypi-deps \
    --checker-data
