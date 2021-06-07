#### Generate test data ####
input_data <- data.frame(
  id = LETTERS[1:26],
  value_A = runif(26),
  value_B = runif(26)
)
input_data$value_A[sample(1:26, 5)] <- NA
input_data$value_B[sample(1:26, 5)] <- NA

#### What this code does ####
# This code creates a third column for input_data that combines the
# two columns value_A and value_B in a somewhat complicated manner

# create an empty vector to store the loop's result
loop_res <- rep(NA, nrow(input_data))
# loop to somehow combine the two value columns
# for each row of the data.frame
for (i in seq_len(nrow(input_data))) {
  # get the row for the current loop cycle
  current_row <- input_data[i,]
  if (current_row$id < "G") {
    # if the id is smaller then the cutoff-letter "G",
    # then the combination of value_A and value_B is very simple
    loop_res[i] <- current_row$value_A - current_row$value_B
  } else {
    # else it gets more complicated, because NA values
    # have to be replaced
    if (is.na(current_row$value_A)) {
      # NA values in value A get replaced with 0
      v_A <- 0
    } else {
      # normal values just stay as they are
      v_A <- current_row$value_A
    }
    if (is.na(current_row$value_B)) {
      # NA values in value B get replaced with 0.5
      v_B <- 0.5
    } else {
      # again normal values just stay as they are
      v_B <- current_row$value_B
    }
    # finally the two modified values are added
    loop_res[i] <- v_A + v_B
  }
}

# result vector
loop_res

#### The task ####
# Imagine you have to do this for hundreds of data.frames equivalent
# to input_data. But you have to treat them with a different cutoff_letter
# each, so not only "G".
# Can you rewrite this code into one or multiple functions?




#### a possible solution ####

specialplus <- function(x, y) {
  if (is.na(x)) {
    v1 <- 0
  } else {
    v1 <- x
  }
  if (is.na(y)) {
    v2 <- 0.5
  } else {
    v2 <- y
  }
  return(v1 + v2)
}

`%specialplus%` <- specialplus

my_function <- function(x, cutoff_letter) {
  loop_res <- rep(NA, nrow(x))
  for (i in seq_len(nrow(x))) {
    current_row <- x[i,]
    if (current_row$id < cutoff_letter) {
      loop_res[i] <- current_row$value_A - current_row$value_B
    } else {
      loop_res[i] <- current_row$value_A %specialplus% current_row$value_B
    }
  }
  return(loop_res)
}

my_function(input_data, "G")
