install_if_missing <- function(package) {
  if (!requireNamespace(package, quietly = TRUE)) {
    install.packages(package, repos = "http://cran.us.r-project.org")
  }
}
install_if_missing("V8")
install_if_missing("dagitty")

suppressWarnings(library(dagitty))

args <- commandArgs(trailingOnly = TRUE)
dag_file <- args[1]  # First argument is the DAG file path
lines <- readLines(dag_file)  # Read DAG
dag_string <- paste(lines, collapse = "")

dag <- dagitty(dag_string)

if (isAcyclic(dag)) {
  cat("No loops detected. DAG is valid!")
} else {
  cat(findCycle(dag))
}