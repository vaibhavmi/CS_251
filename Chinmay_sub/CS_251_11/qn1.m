file = load('train.csv');

X_train = file(:,1);

Y_train = file(:,2);

X_train = [ones(5,1), X_train];

w = rand(2,1);

hold on;
plot(Y_train, X_train(:,2));

xlabel ("Feature");
ylabel ("Label");
title ("Graph");

print -dpdf "fig1.pdf";
plot_1 = w';