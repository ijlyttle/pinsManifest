# pinsManifest 0.0.0.9000

* Added public-facing functions (#1):

  - `pin_write_manifest()`: given a `board_folder()` write a manifest file 
     (`pins.txt`) of its pins and versions, in its root directory.
  
  - `board_url_manifest()`: given a URL (for a site with a manifest), 
     returns a `pins::board_url()`. 
  
  - `url_demo_manifest()`: returns URL for demonstration board with a manifest.
  
  - `manifest_latest()`: given a `url`, returns a 
     named character vector of pin-URLs that can be used to build a 
     `pins::board_url()`.
  
* Added internal functions (#2).

* Added a `NEWS.md` file to track changes to the package.
