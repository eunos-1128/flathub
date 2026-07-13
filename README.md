# Alexandria

Alexandria is a desktop application for managing a personal library of scientific PDFs.

It extracts publication metadata from PDF files and online services, and presents the papers in a searchable and filterable library. Alexandria also provides citation information, annotations, BibTeX import and export, duplicate detection, and sidecar JSON metadata.

This repository contains the Flatpak packaging for [Alexandria](https://github.com/pemsley/Alexandria), developed by [Paul Emsley](https://github.com/pemsley).

## Installation

Alexandria is available from Flathub:

```shell
flatpak remote-add --user --if-not-exists flathub \
  https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install --user flathub io.github.pemsley.Alexandria
flatpak run io.github.pemsley.Alexandria
```

## Building

First, install Flatpak Builder:

```shell
flatpak install --user flathub org.flatpak.Builder
```

Clone this repository:

```shell
git clone https://github.com/flathub/io.github.pemsley.Alexandria.git
cd io.github.pemsley.Alexandria
```

Build and install Alexandria locally:

```shell
flatpak run org.flatpak.Builder \
  --force-clean \
  --sandbox \
  --user \
  --install \
  --install-deps-from=flathub \
  --ccache \
  --mirror-screenshots-url=https://dl.flathub.org/media/ \
  --repo=repo \
  builddir \
  io.github.pemsley.Alexandria.yaml
```

Run the locally installed application:

```shell
flatpak run io.github.pemsley.Alexandria//master
```

## Updating Python dependencies

Python dependencies are stored in `python-deps.yaml` so that Flatpak can build the application without network access during the build.

After changing `requirements.txt`, regenerate the dependency modules with:

```shell
./python-deps.sh
```

Commit both the updated requirements file and the generated `python-deps.yaml`.
