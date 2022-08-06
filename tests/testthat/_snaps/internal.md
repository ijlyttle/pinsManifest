# make_manifest_folder() works

    Code
      make_manifest_folder("pins")
    Output
      $`mtcars-csv`
      20220806T221152Z-48c73 20220806T221155Z-48c73 
      
      $`mtcars-json`
      20220806T221150Z-c2702 20220806T221152Z-c2702 
      

# get_manifest() works

    Code
      get_manifest(
        "https://raw.githubusercontent.com/ijlyttle/pinsManifest/main/tests/testthat/pins")
    Output
      $`mtcars-csv`
      [1] "20220806T221152Z-48c73" "20220806T221155Z-48c73"
      
      $`mtcars-json`
      [1] "20220806T221150Z-c2702" "20220806T221152Z-c2702"
      

