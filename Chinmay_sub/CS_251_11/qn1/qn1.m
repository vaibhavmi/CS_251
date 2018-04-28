file = load('train.csv');

X_train = file(:,1);

Y_train = file(:,2);

X_train = [ones(10000,1), X_train];

w = rand(2,1);

hold on;
plot(X_train(:,2), Y_train, 'o');

xlabel ("Feature");
ylabel ("Label");
title ("Graph");

plot_1 = transpose(w); 

plot(X_train(:,2), transpose(transpose(w)*transpose(X_train)));
pause;

print -dpdf "fig1.pdf";
close

A_1 = inv(transpose(X_train) * X_train);
A_2 = transpose(X_train)*Y_train;

w_direct = A_1*A_2;

plot(X_train(:,2), Y_train, 'o');

plot(X_train(:,2), transpose(transpose(w_direct) * transpose(X_train)));
pause;

print -dpdf "fig2.pdf";
close

for j = 1:2,
	for i = 1:10000,
		var = transpose(w)*transpose(X_train(i,:));
		var = 0.00000001*var;
		x = var.*transpose(X_train(i,:));
		w = w-x;
		if(mod(i,100) == 0),
			plot(X_train(1:i, 2), transpose(transpose(w)*transpose(X_train(1:i,:))));
		endif,
	endfor,
	pause;
endfor,

file_1 = load("test.csv");

X_test = file_1(:,1);

Y_test = file_1(:,2);

X_test = [ones(1000,1), X_test];

Y_pred1 = X_test*w;

s1 = sqrt(mean((Y_test-Y_pred1).^2))

Y_pred2 = X_test*w_direct;

s2 = sqrt(mean((Y_test-Y_pred2).^2))