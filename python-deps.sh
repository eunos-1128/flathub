#!/usr/bin/env sh

if ! python3 -c "import requirements_parser" >/dev/null 2>&1; then
    python3 -m pip install requirements-parser
fi

# pygobject and pycairo (and their build-only dep meson-python) are already in org.gnome.Platform//50, same versions, so skip them.
# lxml is in the Sdk but not the Platform runtime, so it still needs installing.
# Avoid building cryptography from source, which requires maturin and Rust.
flatpak-builder-tools/pip/flatpak-pip-generator \
    --requirements-file requirements.txt \
    --ignore-pkg 'pygobject,pycairo' \
    --prefer-wheels cryptography \
    --ignore-installed lxml \
    --runtime org.gnome.Sdk//50 \
    --output python-deps \
    --yaml
