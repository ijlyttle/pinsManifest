# make_manifest_folder() works

    Code
      make_manifest_folder("pins")
    Output
      $`mtcars-csv`
      $`mtcars-csv`[[1]]
      [1] "mtcars-csv/20220811T155805Z-48c73/"
      
      
      $`mtcars-json`
      $`mtcars-json`[[1]]
      [1] "mtcars-json/20220811T155803Z-c2702/"
      
      $`mtcars-json`[[2]]
      [1] "mtcars-json/20220811T155805Z-c2702/"
      
      

# get_manifest() works

    Code
      manifest_url
    Output
      $`mtcars-csv`
      [1] "mtcars-csv/20220811T155805Z-48c73/"
      
      $`mtcars-json`
      [1] "mtcars-json/20220811T155803Z-c2702/" "mtcars-json/20220811T155805Z-c2702/"
      

# make_manifest_url() works

    Code
      make_manifest_url(manifest_url, url)
    Output
                                                                                                                  mtcars-csv 
       "https://raw.githubusercontent.com/ijlyttle/pinsManifest/main/tests/testthat/pins/mtcars-csv/20220811T155805Z-48c73/" 
                                                                                                                 mtcars-json 
      "https://raw.githubusercontent.com/ijlyttle/pinsManifest/main/tests/testthat/pins/mtcars-json/20220811T155805Z-c2702/" 

