#### Generate test data ####
input_data <- data.frame(
  id = LETTERS[1:26],
  value_A = runif(26),
  value_B = runif(26)
)
input_data$value_A[sample(1:26, 5)] <- NA
input_data$value_B[sample(1:26, 5)] <- NA

#### What the following code does ####
# This (very verbose) code creates a third column for input_data that 
# combines the two columns value_A and value_B in a somewhat complicated 
# manner.
# This is not a real world application, but resembles typical data-cleaning 
# operations.

# create an empty vector to store the loop's result 
# (so the values for the new column)
loop_res <- rep(NA, nrow(input_data))
# loop to somehow combine the two value columns
# for each row of the data.frame
for (i in seq_len(nrow(input_data))) {
  # get the row for the current loop cycle
  current_row <- input_data[i,]
  if (current_row$id < "G") {
    # if the id is smaller than the cutoff-letter "G",
    # then the combination of value_A and value_B is very simple
    loop_res[i] <- current_row$value_A + current_row$value_B
  } else {
    # else it gets more complicated, because NA values
    # have to be replaced with 0
    if (is.na(current_row$value_A)) {
      # NA values in value A get replaced with 0
      v_A <- 0
    } else {
      # normal values just stay as they are
      v_A <- current_row$value_A
    }
    if (is.na(current_row$value_B)) {
      # NA values in value B get replaced with 0
      v_B <- 0
    } else {
      # again: normal values just stay as they are
      v_B <- current_row$value_B
    }
    # finally the two modified values are added
    loop_res[i] <- v_A + v_B
  }
}

# result vector
loop_res

#### Your task ####
# Imagine you have to perform the operation implemented above for 
# hundreds of data.frames equivalent to input_data. 
# But you have to treat them with a different cutoff-letter each, 
# so not only "G".

# Can you rewrite this code into one or multiple functions?

#### Hints ####
# - Take a look at the input data to understand its structure!
# - What are the moving parts in this code, so what are the input 
#   arguments of your new function?
# - Does this code section where we replace NA by 0 remind you of 
#   something?
