
if (!require(ggplot2)) install.packages("ggplot2")
if (!require(dplyr)) install.packages("dplyr")

library(ggplot2)
library(dplyr)

data <- tryCatch({
  read.csv("data.csv")
}, error = function(e) {
  stop("Fehler beim Lesen der CSV-Datei: Stellen Sie sicher, dass die Datei 'data.csv' im richtigen Verzeichnis ist.")
})

if (!all(c("x", "y") %in% colnames(data))) {
  stop("Fehlende Spalten: Stellen Sie sicher, dass die CSV-Datei die Spalten 'x' und 'y' enthält.")
}

print(head(data))

plot <- ggplot(data, aes(x = x, y = y)) +
  geom_point(color = "blue", size = 3) +
  labs(title = "Scatterplot von X und Y", x = "X-Werte", y = "Y-Werte") +
  theme_minimal()

tryCatch({
  ggsave("scatterplot.png", plot)
  cat("Plot erfolgreich als 'scatterplot.png' gespeichert\n")
}, error = function(e) {
  stop("Fehler beim Speichern des Plots: ", e$message)
})