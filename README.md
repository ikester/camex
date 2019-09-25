# Camera Metadata Extractor (CAMex) #

A simple utility to extract camera metadata from media files into a medium that
can be imported into video editing applications (like DaVinci Resolve).

## Quick Start ##

1. Install [Exiftool](https://sno.phy.queensu.ca/~phil/exiftool/). Optionally
(on a Mac) the Automator Workflow.
2. Either
   1. Run `./bin/camex.sh <filename1> [filenameX]`
   2. (On a Mac) Right-click/CMD-click on files and select
   `Quick Actions > Extract Camera Metadata` from the pop-up menu.
3. Import camera metadata to supported application.

### Currently Supported ###

* Cameras: **Fujifilm**
* Applications: **DaVinci Resolve**

If you would like CAMex to support additional cameras and applications please
open a [new GitHub issue](https://github.com/ikester/camex/issues/new).

## Why This Is Useful ##

Digital cameras store a variety of metadata with each media file (image, video)
recorded. This metadata includes camera settings and technical information
about the file, which can be very useful during the editing process.
For example, a video editor may use information about the type of camera, focal
length, aperture and shutter speed of clips to organize a project's media.

Unfortunately, different camera systems store metadata differently. Other than
very basic media information (dimensions, FPS, etc.), camera settings and shot
information is not standardized. Therefore, applications, such as DaVinci
Resolve, are not able to retrieve this metadata in a consistent way from files
generated by different camera manufacturers, but some have a way to import such
data from an external source.

This utility generates a standalone metadata container that can be used by
applications, like DaVinci Resolve, to populate their own internal tags with
additional camera information that was not captured during the initial import.

## Exiftool To The Rescue (Dependency) ##

[Exiftool](https://sno.phy.queensu.ca/~phil/exiftool/) is a small application
utility that can extract metadata from all kinds of media files. To use CAMex you
need `exiftool` installed on your computer first. Please visit
[https://sno.phy.queensu.ca/~phil/exiftool/](https://sno.phy.queensu.ca/~phil/exiftool/)
and follow the installation instructions for your platform. On a Mac, you can
also find it in package managers like [Homebrew](https://brew.sh/).

## How To Extract Camera Metadata With CAMex ##

CAMex currently only supports Fujifilm cameras and DaVinci Resolve. This is
likely to change in the near future.

CAMex is a very simple wrapper for Exiftool that extracts specific metadata and
saves it to a file in CSV format. Once you have a working version of Exiftool
installed, you can use CAMex in a couple of different ways:
1. You can run the shell script `./bin/camex.sh`
2. (On a Mac) You can use an Automator Workflow extension from the Finder

### 1. Run a shell script ###

Simply invoke the shell script `./bin/camex.sh <filename1> [filenameX]` with
one or more arguments. Each argument should be the filename of a media file or a
directory containing media files. A new file will be created with all the relevant
metadata.

If a folder was used, the metadata file will be created in its parent folder and
the name will be `[folder name]-camera-metadata.csv`. If individual files were
used the metadata file will be created in the current folder and the name will be
`selection-camera-metadata.csv`.

### 2. Use Automator Workflow Extension ###

#### Install Extension (one time task) ####

1. Double-click on the "Extract Camera Metadata" icon. A "Service Installer"
dialog will pop up.
2. Click "Install" and you should now have the workflow installed.

#### Extract Metadata ####

1. Select a file, files or folders to extract metadata from.
2. Right-click/CTRL-click on one of the selected icons and from the pop-up menu
select `Quick Actions > Extract Camera Metadata`
3. A new file will be created with all the relevant metadata.

If a folder was used, the metadata file will be created in its parent folder and
the name will be `[folder name]-camera-metadata.csv`. If individual files were
used the metadata file will be created in the current folder and the name will be
`selection-camera-metadata.csv`.

## How To Import Extracted Camera Metadata ##

Use your application's Import Metadata functionality to import the extracted
camera information. Currently, only DaVinci Resolve is supported.

### DaVinci Resolve ###

1. Import media as usual.
2. In the Media page, select the clips you want to enhance with additional
camera metadata (or deselect everything to target the whole bin).
3. From the application menu bar select
`File > Import Metadata to > Media Pool...` or
`File > Import Metadata to > Selected Media Pool Clips...`
4. Find the generated metadata file and open it.

Resolve should automatically populate the camera tags with the extracted
information.

## Supported Cameras and Applications ##

CAMex currently only supports Fujifilm cameras and DaVinci Resolve. It should be
easy to expand both, the metadata definitions and the generated output format to
support additional cameras and applications. In fact, it should be relatively
straightforward to support a camera "auto-detect" feature. Please open a
[new GitHub issue](https://github.com/ikester/camex/issues/new) if you
have specific requests to support additional cameras or applications. Pull
requests are always welcome.

### DaVinci Resolve <-> Fujifilm Metadata Mapping Reference ###

The following metadata keys will be extracted from Fujifilm files and mapped to
the corresponding Resolve Tags:

| DaVinci Resolve Tag  | Exiftool Tag         | Example Value        |
| ---------------------|----------------------|----------------------|
| Camera Aperture      | Aperture             | 2.8                  |
| Camera Aperture Type | PictureMode          | Manual               |
| Camera Format        | Format               | Digital Camera       |
| Camera FPS           | VideoFrameRate       | 23.976               |
| Camera Manufacturer  | Make                 | FUJIFILM             |
| Camera Serial #      | InternalSerialNumber | [serial number]      |
| Camera Type          | Model                | X-T3                 |
| Codec Bitrate        | AvgBitrate           | 201 Mbps             |
| Gamma Notes          | FilmMode             | F0/Standard (Provia) |
| ISO                  | ISO                  | 160                  |
| Lens Type            | LensInfo             | 18-55mm f/2.8-4      |
| Shutter              | ShutterSpeed         | 1/48                 |
| White Balance Tint   | WhiteBalance         | Auto                 |

## Disclaimer ##

This software and documentation are provided AS-IS with no warranty of any kind.
It is highly recommended that you make backups of all your media files before
using CAMex.
