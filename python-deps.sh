#!/usr/bin/env sh

if ! python3 -c "import requirements_parser" >/dev/null 2>&1; then
  pip3 install requirements-parser
fi

flatpak-builder-tools/pip/flatpak-pip-generator \
  --requirements-file requirements-flatpak.txt \
  --output python-deps \
  --yaml \
  --runtime org.gnome.Sdk//50
