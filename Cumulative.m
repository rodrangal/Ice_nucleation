function [K,T]=Cumulative(Data,V)
D = Data(:)';
T = sort(D, 'descend');
T(T==0) = [];
K = zeros(1, length(T));
for i=1:length(T)
    N = sum(T(:)<T(i));
    K(1,i) = (log(length(T)) - log(N))./V;
end

plot (T,log10(K),'ko','MarkerFaceColor','m','MarkerSize',5)
xlabel('Temperature (ºC)','FontSize',25);
ylabel('Cumulative concentration (Log Nuclei/L)','FontSize',25);
set(gca,'fontsize',25)
legend('Sample 1','Sample 2','Sample 3','Sample 4','Sample 5','Location','Best');
axis ([-30 0 2 6])
hold on
A=log10(K);
R = [T;A];
R = R.';
save Results.out R -ASCII