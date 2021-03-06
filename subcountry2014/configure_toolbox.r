## configure_toolbox.r

## configure_toolbox.r ensures all files in your repo are properly configured.
## It must be sourced before calculating OHI scores with ohicore::CalculateAll();
## it can be sourced here or is also sourced from calculate_scores.r.

## You are encouraged to use this script when developing individual goal models. A good workflow is:
  ## 1. prepare data layers in the /prep folders (script as much as possible in R)
  ## 2. register data layers in layers.csv and save them in /layers folder
  ## 3. source configure_toolbox.r to ensure proper configuration
  ## 4. develop goal models in functions.r, running individual goal models line by line

## load ohicore and libraries used in functions.r models
if (!"ohicore" %in% (.packages())) {
  suppressWarnings(require(ohicore))
  library(tidyr)
  library(dplyr)
}

## set working directory to the scenario that contains conf and layers directories
setwd('~/github/col/subcountry2014')

## load scenario configuration
conf = ohicore::Conf('conf')

## check that scenario layers files in the \layers folder match layers.csv registration. Layers files are not modified.
ohicore::CheckLayers('layers.csv', 'layers', flds_id=conf$config$layers_id_fields)

## load scenario layers for ohicore to access. Layers files are not modified.
layers = ohicore::Layers('layers.csv', 'layers')

