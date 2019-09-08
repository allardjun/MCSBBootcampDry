# Single-cell metadata visualization with R

For this module, you will need to install a few packages in R. Please run the following lines inside your R console and say "yes" to update/install dependicies (unless you're working on a manuscript and want version consistency in your R, in which case you'll probably be fine with slightly older package/dependency versions!):

```{r}
install.packages("dplyr")
install.packages("tidyr")
install.packages("ggplot2")
install.packages("pheatmap")
```

Next, validate that they're installed using the following commands. Warnings can be ignored - only be concerned if it says "Error: package failed to load":

```{r}
library(dplyr)
library(tidyr)
library(ggplot2)
library(pheatmap)
```

Finally, you will want to download the data we will use for our tutorial to your local machine using this link: https://drive.google.com/drive/u/1/folders/1p5PFxisCl6qI59ykRW-Gi25lfbTwpjuy

Once this is done, open up the Bootcamp_R_Lesson_2019.Rmd file in RStudio and we can start running some code!
