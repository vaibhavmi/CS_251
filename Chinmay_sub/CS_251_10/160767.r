library(matrixStats)

num_samples <- 50000
X <- rexp(num_samples, 0.2)
plot_1 <- data.frame(X = seq(1, num_samples , 1), Y = sort(X))
plot(plot_1)

main_mean <- mean(X);
Y <- matrix(X, nrow = 500, ncol = 100, byrow = TRUE)

pdata <- rep(0, 500);
pdata <- matrix(pdata, nrow = 5, byrow = TRUE)

mean_a <- rep(0, 500);
staDev <- rep(0, 500);

mean_a <- rowMeans(Y);
staDev <- rowSds(Y);

for(j in 1:5)
{
	for(i in 1:100)
	{
		val <- round(Y[j, i]);

		if(val < 100)
		{
			pdata[j, val+1] = pdata[j, val+1] + 1/100;
		}
	}
}

xcols <- c(0:99)

cdata <- rep(0, 500)
cdata <- matrix(cdata, nrow = 5, byrow = TRUE)

cdata[,1] <- pdata[,1]

for(j in 1:5)
{
	for(i in 2:100){
	    cdata[j, i] = cdata[j, i-1] + pdata[j, i]
	}
}

mean_a[1:5]
staDev[1:5]

plot(xcols, pdata[1,], main="Density Graph Y1",type = "l", xlab="X", ylab="f(X)", col = "red");
plot(xcols, cdata[1,], main="Cumulative Graph Y1",type = "l", xlab="X", ylab="F(X)", col = "red");
plot(xcols, pdata[2,], main="Density Graph Y2",type = "l", xlab="X", ylab="f(X)", col = "green");
plot(xcols, cdata[2,], main="Cumulative Graph Y2",type = "l", xlab="X", ylab="F(X)", col = "green");
plot(xcols, pdata[3,], main="Density Graph Y3",type = "l", xlab="X", ylab="f(X)", col = "blue");
plot(xcols, cdata[3,], main="Cumulative Graph Y3",type = "l", xlab="X", ylab="F(X)", col = "blue");
plot(xcols, pdata[4,], main="Density Graph Y4",type = "l", xlab="X", ylab="f(X)", col = "orange");
plot(xcols, cdata[4,], main="Cumulative Graph Y4",type = "l", xlab="X", ylab="F(X)", col = "orange");
plot(xcols, pdata[5,], main="Density Graph Y5",type = "l", xlab="X", ylab="f(X)", col = "yellow");
plot(xcols, cdata[5,], main="Cumulative Graph Y5",type = "l", xlab="X", ylab="F(X)", col = "yellow");

tab <- table(round(mean_a));
plot(tab, "h", main = "Frequency of Means", xlab="Value", ylab="Frequency")

pdata_1 <- rep(0, 10);

for(i in 1:500)
{
	val <- round(mean_a[i])
	if(val < 10)
	{
		pdata_1[val+1] <- pdata_1[val+1] + 1/500;
	}
}

cdata_1 <- rep(0, 10);
cdata_1[1] = pdata_1[1];

for(i in 2:10){
    cdata_1[i] = cdata_1[i-1] + pdata_1[i]
}

xcols <- c(0:9);

plot(xcols, pdata_1, main="Density Graph Mmeans",type = "o", xlab="X", ylab="f(X)", col = "red");
plot(xcols, cdata_1, main="Cumulative Graph Means",type = "l", xlab="X", ylab="F(X)", col = "red");

mmean <- mean(mean_a);
mstdDev <- sd(mean_a);

main_mean
mmean
mstdDev