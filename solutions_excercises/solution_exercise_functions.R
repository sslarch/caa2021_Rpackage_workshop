# This solution introduces the function my_function to solve
# the data manipulation task for arbitrary cutoff-letters.
# It also replaces some of the code with the %na0plus% operator
# we already implemented for one of the mini-exercises.

#### Generate test data ####
input_data <- data.frame(
  id = LETTERS[1:26],
  value_A = runif(26),
  value_B = runif(26)
)
input_data$value_A[sample(1:26, 5)] <- NA
input_data$value_B[sample(1:26, 5)] <- NA

#### Solution code ####

`%na0plus%` <- function(x, y) {
  x <- `if`(is.na(x), 0, x)
  y <- `if`(is.na(y), 0, y)
  x + y
}

my_function <- function(x, cutoff_letter) {
  loop_res <- rep(NA, nrow(x))
  for (i in seq_len(nrow(x))) {
    current_row <- x[i,]
    if (current_row$id < cutoff_letter) {
      loop_res[i] <- current_row$value_A + current_row$value_B
    } else {
      loop_res[i] <- current_row$value_A %na0plus% current_row$value_B
    }
  }
  return(loop_res)
}

my_function(input_data, "G")
