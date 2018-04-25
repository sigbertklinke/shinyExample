dat  <- data.frame(t1 = c(1, 2, 5, 3, 2, 1, 1, 3, 2 ,1),
							 		 t2 = c(4, 3, 6, 5, 2, 6, 1, 6, 5, 4),
									 t3 = c(9, 6, 7, 7, 5, 1, 8, 9, 6, 5))
friedman.test(as.matrix(dat))