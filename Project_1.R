#Biometry project 1
library(readxl)
fds<-read_excel("Masters_Data_Modified.xlsx") # I am using my data from Fort De Soto Park. It was collected in June of 2026
class(fds) #this tells me the class of dataset, it is a tibble
str(fds)
leafvsalt<-fds[c("species","leaf_thickness_mm","soil_salinity_ms")] #singling out leaf thickness and soil salinity as the variables of interest
str(leafvsalt) #I am using the structure function to determine that leaf_thickness_mm and soil_salinity are both numeric and species is a character.
leafvsalt_narm <- na.omit(leafvsalt) #omitting NAs from data set
summary(leafvsalt_narm[c("leaf_thickness_mm", "soil_salinity_ms")]) #summary stats
#figure 1
pairs(
  leafvsalt_narm[c("leaf_thickness_mm", "soil_salinity_ms")],
  pch = 16,
  cex = 1.5,
  col = rgb(red = 0, green = 0, blue = 1, alpha = 0.4)
)

# Add a caption below the figure
mtext(
  "Figure 1. Leaf thickness and soil salinity for sampled leaves at Fort De Soto Park.\nEach point represents one leaf observation; species identity is not distinguished in this figure.",
  side = 1,
  line = 4,
  cex = 0.8
)

# Figure 2: Distribution of leaf thickness among species
par(mar = c(7, 4, 4, 2) + 0.1)

boxplot(
  leaf_thickness_mm ~ species,
  data = leafvsalt_narm,
  main = "Leaf thickness by species",
  xlab = "Species",
  ylab = "Leaf thickness (mm)",
  las = 2,
  col = "lightblue"
)

mtext(
  "Figure 2. Distribution of leaf thickness among sampled plant species at Fort De Soto Park.Each box summarizes leaf-thickness observations for one species.",
  side = 1,
  line = 5,
  cex = 0.8
)


# Figure 3: Distribution of soil salinity

par(mar = c(7, 4, 4, 2) + 0.1)

hist(
  leafvsalt_narm$soil_salinity_ms,
  main = "Distribution of soil salinity",
  xlab = "Soil salinity (mS)",
  ylab = "Number of leaf observations",
  col = "lightgreen",
  border = "white"
)

mtext(
  "Figure 3. Distribution of soil salinity values associated with sampled leaves at Fort De Soto Park.Bar height indicates the number of leaf observations within each soil-salinity range.",
  side = 1,
  line = 5,
  cex = 0.8
)