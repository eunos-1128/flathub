#!/usr/bin/env sh

if ! python3 -c "import requirements_parser" >/dev/null 2>&1; then
    python3 -m pip install requirements-parser
fi

# meson-python isn't in requirements.txt (build-time-only dep of pycairo),
# so merge it into a temporary file for generation only.
tmp_requirements="$(mktemp)"
trap 'rm -f "$tmp_requirements"' EXIT
cat requirements.txt > "$tmp_requirements"
echo "meson-python>=0.16.0" >> "$tmp_requirements"

# lxml is present in org.gnome.Sdk//50 as a build-time dependency,
# but not in org.gnome.Platform//50, so it must be installed into /app.
# Avoid building cryptography from source, which requires maturin and Rust.
flatpak-builder-tools/pip/flatpak-pip-generator \
    --requirements-file "$tmp_requirements" \
    --prefer-wheels cryptography \
    --ignore-installed lxml \
    --runtime org.gnome.Sdk//50 \
    --output python-deps \
    --yaml
