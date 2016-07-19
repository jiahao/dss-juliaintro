> library(dplyr);
> userid = c(381, 1291, 3992, 193942, 9493, 381,
    3992, 381, 3992, 193942)
> rating = c(5, 4, 4, 4, 5, 5, 5, 3, 5, 4)
> mycar = data.frame(rating, userid)
> summarize(group_by(mycar, userid), avgrating=mean(rating))
# A tibble: 5 x 2
  userid avgrating
   <dbl>     <dbl>
1    381  4.333333
2   1291  4.000000
3   3992  4.666667
4   9493  5.000000
5 193942  4.000000
