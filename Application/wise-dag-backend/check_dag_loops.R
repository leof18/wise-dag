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

# Remove lines containing _t3, _t4, ... _tN (where N > 2)
filtered_lines <- grep("_T[3-9]|_T[1-9][0-9]", lines, invert = TRUE, value = TRUE)

dag_string <- paste(filtered_lines, collapse = "")
dag <- dagitty(dag_string)

if (isAcyclic(dag)) {
  cat("No more cycles!")
} else {
  cat(findCycle(dag))
}

flush.console()
quit(save = "no", status = 0)