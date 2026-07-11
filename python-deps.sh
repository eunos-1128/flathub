#!/usr/bin/env sh

if ! python3 -c "import requirements_parser" >/dev/null 2>&1; then
    pip3 install requirements-parser
fi

flatpak-builder-tools/pip/flatpak-pip-generator \
    --requirements-file requirements.txt \
    --prefer-wheels=cryptography \
    --ignore-installed=lxml \
    --runtime org.gnome.Sdk//50 \
    --output python-deps \
    --yaml
