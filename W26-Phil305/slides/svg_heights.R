library(tidyverse)
library(xml2)

# Function to extract height from SVG file
get_svg_height <- function(filepath) {
  svg <- read_xml(filepath)
  
  # Try to get height attribute first
  height <- xml_attr(svg, "height")
  
  if (!is.na(height)) {
    # Remove units if present (px, pt, etc.)
    return(as.numeric(str_extract(height, "[0-9.]+")))
  }
  
  # If no height attribute, try viewBox
  viewbox <- xml_attr(svg, "viewBox")
  
  if (!is.na(viewbox)) {
    # viewBox format is "minX minY width height"
    parts <- str_split(viewbox, "\\s+")[[1]]
    return(as.numeric(parts[4]))
  }
  
  return(NA)
}

# Get all SVG files in a directory
svg_dir <- "W26-Phil305/images/tableaux/"  # Change this to your SVG directory
svg_files <- list.files(svg_dir, pattern = "\\.svg$", full.names = TRUE)

# Extract heights
svg_data <- tibble(
  filename = basename(svg_files),
  filepath = svg_files,
  height = map_dbl(svg_files, get_svg_height)
)

# Calculate proportional heights
# Choose your target height for the smallest image
target_min_height <- 100  # pixels - adjust as needed

scaling_factor <- target_min_height / min(svg_data$height, na.rm = TRUE)

svg_data <- svg_data %>%
  mutate(
    scaled_height = round(height * scaling_factor, 1),
    relative_to_min = round(height / min(height, na.rm = TRUE), 2)
  )

# Display results
print(svg_data %>% select(filename, height, scaled_height, relative_to_min))

# Optionally write to CSV
write_csv(svg_data, "svg_heights.csv")

cat("\nScaling factor:", round(scaling_factor, 3), "\n")
cat("Target minimum height:", target_min_height, "px\n")
