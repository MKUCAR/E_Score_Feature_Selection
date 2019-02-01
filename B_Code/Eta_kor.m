function rpb=Eta_kor(A)
%% ETA Korelasyon Katsay�s� Hesab�
% close all; clear; clc;
%% Form�lasyon
% rpb=(Y'1-Y'0)/sy*(?(p0*p1))
% Y'0 ve Y'1: 0 ve 1 olarak kodlanan g�zlemler i�in Y de�erlerinin
% ortalamas�
% sy: Y de�erlerinin standart sapmas�
% sy=(?(?Y^2+(?Y)^2/n)/n)
% p0: 0 de�eri atanan grubun g�zlem say�s�n�n toplam g�zlem say�s�na oran�
% p1: 1 de�eri atanan grubun g�zlem say�s�n�n toplam g�zlem say�s�na oran�

% Elde edilen korelasyon katsay�lar�n�n i�areti 0 ya da 1 olarak al�nan
% gruba g�re de�i�ir. Bu durumda, mutlak al�narak yorum yap�lmas� daha
% uygun olunur. E�er kategoriler s�ralama �l�e�inde ise 1; daha y�ksek
% performans/kalite ile ilgili kategori olarak al�nmal�d�r.

% rpb, temelde "�ki ortalama aras�ndaki fark�n �nelilik testi" sonucundaki
% grup ortalamar�n�n de�i�imine ili�kin bir ili�ki �l��s�d�r ve a�a��daki
% e�itlik ile verilen t istatisti�i yard�m� ile de elde edilebilir.
% rpb=(?(t^2/(t^2+sd))=(?(t^2/(t^2+(n1+n2-2)))

% Benzer s�re� "tek y�nl� varyans analizi" i�in de s�z konusudur ve tek
% y�nl� varyans analizi tablosu istatistikliklerinden yararlan�larak
% a�a��daki form�l ile hesaplanabilir. Baz� kaynaklarda bu kuvvet �l��s�
% epsilon �l��s� olarak da tan�mlan�r.
% Eta=(?(GASD*(F-1))/(GASD*F+G�SD));
%% �rnek Data
% GR=[0 1 1 0 1 0 1 0 1 0 1 1 0 1 0 1 0 0 1 0]'; % Grup etiketi
% GR=[2 1 1 2 1 2 1 2 1 2 1 1 2 1 2 1 2 2 1 2]'; % Grup etiketi
% Grup etiketi 1-0 ya da 1-2 olabilir.
% Y=[3 6 6 4 4 3 6 2 5 3 7 4 3 9 1 5 4 0 5 2]'; % �zellik De�eri
% A=[Y GR];
% �ncelikle grup ortalamalar�n� bulmam�z gerekiyor.
A=sortrows(A,2);
T=tabulate(A(:,2));
A0=[A(1:T(1,2),:)];
A1=[A(T(1,2)+1:end,:)];
% Ortalama
p0_ort=mean(A0(:,1)); % 0 grubunun ortalamas�
p1_ort=mean(A1(:,1)); % 1 grubunun ortalamas�
p0=T(1,2)/(T(1,2)+T(2,2));
p1=T(2,2)/(T(1,2)+T(2,2));
% Standart Sapma
% sy=std(A(:,1)); % Bu kullan�lmayacak.
% Standart Sapma P % Bu de�er kullan�lacak.
[Satir Sutun]=size(A);
Ort=mean(A(:,1));
for i=1:Satir
    St(i,1)=(A(i,1)-Ort)^2;
end
sy=sqrt(sum(St)/Satir);
rpb=(p1_ort-p0_ort)/sy*sqrt(p0*p1);
rpb=abs(rpb);
end