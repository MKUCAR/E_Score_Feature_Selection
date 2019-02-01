function rpb=Eta_kor(A)
%% ETA Korelasyon Katsayýsý Hesabý
% close all; clear; clc;
%% Formülasyon
% rpb=(Y'1-Y'0)/sy*(?(p0*p1))
% Y'0 ve Y'1: 0 ve 1 olarak kodlanan gözlemler için Y deðerlerinin
% ortalamasý
% sy: Y deðerlerinin standart sapmasý
% sy=(?(?Y^2+(?Y)^2/n)/n)
% p0: 0 deðeri atanan grubun gözlem sayýsýnýn toplam gözlem sayýsýna oraný
% p1: 1 deðeri atanan grubun gözlem sayýsýnýn toplam gözlem sayýsýna oraný

% Elde edilen korelasyon katsayýlarýnýn iþareti 0 ya da 1 olarak alýnan
% gruba göre deðiþir. Bu durumda, mutlak alýnarak yorum yapýlmasý daha
% uygun olunur. Eðer kategoriler sýralama ölçeðinde ise 1; daha yüksek
% performans/kalite ile ilgili kategori olarak alýnmalýdýr.

% rpb, temelde "Ýki ortalama arasýndaki farkýn önelilik testi" sonucundaki
% grup ortalamarýnýn deðiþimine iliþkin bir iliþki ölçüsüdür ve aþaðýdaki
% eþitlik ile verilen t istatistiði yardýmý ile de elde edilebilir.
% rpb=(?(t^2/(t^2+sd))=(?(t^2/(t^2+(n1+n2-2)))

% Benzer süreç "tek yönlü varyans analizi" için de söz konusudur ve tek
% yönlü varyans analizi tablosu istatistikliklerinden yararlanýlarak
% aþaðýdaki formül ile hesaplanabilir. Bazý kaynaklarda bu kuvvet ölçüsü
% epsilon ölçüsü olarak da tanýmlanýr.
% Eta=(?(GASD*(F-1))/(GASD*F+GÝSD));
%% Örnek Data
% GR=[0 1 1 0 1 0 1 0 1 0 1 1 0 1 0 1 0 0 1 0]'; % Grup etiketi
% GR=[2 1 1 2 1 2 1 2 1 2 1 1 2 1 2 1 2 2 1 2]'; % Grup etiketi
% Grup etiketi 1-0 ya da 1-2 olabilir.
% Y=[3 6 6 4 4 3 6 2 5 3 7 4 3 9 1 5 4 0 5 2]'; % Özellik Deðeri
% A=[Y GR];
% Öncelikle grup ortalamalarýný bulmamýz gerekiyor.
A=sortrows(A,2);
T=tabulate(A(:,2));
A0=[A(1:T(1,2),:)];
A1=[A(T(1,2)+1:end,:)];
% Ortalama
p0_ort=mean(A0(:,1)); % 0 grubunun ortalamasý
p1_ort=mean(A1(:,1)); % 1 grubunun ortalamasý
p0=T(1,2)/(T(1,2)+T(2,2));
p1=T(2,2)/(T(1,2)+T(2,2));
% Standart Sapma
% sy=std(A(:,1)); % Bu kullanýlmayacak.
% Standart Sapma P % Bu deðer kullanýlacak.
[Satir Sutun]=size(A);
Ort=mean(A(:,1));
for i=1:Satir
    St(i,1)=(A(i,1)-Ort)^2;
end
sy=sqrt(sum(St)/Satir);
rpb=(p1_ort-p0_ort)/sy*sqrt(p0*p1);
rpb=abs(rpb);
end