input_data <- data.frame(
  id = LETTERS[1:26],
  valueI = runif(26),
  valueII = runif(26)
)

input_data$valueI[sample(1:26, 5)] <- NA
input_data$valueII[sample(1:26, 5)] <- NA

cutoff_letter <- "G"

loop_res <- rep(NA, nrow(input_data))
for (i in seq_len(nrow(input_data))) {
  current_row <- input_data[i,]
  if (current_row$id > cutoff_letter) {
    loop_res[i] <- current_row$valueI - current_row$valueII
  } else {
    if (is.na(current_row$valueI)) {
      v1 <- 0
    } else {
      v1 <- current_row$valueI
    }
    if (is.na(current_row$valueII)) {
      v2 <- 0.5
    } else {
      v2 <- current_row$valueII
    }
    loop_res[i] <- v1 + v2
  }
}

loop_res

### a possible solution

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
    if (current_row$id > cutoff_letter) {
      loop_res[i] <- current_row$valueI - current_row$valueII
    } else {
      loop_res[i] <- current_row$valueI %specialplus% current_row$valueII
    }
  }
  return(loop_res)
}

my_function(input_data, cutoff_letter)

