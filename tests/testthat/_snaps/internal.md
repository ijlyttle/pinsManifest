# make_manifest_folder() works

    Code
      make_manifest_folder("pins")
    Output
      $`mtcars-csv`
      20220807T005818Z-48c73 20220807T005820Z-48c73 
      
      $`mtcars-json`
      20220807T005816Z-c2702 20220807T005818Z-c2702 
      

# get_manifest() works

    Code
      get_manifest(
        "https://raw.githubusercontent.com/ijlyttle/pinsManifest/main/tests/testthat/pins")
    Output
      $`mtcars-csv`
      [1] "20220807T005818Z-48c73" "20220807T005820Z-48c73"
      
      $`mtcars-json`
      [1] "20220807T005816Z-c2702" "20220807T005818Z-c2702"
      

